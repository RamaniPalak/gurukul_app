import 'package:flutter/material.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_address.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_countries.dart';
import 'package:gurukul_app/app/providers/profile_provider.dart';
import 'package:gurukul_app/app/screens/base/base_state_full.dart';
import 'package:gurukul_app/app/screens/helper_screens/list_search_screen.dart';
import 'package:gurukul_app/app/screens/helper_screens/search_selection_screen.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/messages.dart';
import 'package:gurukul_app/app/utils/extensions.dart';
import 'package:gurukul_app/app/utils/show_snack_bar.dart';
import 'package:gurukul_app/app/views/base_button.dart';
import 'package:gurukul_app/app/views/base_text_field.dart';
import 'package:provider/provider.dart';

class EditAddressScreen extends BasePage {

  final String title;

  EditAddressScreen({required this.title});

  @override
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends BaseState<EditAddressScreen> {

  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController landMark1Controller = TextEditingController();
  TextEditingController landMark2Controller = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String? selectedCountry;

  String? selectedState;

  String? selectedCity;

   countryList(){
    try {
      final cool = ResCountries.data.countries?.map((e) {
        return e.country;
      }).toSet();
      final list = cool?.toList().map((e) => SearchModel(title: e)).toList();
      return list;
    } catch (e) {
      return [];
    }
  }

  stateList(){
    try {

      final myCountry = ResCountries.data.countries?.where((element) => element.country == selectedCountry).toList();

      final cool = myCountry?.map((e) {
        return e.state;
      }).toSet();

      final list = cool?.toList().map((e) => SearchModel(title: e)).toList();
      return list;
    } catch (e) {
      return [];
    }
  }

  cityList(){
    try {

      final myState = ResCountries.data.countries?.where((element) => element.state == selectedState).toList();

      final cool = myState?.map((e) {
        return e.city;
      }).toSet();

      final list = cool?.toList().map((e) => SearchModel(title: e)).toList();
      return list;
    } catch (e) {
      return [];
    }
  }

  saveAddress() async {
     try {
       final profile = Provider.of<ProfileProviderImpl>(context,listen: false);

       if(profile.editingAddressObject == null){
              if(profile.addressTypeEditing == AddressType.CURRENT){
                profile.currentAddressData = ResGetAddressData();
              }else{
                profile.permanentAddressData = ResGetAddressData();
              }
            }

       final editingAddressObject = profile.editingAddressObject;

       // if (editingAddressObject?.address1 == null ||
       //          editingAddressObject?.address2 == null ||
       //          editingAddressObject?.landMark1 == null ||
       //          editingAddressObject?.landMark2 == null ||
       //          editingAddressObject?.pinCode == null ||
       //          editingAddressObject?.phoneNo == null ||
       //          editingAddressObject?.state == null ||
       //          editingAddressObject?.city == null ||
       //          editingAddressObject?.country == null ||
       //          editingAddressObject!.address1!.isEmpty ||
       //          editingAddressObject.address2!.isEmpty ||
       //          editingAddressObject.landMark1!.isEmpty ||
       //          editingAddressObject.landMark2!.isEmpty ||
       //          editingAddressObject.pinCode!.isEmpty ||
       //          editingAddressObject.phoneNo!.isEmpty ||
       //          editingAddressObject.state!.isEmpty ||
       //          editingAddressObject.city!.isEmpty ||
       //          editingAddressObject.country!.isEmpty) {
       //        throw emptyFieldsMsg;
       //      }
       //
       // if(!editingAddressObject.phoneNo!.isValidMobile){
       //        throw 'Please enter valid mobile number.';
       //      }
       //
       // if(editingAddressObject.pinCode!.length > 6){
       //        throw 'Please enter valid pin number.';
       //      }

       editingAddressObject?.city = selectedCity;
       editingAddressObject?.state = selectedState;
       editingAddressObject?.country = selectedCountry;
       editingAddressObject?.address1 = address1Controller.text;
       editingAddressObject?.address2 = address2Controller.text;
       editingAddressObject?.landMark1 = landMark1Controller.text;
       editingAddressObject?.landMark2 = landMark2Controller.text;
       editingAddressObject?.pinCode = pinCodeController.text;
       editingAddressObject?.phoneNo = phoneController.text;

       await profile.updateAddress();

       final res = profile.updatedAddress;

       handleRes(res: res!, context: context);

       if(res.state == Status.COMPLETED){
              Navigator.of(context).pop();
            }
     } catch (e) {
       ShowSnackBar(context: context, message: e.toString());
     }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {

      final profile = Provider.of<ProfileProviderImpl>(context,listen: false);

      final data = profile.editingAddressObject;

      setState(() {
        address1Controller.text = data?.address1 ?? '';
        address2Controller.text = data?.address2 ?? '';
        landMark1Controller.text = data?.landMark1 ?? '';
        landMark2Controller.text = data?.landMark2 ?? '';
        pinCodeController.text = data?.pinCode ?? '';
        phoneController.text = data?.phoneNo ?? '';

        selectedCountry = data?.country;
        selectedState = data?.state;
        selectedCity = data?.city;

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: true,
        title:
        Text('${widget.title}', textAlign: TextAlign.center, style: kAppbarTitle),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(20.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: kFlexibleSize(20.0)),
              BaseTextField(
                  hint: 'Address 1', keyboardType: TextInputType.text,controller: address1Controller,),
              defaultSizedBox(),
              BaseTextField(
                  hint: 'Address 2', keyboardType: TextInputType.text,controller: address2Controller,),
              defaultSizedBox(),
              BaseTextField(
                  hint: 'LandMark 1', keyboardType: TextInputType.text,controller: landMark1Controller,),
              defaultSizedBox(),
              BaseTextField(
                  hint: 'LandMark 2', keyboardType: TextInputType.text,controller: landMark2Controller,),
              defaultSizedBox(),
              BaseTextField(
                  hint: 'Pincode', keyboardType: TextInputType.number,controller: pinCodeController,),
              defaultSizedBox(),
              BaseTextField(
                  hint: 'Phone Number', keyboardType: TextInputType.phone,controller: phoneController,),
              defaultSizedBox(),
              SearchList(searchList: countryList(), selectedObject: (obj){
                setState(() {
                  if(this.selectedCountry == obj.title){return;}
                  this.selectedCountry = obj.title;
                  this.selectedState = null;
                  this.selectedCity = null;
                });
              }, hint: 'Country',title: selectedCountry,),
              defaultSizedBox(),
              SearchList(searchList: stateList(), selectedObject: (obj){
                setState(() {
                  if(this.selectedState == obj.title){return;}
                  this.selectedState = obj.title;
                  this.selectedCity = null;
                });
              }, hint: 'State',title: selectedState,),
              defaultSizedBox(),
              SearchList(searchList: cityList(), selectedObject: (obj){
                setState(() {
                  this.selectedCity = obj.title;
                });
              }, hint: 'City',title: selectedCity,),
              defaultSizedBox(height: 20.0),
              updateAddressConsumer(),
              defaultSizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget updateAddressConsumer() {

     return Consumer<ProfileProviderImpl>(builder: (_, profile, __) {

       final isLoading = profile.updatedAddress?.state == Status.LOADING;
       return BaseAppButton(title: 'SAVE', isLoading: isLoading,onTap: (){
         if(isLoading){return;}
         saveAddress();
       },);
     },);
  }

  SizedBox defaultSizedBox({double? height}) =>
      SizedBox(height: kFlexibleSize(height ?? 10.0));
}

final dummySearchList = [
  ListSearchModel(reqID: 0, title: 'dummy 1', isSelected: false),
  ListSearchModel(reqID: 0, title: 'dummy 2', isSelected: false),
  ListSearchModel(reqID: 0, title: 'dummy 3', isSelected: false),
  ListSearchModel(reqID: 0, title: 'dummy 4', isSelected: false),
  ListSearchModel(reqID: 0, title: 'dummy 5', isSelected: false),
  ListSearchModel(reqID: 0, title: 'dummy 6', isSelected: false),
  ListSearchModel(reqID: 0, title: 'dummy 7', isSelected: false),
  ListSearchModel(reqID: 0, title: 'dummy 8', isSelected: false),
  ListSearchModel(reqID: 0, title: 'dummy 9', isSelected: false),
];
