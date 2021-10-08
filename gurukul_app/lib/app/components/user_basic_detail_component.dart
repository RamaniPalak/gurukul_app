import 'package:flutter/material.dart';
import 'package:gurukul_app/app/components/common_components.dart';
import 'package:gurukul_app/app/screens/add_edit/edit_profile_screen.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/extensions.dart';
import 'package:gurukul_app/app/views/common_images.dart';
import 'package:gurukul_app/app/views/loading_small.dart';
import 'package:gurukul_app/app/views/network_image.dart';

class UserBasicDetailsComponent extends StatelessWidget {
  const UserBasicDetailsComponent({Key? key,required this.isLoading, required this.user, required this.editing}) : super(key: key);

  final bool isLoading;

  final UserDetailsModel user;

  final Function editing;

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
                    top: kFlexibleSize(60),
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

                  if(isLoading)
                  Container(
                    height: kFlexibleSize(300),
                      child: Center(child: LoadingSmall(color: kPrimaryColor,size: 30,))),

                  if(!isLoading)
                    Column(
                      children: [
                        Center(
                          child: Hero(
                            tag: 'user_image',
                            child: Container(
                                height: kFlexibleSize(120),
                                width: kFlexibleSize(120),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(kFlexibleSize(60)),
                                  child: Container(
                                    color: Colors.white,
                                    child: user.userImageURL == null ? placeholderImage : CustomNetWorkImage(url: '${user.userImageURL}',fit: BoxFit.cover,),
                                  ),
                                )),
                          ),
                        ),
                        defaultSizeBoxHeight(height: 5),
                        Text(
                          '${user.fullName}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: kMediumFontSize,
                              fontWeight: FontWeight.w700),
                        ),
                        defaultSizeBoxHeight(height: 5),
                        prefixTitle('${user.mobile ?? 'N/A'}', callIconImage),
                        defaultSizeBoxHeight(height: 5),
                        prefixTitle('${user.whatsAppMobile ?? 'N/A'}', whatsappIconImage),
                        defaultSizeBoxHeight(height: 5),
                        prefixTitle('${user.email ?? 'N/A'}', mailIconImage),
                        defaultSizeBoxHeight(height: 15),
                        Container(
                          height: kFlexibleSize(55),
                          color: Colors.black.withOpacity(0.1),
                          padding: EdgeInsets.symmetric(vertical: 1),
                          child: Row(
                            children: [
                              boxes(
                                  hasPadding: true,
                                  key: 'Birthdate',
                                  value: '${user.birthDate?.toStrCommonFormat().checkForNull() ?? 'N/A'}'),
                              boxes(
                                  hasPadding: true, key: 'Gender', value: '${genderValues.reverse[user.gender ?? Gender.NONE]}'),
                              boxes(
                                  hasPadding: true,
                                  key: 'Blood Group',
                                  value: '${user.bloodGroupStr ?? '?'}'),
                              boxes(
                                  hasPadding: false,
                                  key: 'Religion',
                                  value: '${user.religionStr ?? '?'}'),
                            ],
                          ),
                        ),
                        defaultSizeBoxHeight(height: 15),
                        keyValueComponent(key: 'Marital Status', value: '${user.maritalStatusStr ?? ''}'),
                        defaultSizeBoxHeight(height: 5),
                        keyValueComponent(key: 'Cast Type', value: '${user.castTypeStr ?? '-'}'),
                        defaultSizeBoxHeight(height: 5),
                        keyValueComponent(
                            key: 'Subcast Type', value: '${user.subCastTypeStr ?? '-'}'),
                        defaultSizeBoxHeight(height: 20)
                      ],
                    ),

                  if(!isLoading)
                  //Edit Button
                  Positioned(
                      top: kFlexibleSize(60) + 5,
                      right: 10,
                      child: IconButton(
                        icon: Container(child: editIconImage,height: kFlexibleSize(15),),
                        onPressed: () {
                          editing();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfileScreen(),));
                        },
                      )),
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

class UserDetailsModel{
  final String? userImageURL;
  final String? fullName;
  final String? mobile;
  final String? whatsAppMobile;
  final String? email;
  final DateTime? birthDate;
  final Gender? gender;
  final String? bloodGroupStr;
  final String? religionStr;
  final String? maritalStatusStr;
  final String? castTypeStr;
  final String? subCastTypeStr;
  final int? bloodGroupId;
  final int? religionId;
  final int? maritalStatusId;
  final int? castTypeId;
  final int? subCastTypeId;

  UserDetailsModel(
      {this.userImageURL,
      this.fullName,
      this.mobile,
      this.whatsAppMobile,
      this.email,
      this.birthDate,
      this.gender,
      this.bloodGroupStr,
      this.religionStr,
      this.maritalStatusStr,
      this.castTypeStr,
      this.subCastTypeStr,
      this.bloodGroupId,
      this.religionId,
      this.maritalStatusId,
      this.castTypeId,
      this.subCastTypeId});
}