import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_family_member_byuser_id.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_type_term.dart';
import 'package:gurukul_app/app/providers/profile_provider.dart';
import 'package:gurukul_app/app/screens/base/base_state_full.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/image_picker_service.dart';
import 'package:gurukul_app/app/views/base_button.dart';
import 'package:gurukul_app/app/views/base_text_field.dart';
import 'package:gurukul_app/app/views/category_type_drop_down.dart';
import 'package:gurukul_app/app/views/common_images.dart';
import 'package:gurukul_app/app/views/network_image.dart';
import 'package:provider/provider.dart';

class EditFamilyScreen extends BasePage {

  EditFamilyScreen({Key? key});

  @override
  _EditFamilyScreenState createState() => _EditFamilyScreenState();
}

class _EditFamilyScreenState extends BaseState<EditFamilyScreen> {

  PickImage? pickImage;

  File? img;

  TextEditingController fNameController = TextEditingController();
  TextEditingController mNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  List<ResGetTypeTermListElement>? relations;

  ResGetTypeTermListElement? selectedRelations;

  List<ResGetTypeTermListElement>? occupations;

  ResGetTypeTermListElement? selectedOccupations;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {

      final profile = Provider.of<ProfileProviderImpl>(context,listen: false);

      final data = profile.familyMember;

      setState(() {
        fNameController.text = data.firstName ?? '';
        mNameController.text = data.middleName ?? '';
        lNameController.text = data.lastName ?? '';
        mobileController.text = data.mobileNo ?? '';
      });

      getNeededTerms();

    });

    pickImage = PickImage(
        context: context,
        updateFile: () async {
          try{

            print(pickImage?.imageFile?.path);

            setState(() {
              img = pickImage?.imageFile;
            });

          }catch(e){
            print("Exception:");
            print(e);
          }
        });
  }

  Future getNeededTerms() async {
    final profile = Provider.of<ProfileProviderImpl>(context,listen: false);

    final data = profile.familyMember;

    profile.getListTerms(term: TermCategories.RelationType_Term).then((value) {

      setState(() {
        this.relations = value;

        try {
          this.selectedRelations = value?.where((element) {
                    return element.termCode == data.relationTypeTerm;
                  }).first;
        } catch (e) {
          print(e);
        }

      });

    });

    profile.getListTerms(term: TermCategories.Occupation_Term).then((value) {

      setState(() {
        this.occupations = value;

        try {
          this.selectedOccupations = value?.where((element) {
            return element.termCode == data.occupationTerm;
          }).first;
        } catch (e) {
          print(e);
        }

      });

    });

  }

  updateFamily() async {
    try {
      final provider = Provider.of<ProfileProviderImpl>(context,listen: false);

      await provider.addFamilyMember(path: img?.path);

      handleRes(res: provider.updateFamily!, context: context);

      if(provider.updateFamily?.state == Status.COMPLETED){
        Navigator.of(context).pop();
      }

    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: true,
        title: Text('Family Details',
            textAlign: TextAlign.center, style: kAppbarTitle),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    final family = Provider.of<ProfileProviderImpl>(context).familyMember;
    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kFlexibleSize(20.0)),
            Center(
              child: Container(
                height: kFlexibleSize(100),
                width: kFlexibleSize(100),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    InkWell(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(kFlexibleSize(50)),
                        child: Container(
                          height: kFlexibleSize(100),
                          width: kFlexibleSize(100),
                          child: profileImage(data: family),
                        ) ,
                      ),
                      onTap: (){
                        pickImage?.selectImage();
                      },
                    ),
                    Container(
                      padding: EdgeInsets.all(kFlexibleSize(5)),
                      height: kFlexibleSize(25),
                      width: kFlexibleSize(25),
                      child: Center(child: cameraIconImage),
                      decoration: BoxDecoration(
                        boxShadow: kCommonShadow,
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(kFlexibleSize(25)/2))),
                    )
                  ],
                ),
              ),
            ),
            defaultSizedBox(),
            BaseTextField(hint: 'First Name', keyboardType: TextInputType.text,onChanged: (text){
              family.firstName = text;
            },controller: fNameController,),
            defaultSizedBox(),
            BaseTextField(
                hint: 'Middle Name', keyboardType: TextInputType.text,onChanged: (text){
                  family.middleName = text;
            },controller: mNameController,),
            defaultSizedBox(),
            BaseTextField(hint: 'Last Name', keyboardType: TextInputType.text,onChanged: (text){
              family.lastName = text;
            },controller: lNameController,),
            defaultSizedBox(),
            BaseTextField(
                hint: 'Phone Number', keyboardType: TextInputType.phone,onChanged: (text){
              family.mobileNo = text;
            },controller: mobileController,),
            defaultSizedBox(),

            Container(
              child: Text('Relation', style: kTextBold),
            ),
            defaultSizedBox(),
            CategoryTypeDropDown(
              data: relations ?? [],
              hint: 'Select Relation',
              selectedValue: selectedRelations,
              onChange: (value) {
                print(value?.termCode);
                setState(() {
                  selectedRelations = value;
                });
                family.relationTypeTerm = value?.termCode;
              },
            ),

            defaultSizedBox(),

            Container(
              child: Text('Occupation', style: kTextBold),
            ),
            defaultSizedBox(),
            CategoryTypeDropDown(
              data: occupations ?? [],
              hint: 'Select Occupation',
              selectedValue: selectedOccupations,
              onChange: (value) {
                print(value?.termCode);
                setState(() {
                  selectedOccupations = value;
                });
                family.occupationTerm = value?.termCode;
              },
            ),

            defaultSizedBox(height: 20.0),
            saveFamilyConsumer(),
            defaultSizedBox(height: 20.0),
          ],
        ),
      ),
    ));
  }

  Widget saveFamilyConsumer() {
    return Consumer<ProfileProviderImpl>(builder: (_, profile, __) {

      final isLoading = profile.updateFamily?.state == Status.LOADING;

      return BaseAppButton(title: 'Save', isLoading: isLoading,onTap: (){
        updateFamily();
      },);
    },);
  }

  Widget profileImage({FamilyMemberModel? data}) {

    print(data?.userImage);

    if(img != null){
      return Image.file(img!,fit: BoxFit.cover,);
    }

    return data?.userImage == null ? placeholderImage : CustomNetWorkImage(url: '${data?.userImage}',fit: BoxFit.cover,);
  }

  SizedBox defaultSizedBox({double? height}) =>
      SizedBox(height: kFlexibleSize(height ?? 10.0));
}
