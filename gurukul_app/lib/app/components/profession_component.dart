import 'package:flutter/material.dart';
import 'package:gurukul_app/app/components/common_components.dart';
import 'package:gurukul_app/app/screens/add_edit/edit_profession_screen.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/views/common_images.dart';
import 'package:gurukul_app/app/views/loading_small.dart';

class ProfessionComponent extends StatelessWidget {
  const ProfessionComponent({Key? key, required this.isLoading,required this.occupationTerm,required this.occupationTitle,required this.jobTitle,required this.businessTitle}) : super(key: key);

  final bool isLoading;
  final String occupationTerm;
  final String occupationTitle;
  final String jobTitle;
  final String businessTitle;

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
                'Profession Details',
                maxLines: 1,
                style: kTitleStyle,
              ),
            ),
            if(!isLoading)
            IconButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfessionScreen(),));
              },
                icon: Container(child: editIconImage,height: kFlexibleSize(15),)),
          ],
        ),
        defaultSizeBoxHeight(height: 5),

        if(isLoading)
        LoadingSmall(color: kPrimaryColor),

        if(!isLoading)
        Column(
          children: [
            keyValueComponent(
                key: 'Occupation', value: '${this.occupationTitle}', isCenter: false),
            defaultSizeBoxHeight(height: 5),
            if(occupationTerm == 'job')
            keyValueComponent(
                key: 'Job', value: '${this.jobTitle}', isCenter: false),
            defaultSizeBoxHeight(height: 5),
            if(occupationTerm == 'business')
            keyValueComponent(
                key: 'Business', value: '${this.businessTitle}', isCenter: false),
          ],
        )
      ],
    );
  }
}
