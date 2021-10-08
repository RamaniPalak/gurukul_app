import 'package:flutter/material.dart';
import 'package:gurukul_app/app/components/common_components.dart';
import 'package:gurukul_app/app/screens/add_edit/add_edit_address_screen.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/views/common_images.dart';
import 'package:gurukul_app/app/views/loading_small.dart';

class AddressComponent extends StatelessWidget {
  const AddressComponent({Key? key, required this.title, required this.isLoading,required this.address, required this.editClick}) : super(key: key);

  final String title;

  final bool isLoading;

  final AddressDetailModel address;

  final Function editClick;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '$title',
                maxLines: 1,
                style: kTitleStyle,
              ),
            ),
            if(!isLoading)
            IconButton(
                onPressed: () {
                  editClick();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditAddressScreen(title: title,),
                  ));
                },
                icon: Container(
                  child: editIconImage,
                  height: kFlexibleSize(15),
                )),
          ],
        ),
        defaultSizeBoxHeight(height: 5),

        if(isLoading)
        LoadingSmall(color: kPrimaryColor),

        if(!isLoading)
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '${address.formattedAddress}',
              textAlign: TextAlign.start,
              style: kDetailsStyle,
            ),
            defaultSizeBoxHeight(height: 5),
            keyValueComponent(key: 'City', value: '${address.cityTypeStr ?? ''}', isCenter: false),
            defaultSizeBoxHeight(height: 5),
            keyValueComponent(key: 'State', value: '${address.stateTypeStr ?? ''}', isCenter: false),
            defaultSizeBoxHeight(height: 5),
            keyValueComponent(key: 'Country', value: '${address.countryTypeStr ?? ''}', isCenter: false),
            defaultSizeBoxHeight(height: 10),
            Container(
              height: 1,
              color: Colors.black.withOpacity(0.1),
            )
          ],
        ),
        defaultSizeBoxHeight(height: 5),

      ],
    );
  }
}

class AddressDetailModel{
  final String? address1;
  final String? address2;
  final String? landMark1;
  final String? landMark2;
  final String? pinCode;
  final String? phone;
  final String? addressTypeStr;
  final String? addressTypeId;
  final String? countryTypeId;
  final String? countryTypeStr;
  final String? stateTypeId;
  final String? stateTypeStr;
  final String? cityTypeId;
  final String? cityTypeStr;

  AddressDetailModel(
      {this.address1,
      this.address2,
      this.landMark1,
      this.landMark2,
      this.pinCode,
      this.phone,
      this.addressTypeStr,
      this.addressTypeId,
      this.countryTypeId,
      this.countryTypeStr,
      this.stateTypeId,
      this.stateTypeStr,
      this.cityTypeId,
      this.cityTypeStr});

  String get formattedAddress {

    String addressLine = '';

    if(address1 != null){
      addressLine += '$address1, ';
    }
    if(address2 != null){
      addressLine += '$address2, ';
    }
    if(landMark1 != null){
      addressLine += '$landMark1, ';
    }
    if(landMark2 != null){
      addressLine += '$landMark2, ';
    }
    if(pinCode != null){
      addressLine += '$pinCode. ';
    }

   return addressLine;
  }

}