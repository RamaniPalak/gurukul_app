import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_type_term.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_user_basic_details.dart';
import 'package:gurukul_app/app/providers/profile_provider.dart';
import 'package:gurukul_app/app/screens/base/base_state_full.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/extensions.dart';
import 'package:gurukul_app/app/utils/image_picker_service.dart';
import 'package:gurukul_app/app/utils/messages.dart';
import 'package:gurukul_app/app/utils/show_snack_bar.dart';
import 'package:gurukul_app/app/views/base_button.dart';
import 'package:gurukul_app/app/views/base_text_field.dart';
import 'package:gurukul_app/app/views/category_type_drop_down.dart';
import 'package:gurukul_app/app/views/common_images.dart';
import 'package:gurukul_app/app/views/date_pick_view.dart';
import 'package:gurukul_app/app/views/network_image.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends BasePage {
  EditProfileScreen();

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends BaseState<EditProfileScreen> {
  DateTime? selectedBirthDate;

  PickImage? pickImage;

  File? img;

  late ScrollController controller;

  TextEditingController fNameController = TextEditingController();
  TextEditingController mNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController whatsAppMobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Gender gender = Gender.NONE;

  List<ResGetTypeTermListElement>? bloodGroup;

  List<ResGetTypeTermListElement>? religions;

  List<ResGetTypeTermListElement>? maritalStatus;

  List<ResGetTypeTermListElement>? castList;

  List<ResGetTypeTermListElement>? subCastList;

  ResGetTypeTermListElement? selectedBloodGroup;

  ResGetTypeTermListElement? selectedReligion;

  ResGetTypeTermListElement? selectedMaritalStatus;

  ResGetTypeTermListElement? selectedCast;

  ResGetTypeTermListElement? selectedSubCast;

  bool isTermsFetched = false;

  bool isTop = true;

  _scrollListener() {

    // if (controller.position.extentAfter <= kFlexibleSize(382)) {
    //   if (isTop) {
    //     setState(() {
    //       isTop = false;
    //     });
    //   }
    // } else {
    //   if (!isTop) {
    //     setState(() {
    //       isTop = true;
    //     });
    //   }
    // }
  }

  updateProfile() async {
    try {
      final provider = Provider.of<ProfileProviderImpl>(context,listen: false);

      provider.userData?.firstName = fNameController.text;
      provider.userData?.middleName = mNameController.text;
      provider.userData?.lastName = lNameController.text;
      provider.userData?.whatsAppNo = whatsAppMobileController.text;
      provider.userData?.email = emailController.text;
      provider.userData?.genderTypeTerm = genderValues.reverse[this.gender];
      provider.userData?.dateOfBirth = selectedBirthDate?.toIso8601String();
      provider.userData?.bloodGroupTerm = selectedBloodGroup?.termCode;
      provider.userData?.religionTerm = selectedReligion?.termCode;
      provider.userData?.maritalStatusTerm = selectedMaritalStatus?.termCode;
      provider.userData?.castTerm = selectedCast?.termCode;
      provider.userData?.subCastTerm = selectedSubCast?.termCode;

      await provider.updateUserBasicDetails(path: img?.path);

      handleRes(res: provider.updatedUserRes!, context: context);

      if(provider.updatedUserRes?.state == Status.COMPLETED){
        Navigator.of(context).pop();
      }

    } catch (e) {
      ShowSnackBar(context: context, message: e.toString());
    }
  }

  Future getNeededTerms() async {
    final profile = Provider.of<ProfileProviderImpl>(context,listen: false);

    final data = profile.userData;

    profile.getListTerms(term: TermCategories.BloodGroup_Term).then((value) {
      if (mounted) {
        setState(() {
                this.bloodGroup = value;

                try {
                  this.selectedBloodGroup = value?.where((element) {
                            return element.termCode == data?.bloodGroupTerm;
                          }).first;
                } catch (e) {
                  print(e);
                }

              });
      }
    });

    profile.getListTerms(term: TermCategories.Religion_Term).then((value) {
      if (mounted) {
        setState(() {
                this.religions = value;

                try {
                  this.selectedReligion = value?.where((element) {
                            return element.termCode == data?.religionTerm;
                          }).first;
                } catch (e) {
                  print(e);
                }

              });
      }
    });

    profile.getListTerms(term: TermCategories.MaritalStatus_Term).then((value) {
      if (mounted) {
        setState(() {
                this.maritalStatus = value;
                try {
                  this.selectedMaritalStatus = value?.where((element) {
                    return element.termCode == data?.maritalStatusTerm;
                  }).first;
                } catch (e) {
                  print(e);
                }
              });
      }
    });

    profile.getListTerms(term: TermCategories.Cast_Term).then((value) {
      if (mounted) {
        setState(() {
                this.castList = value;

                try {
                  this.selectedCast = value?.where((element) {
                            return element.termCode == data?.castTerm;
                          }).first;

                } catch (e) {
                  print(e);
                  isTermsFetched = true;
                }finally{
                  getAndSetSubCast();
                }

              });
      }
    });

  }

  Future getAndSetSubCast() async {

    final profile = Provider.of<ProfileProviderImpl>(context,listen: false);

    final data = profile.userData;

    if (selectedCast?.termCode != null){

      selectedSubCast = null;

      final subCasts = await profile.getListSubTerms(term: selectedCast?.termCode ?? '');

      final mySubCast = subCasts?.where((element) {
        return element.termCode == data?.subCastTerm;
      });

      if (mounted) {
        setState(() {

                this.subCastList = subCasts;
                isTermsFetched = true;
                try {
                  this.selectedSubCast = mySubCast?.first;
                } catch (e) {}

              });
      }

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = new ScrollController()..addListener(_scrollListener);

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {

      final profile = Provider.of<ProfileProviderImpl>(context,listen: false);

      final data = profile.userData;

      setState(() {
        fNameController.text = data?.firstName ?? '';
        mNameController.text = data?.middleName ?? '';
        lNameController.text = data?.lastName ?? '';
        mobileController.text = data?.mobile ?? '';
        whatsAppMobileController.text = data?.whatsAppNo ?? '';
        emailController.text = data?.email ?? '';

        gender = data?.genderType ?? Gender.NONE;

        selectedBirthDate = data?.birthDay;

      });

      await getNeededTerms();

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

  @override
  void dispose() {
    super.dispose();
    fNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: true,
        title: Text('Basic Details',
            textAlign: TextAlign.center, style: kAppbarTitle),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {

    final data = Provider.of<ProfileProviderImpl>(context,listen: false).userData;

    return SingleChildScrollView(
      controller: controller,
      physics: ClampingScrollPhysics(),
      child: SafeArea(
          child: Container(
        child: Stack(
          children: [
            AnimatedContainer(duration: Duration(milliseconds: 300),child: Container(
              height: kFlexibleSize(60),
              color: kPrimaryColor,
            ),height: !isTop ? 0:kFlexibleSize(60) ,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(20.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: kFlexibleSize(10),
                  ),
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
                                  child: profileImage(data: data),
                              ) ,
                            ),
                            onTap: (){
                              pickImage?.selectImage();
                            },
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5, right: 5),
                            padding: EdgeInsets.all(kFlexibleSize(5)),
                            height: kFlexibleSize(25),
                            width: kFlexibleSize(25),
                            child: cameraIconImage,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(kFlexibleSize(25)/2))),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: kFlexibleSize(20.0)),
                  BaseTextField(
                      hint: 'First Name', keyboardType: TextInputType.text,controller: fNameController,),
                  defaultSizedBox(),
                  BaseTextField(
                      hint: 'Middle Name', keyboardType: TextInputType.text,controller: mNameController,),
                  defaultSizedBox(),
                  BaseTextField(
                      hint: 'Last Name', keyboardType: TextInputType.text,controller: lNameController,),
                  defaultSizedBox(),
                  BaseTextField(
                      hint: 'Mobile Number', keyboardType: TextInputType.phone,controller: mobileController,enabled: false,),
                  defaultSizedBox(),
                  BaseTextField(
                      hint: 'Whatsapp Number',
                      keyboardType: TextInputType.phone,controller: whatsAppMobileController,),
                  defaultSizedBox(),
                  BaseTextField(
                      hint: 'Email', keyboardType: TextInputType.emailAddress,controller: emailController,),
                  defaultSizedBox(),
                  DatePickView(
                    minDate: DateTime.now(),
                    title: selectedBirthDate == null ? 'BirthDate' : selectedBirthDate!.toStrCommonFormat() ,
                    selectedDate: (date) {
                      setState(() {
                        selectedBirthDate = date;
                      });
                    },
                    passedDate: selectedBirthDate,
                  ),
                  SizedBox(height: kFlexibleSize(20.0)),
                  Container(
                    child: Text('Gender', style: kTextBold),
                  ),
                  SizedBox(height: kFlexibleSize(6.0)),
                  // RadioGroup(),
                  genderRadio(),
                  SizedBox(height: kFlexibleSize(15.0)),

                  Container(
                    child: Text('Blood Group', style: kTextBold),
                  ),
                  defaultSizedBox(),
                  CategoryTypeDropDown(
                    data: bloodGroup ?? [],
                    hint: 'Blood Group',
                    selectedValue: selectedBloodGroup,
                    onChange: (value) {
                      print(value?.termCode);
                      setState(() {
                        selectedBloodGroup = value;
                      });
                    },
                  ),

                  defaultSizedBox(),
                  Container(
                    child: Text('Religion', style: kTextBold),
                  ),
                  defaultSizedBox(),

                  CategoryTypeDropDown(
                    data: religions ?? [],
                    hint: 'Religion',
                    selectedValue: selectedReligion,
                    onChange: (value) {
                      setState(() {
                        selectedReligion = value;
                      });
                    },
                  ),

                  defaultSizedBox(),
                  Container(
                    child: Text('Marital Status', style: kTextBold),
                  ),
                  defaultSizedBox(),

                  CategoryTypeDropDown(
                    data: maritalStatus ?? [],
                    hint: 'Religion',
                    selectedValue: selectedMaritalStatus,
                    onChange: (value) {
                      setState(() {
                        selectedMaritalStatus = value;
                      });
                    },
                  ),

                  defaultSizedBox(),
                  Container(
                    child: Text('Select Cast', style: kTextBold),
                  ),
                  defaultSizedBox(),

                  CategoryTypeDropDown(
                    data: castList ?? [],
                    hint: 'Select Cast',
                    selectedValue: selectedCast,
                    onChange: (value) {
                      setState(() {
                        selectedCast = value;
                        this.subCastList = null;
                      });

                      getAndSetSubCast();
                    },
                  ),

                  defaultSizedBox(),
                  Container(
                    child: Text('Select Sub Cast', style: kTextBold),
                  ),
                  defaultSizedBox(),

                  // if (subCastList != null)
                  CategoryTypeDropDown(
                    data: subCastList ?? [],
                    hint: 'Select Sub Cast',
                    selectedValue: selectedSubCast,
                    onChange: (value) {
                      setState(() {
                        selectedSubCast = value;
                      });
                    },
                  ),

                  defaultSizedBox(),
                  defaultSizedBox(height: 20.0),
                  updateProfileButtonConsumer(),
                  defaultSizedBox(height: 20.0),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget updateProfileButtonConsumer() {

    return Consumer<ProfileProviderImpl>(builder: (_, profile, __) {

      bool isLoading = profile.updatedUserRes?.state == Status.LOADING;

      return BaseAppButton(
        title: 'SAVE',
        isLoading: isLoading,
        onTap: () {
          if(!isTermsFetched){return;}
          if(isLoading){return;}
          updateProfile();
        },
      );
    },);
  }

  Widget profileImage({ResUserBasicDetailsData? data}) {

    if(img != null){
      return Image.file(img!,fit: BoxFit.cover,);
    }

    return data?.userImage == null ? placeholderImage : CustomNetWorkImage(url: '${data?.userImage}',fit: BoxFit.cover,);
  }

  SizedBox defaultSizedBox({double? height}) =>
      SizedBox(height: kFlexibleSize(height ?? 10.0));

  Widget genderRadio(){

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio<Gender>(
              activeColor: kPrimaryColor,
              value: Gender.MALE,
              groupValue: gender,
              onChanged: (val) {
                setState(() {
                  gender = val!;
                });
              },
            ),
            Text(
              'Male',
              style: new TextStyle(
                  fontSize: kSmallFontSize, fontFamily: kRegularFonts),
            ),

            Radio<Gender>(
              activeColor: kPrimaryColor,
              value: Gender.FEMALE,
              groupValue: gender,
              onChanged: (val) {
                setState(() {
                  gender = val!;
                });
              },
            ),
            Text(
              'Female',
              style: new TextStyle(
                  fontSize: kSmallFontSize, fontFamily: kRegularFonts),
            ),

            Radio<Gender>(
              activeColor: kPrimaryColor,
              value: Gender.OTHERS,
              groupValue: gender,
              onChanged: (val) {
                setState(() {
                  gender = val!;
                });
              },
            ),
            Text(
              'Other',
              style: new TextStyle(
                  fontSize: kSmallFontSize, fontFamily: kRegularFonts),
            ),
          ],
        ),
      ],
    );
  }

}

