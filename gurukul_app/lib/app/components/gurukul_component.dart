import 'package:flutter/material.dart';
import 'package:gurukul_app/app/components/common_components.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/views/common_images.dart';

class GurukulComponent extends StatelessWidget {
  const GurukulComponent({Key? key,required this.gurukul, this.isEditing}) : super(key: key);

  final GurukulDetailsModel gurukul;

  final Function? isEditing;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                '${gurukul.gurukulName ?? ''}',
                maxLines: 2,
                style: kTitleStyle,
              ),
            ),
            IconButton(onPressed: (){
              if(isEditing != null){
                isEditing!();
              }
            }, icon: Container(child: editIconImage,height: kFlexibleSize(15))),
          ],
        ),
        defaultSizeBoxHeight(height: 5),
        keyValueComponent(
            key: 'Purpose', value: '${gurukul.purposeText ?? ''}', isCenter: false),
        defaultSizeBoxHeight(height: 5),
        if(gurukul.purposeTypeStr == 'paststudent')
        Column(
          children: [
            keyValueComponent(
                key: 'Standard', value: '${gurukul.standardStr ?? ''}', isCenter: false),
            defaultSizeBoxHeight(height: 5),
            keyValueComponent(
                key: 'Division', value: '${gurukul.divisionStr ?? ''}', isCenter: false),
            defaultSizeBoxHeight(height: 5),
          ],
        ),
        Row(
          children: [
            Row(
              children: [
                Text('Start Year : ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: kSmallFontSize,
                        fontWeight: FontWeight.w400)),
                Text('${gurukul.startDate?.year.toString() ?? ''}',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: kSmallFontSize,
                        fontWeight: FontWeight.w700))
              ],
            ),
            defaultSizeBoxWidth(width: 15.0),
            Row(
              children: [
                Text('End Year : ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: kSmallFontSize,
                        fontWeight: FontWeight.w400)),
                Text('${gurukul.endDate?.year.toString() ?? ''}',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: kSmallFontSize,
                        fontWeight: FontWeight.w700))
              ],
            )
          ],
        ),
        defaultSizeBoxHeight(height: 5),
        keyValueComponent(
            key: 'Saint 1 Details', value: '${gurukul.saint1Str ?? ''}', isCenter: false),
        defaultSizeBoxHeight(height: 5),
        keyValueComponent(
            key: 'Saint 2 Details', value: '${gurukul.saint2Str ?? ''}', isCenter: false),
        defaultSizeBoxHeight(height: 10),
        Container(
          height: 1,
          color: Colors.black.withOpacity(0.1),
        )
      ],
    );
  }
}

class GurukulDetailsModel{
  final String? gurukulName;
  final String? purposeText;
  final String? purposeTypeId;
  final String? purposeTypeStr;
  final String? standardStr;
  final String? divisionStr;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? saint1Id;
  final String? saint1Str;
  final String? saint2Id;
  final String? saint2Str;

  GurukulDetailsModel(
      {this.gurukulName,
      this.purposeText,
      this.purposeTypeId,
      this.purposeTypeStr,
      this.startDate,
      this.endDate,
      this.saint1Id,
      this.saint1Str,
      this.saint2Id,
      this.saint2Str,
        this.standardStr,
        this.divisionStr
      });
}