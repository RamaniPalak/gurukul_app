import 'package:flutter/material.dart';
import 'package:gurukul_app/app/components/common_components.dart';
import 'package:gurukul_app/app/screens/add_edit/edit_family_screen.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/views/common_images.dart';
import 'package:gurukul_app/app/views/network_image.dart';

class FamilyBasicDetailsScreen extends StatelessWidget {
  const FamilyBasicDetailsScreen({Key? key,required this.user, required this.onEdit}) : super(key: key);

  final FamilyDetailModel user;

  final Function onEdit;

  @override
  Widget build(BuildContext context) {
    return components(context);
  }


  Container components(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(10.0)),
        child: Column(
          children: [
            Container(
              // color: Colors.white,
              child: Stack(
                children: [
                  Positioned(
                    top: kFlexibleSize(15),
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          // boxShadow: kCommonShadow,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  Column(
                    children: [
                      defaultSizeBoxHeight(height: 15),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                              height: kFlexibleSize(70),
                              width: kFlexibleSize(70),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(kFlexibleSize(35)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    // boxShadow: kCommonShadow
                                  ),

                                  child: CustomNetWorkImage(url: '${user.userImageURL ?? ''}',fit: BoxFit.cover,),
                                ),
                              )),
                          Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:EdgeInsets.only(right: 44),
                                    child: Text(
                                      '${user.fullName ?? ''}',
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: kRegularFontSize,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  defaultSizeBoxHeight(height: 5),
                                  prefixTitle('${user.mobile ?? ''}', callIconImage,isCenter: false),
                                  // defaultSizeBoxHeight(height: 5),
                                  // prefixTitle('${user.email ?? ''}', mailIconImage,isCenter: false),
                                ],
                              )
                          )
                        ],
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(15)),
                        child: Column(
                          children: [
                            keyValueComponent(key: 'Relationship', value: '${user.relationShipStr ?? ''}',isCenter: false),
                            defaultSizeBoxHeight(height: 5),
                            keyValueComponent(key: 'Occupation', value: '${user.occupationStr ?? ''}',isCenter: false),
                          ],
                        ),
                      ),
                      defaultSizeBoxHeight(height: 15)
                    ],
                  ),
                  Positioned(
                      top: 5,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(44),
                          // boxShadow: kCommonShadow
                        ),
                        child: Center(
                          child: IconButton(
                            icon: Container(child: editIconImage,height: kFlexibleSize(15),),
                            onPressed: () {
                              onEdit();
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditFamilyScreen(),));
                            },
                          ),
                        ),
                      ))
                ],
              ),
            )
          ],
        ));
  }

  Widget boxes(
      {required bool hasPadding, required String key, required String value}) {
    return Expanded(
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(right: hasPadding ? 1 : 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$key',
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(fontSize: kSmallFontSize),
            ),
            Text(
              '$value',
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  fontSize: kSmallFontSize,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }

}

class FamilyDetailModel{
  final String? userImageURL;
  final String? fullName;
  final String? mobile;
  final String? email;
  final int? relationShipId;
  final String? relationShipStr;
  final int? occupationId;
  final String? occupationStr;

  FamilyDetailModel(
      {this.userImageURL,
      this.fullName,
      this.mobile,
      this.email,
      this.relationShipId,
      this.relationShipStr,
      this.occupationId,
      this.occupationStr});
}
