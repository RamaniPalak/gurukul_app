import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gurukul_app/app/components/address_componenet.dart';
import 'package:gurukul_app/app/components/common_components.dart';
import 'package:gurukul_app/app/components/gurukul_component.dart';
import 'package:gurukul_app/app/components/profession_component.dart';
import 'package:gurukul_app/app/components/user_basic_detail_component.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_gurukul_list.dart';
import 'package:gurukul_app/app/providers/profile_provider.dart';
import 'package:gurukul_app/app/screens/add_edit/all_gurukul_screen.dart';
import 'package:gurukul_app/app/screens/add_edit/edit_gurukul_screen.dart';
import 'package:gurukul_app/app/screens/base/base_state_full.dart';
import 'package:gurukul_app/app/screens/family_list/family_list_screen.dart';
import 'package:gurukul_app/app/screens/helper_screens/side_menu_screen.dart';
import 'package:gurukul_app/app/screens/hobbies_skills/hobbies_and_skills.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/extensions.dart';
import 'package:gurukul_app/app/utils/no_data_found_view.dart';
import 'package:gurukul_app/app/views/custom_popup_view.dart';
import 'package:gurukul_app/app/views/loading_small.dart';
import 'package:provider/provider.dart';

import '../../data/entity/res_entity/res_get_type_term.dart';
import '../../utils/show_snack_bar.dart';
import '../../views/category_type_drop_down.dart';
import '../family_list/family_pending_list.dart';

class ProfileScreen extends BasePage {
  ProfileScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<ProfileScreen> {

  List<ResGetTypeTermListElement>? relations;

  getUserData() async {
    final home = Provider.of<ProfileProviderImpl>(context, listen: false);
    await home.userBasicDetails();
    handleRes(
        res: home.userRes!,
        context: context,
        retryCall: () {
          getUserData();
        });
  }

  getCurrentAddress() async {
    final home = Provider.of<ProfileProviderImpl>(context, listen: false);
    await home.getAddress(addressType: AddressType.CURRENT);
    handleRes(
        res: home.currentAddressRes!,
        context: context,
        retryCall: () {
          getCurrentAddress();
        });
  }

  getPermanentAddress() async {
    final home = Provider.of<ProfileProviderImpl>(context, listen: false);
    await home.getAddress(addressType: AddressType.PERMANENT);
    handleRes(
        res: home.permanentAddressRes!,
        context: context,
        retryCall: () {
          getCurrentAddress();
        });
  }

  getProfessionDetail() async {
    final home = Provider.of<ProfileProviderImpl>(context, listen: false);
    await home.getProfessionDetail();
  }

  getGurukulList() async {
    final home = Provider.of<ProfileProviderImpl>(context, listen: false);
    await home.getGurukulList(isForAll: true);
  }


  getPendingFamilyRequestList() async {

    final home = Provider.of<ProfileProviderImpl>(context, listen: false);

    await home.getListTerms(term: TermCategories.RelationType_Term).then((value) {

      setState(() {
        this.relations = value;
      });

    });

    await home.getFaimilyRequestList();

    if ((home.familyPendingList?.data?.data?.list?.length ?? 0) > 0) {
      try {
        CustomPopup(context, title: 'Family Request', message: "Your have ${home.familyPendingList?.data?.data?.list?.length ?? 0} Requests", primaryBtnTxt: 'Show',secondaryBtnTxt: 'Cancel',primaryAction: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => FamilyPendingList(),));
        });
        } catch (e, s) {
        print(s);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      getUserData();
      getCurrentAddress();
      getPermanentAddress();
      getProfessionDetail();
      getGurukulList();
      getPendingFamilyRequestList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: _body,
    );
  }

  Widget get _body {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: kFlexibleSize(112),
            color: kPrimaryColor,
          ),
          SafeArea(
            child: Column(
              children: [
                //User Basic Details
                userBasicDetailConsumer(),
                defaultSizeBoxHeight(height: 10),
                //Addresses
                bgContainer(
                    widget: Column(
                  children: [
                    currentAddressConsumer(),
                    defaultSizeBoxHeight(height: 10.0),
                    permanentAddressConsumer()
                  ],
                )),
                defaultSizeBoxHeight(height: 10),
                //profession
                professionConsumer(),
                defaultSizeBoxHeight(height: 10),

                //Gurukuls
                gurukulComponentConsumer(),

                defaultSizeBoxHeight(height: 10),
                titleIconButtons(
                    title: 'Nikol Gurukul',
                    onTap: () {
                      Navigator.of(context).pushNamed(kNikolGurukulFormRoute);
                    }),


                defaultSizeBoxHeight(height: 10),
                titleIconButtons(
                    title: 'Hobbies & Skills',
                    onTap: () {
                      Provider.of<ProfileProviderImpl>(context, listen: false)
                          .getSkillHobbyByUserId();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HobbiesAndSkills(),
                      ));
                    }),
                defaultSizeBoxHeight(height: 10),

                titleIconButtons(
                    title: 'Family Details',
                    onTap: () {
                      Provider.of<ProfileProviderImpl>(context, listen: false)
                          .getFamilyMemberByUserId();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FamilyListScreen(),
                      ));
                    }),

                defaultSizeBoxHeight(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //User Profile Data Consumer
  Widget userBasicDetailConsumer() {
    return Consumer<ProfileProviderImpl>(
      builder: (_, profile, __) {
        final isLoading = profile.userRes?.state == Status.LOADING;

        final hasError = profile.userRes?.state == Status.ERROR ||
            profile.userRes?.state == Status.UNAUTHORISED;

        if (hasError) {
          return bgContainer(
              widget: NoDataFoundView(
                  retryCall: () {
                    getUserData();
                  },
                  title: 'No Profile Data Found'));
        }

        final data = profile.userRes?.data?.data;

        return UserBasicDetailsComponent(
          editing: () {
            profile.fillUserData(userData: data);
          },
          isLoading: isLoading,
          user: UserDetailsModel(
              userImageURL: data?.userImage,
              fullName: '${data?.fullName ?? ''}',
              mobile: '${data?.mobile.checkForNull() ?? ''}',
              email: '${data?.email.checkForNull() ?? ''}',
              birthDate: data?.birthDay,
              marriageDate: data?.marriageDay,
              gender: data?.genderType,
              whatsAppMobile: data?.whatsAppNo,
              bloodGroupStr: data?.bloodGroupTitle.checkForNull(),
              religionStr: data?.religionTitle.checkForNull(),
              maritalStatusStr: data?.maritalStatusTitle.checkForNull(),
              castTypeStr: data?.castTitle.checkForNull(),
              subCastTypeStr: data?.subCastTitle.checkForNull()),
        );
      },
    );
  }

  Widget currentAddressConsumer() {
    return Consumer<ProfileProviderImpl>(
      builder: (_, profile, __) {
        final isLoading = profile.currentAddressRes?.state == Status.LOADING;

        final hasError = profile.currentAddressRes?.state == Status.ERROR ||
            profile.currentAddressRes?.state == Status.UNAUTHORISED;

        if (hasError) {
          return bgContainer(
              widget: NoDataFoundView(
                  retryCall: () {
                    getCurrentAddress();
                  },
                  title: 'No Current Address Found'));
        }

        final address = profile.currentAddressRes?.data?.data;

        return AddressComponent(
            title: 'Current Address',
            isLoading: isLoading,
            editClick: () {
              profile.addressTypeEditing = AddressType.CURRENT;
              profile.fillAddress(address: address);
            },
            address: AddressDetailModel(
                address1: address?.address1,
                address2: address?.address2,
                landMark1: address?.landMark1,
                landMark2: address?.area,
                pinCode: address?.pinCode,
                addressTypeStr: address?.addressTypeTerm,
                countryTypeStr: address?.country,
                cityTypeStr: address?.city,
                stateTypeStr: address?.state));
      },
    );
  }

  Widget permanentAddressConsumer() {
    return Consumer<ProfileProviderImpl>(
      builder: (_, profile, __) {
        final isLoading = profile.permanentAddressRes?.state == Status.LOADING;

        final hasError = profile.permanentAddressRes?.state == Status.ERROR ||
            profile.permanentAddressRes?.state == Status.UNAUTHORISED;

        if (hasError) {
          return bgContainer(
              widget: NoDataFoundView(
                  retryCall: () {
                    getPermanentAddress();
                  },
                  title: 'No Permanent Address Found'));
        }

        final address = profile.permanentAddressRes?.data?.data;

        return AddressComponent(
            title: 'Permanent Address',
            isLoading: isLoading,
            editClick: () {
              profile.addressTypeEditing = AddressType.PERMANENT;
              profile.fillAddress(address: address);
            },
            address: AddressDetailModel(
                address1: address?.address1,
                address2: address?.address2,
                landMark1: address?.landMark1,
                landMark2: address?.area,
                pinCode: address?.pinCode,
                addressTypeStr: address?.addressTypeTerm,
                countryTypeStr: address?.country,
                cityTypeStr: address?.city,
                stateTypeStr: address?.state));
      },
    );
  }

  Widget professionConsumer() {
    return Consumer<ProfileProviderImpl>(
      builder: (_, profile, __) {
        final isLoading = profile.occupation?.state == Status.LOADING;

        final hasError = profile.occupation?.state == Status.ERROR ||
            profile.occupation?.state == Status.UNAUTHORISED;

        if (hasError) {
          return bgContainer(
              widget: NoDataFoundView(
                  retryCall: () {
                    getProfessionDetail();
                  },
                  title: 'No Profession Found'));
        }

        final data = profile.occupation?.data?.data;

        return bgContainer(
          widget: ProfessionComponent(
            isLoading: isLoading,
            occupationTerm: data?.occupationTerm ?? '',
            occupationTitle: (data?.occupationTitle ?? ''),
            businessTitle: (data?.industryTitle ?? ''),
            jobTitle: (data?.jobTypeTitle ?? ''),
          ),
        );
      },
    );
  }

  Widget gurukulComponentConsumer() {
    return Consumer<ProfileProviderImpl>(
      builder: (_, profile, __) {
        final isLoading = profile.gurukulLists?.state == Status.LOADING;

        final hasError = profile.gurukulLists?.state == Status.ERROR;

        GurukulModel? gurukul1;

        try {
          gurukul1 = profile.gurukulLists?.data?.data?.list?[0];
        } catch (e) {
          print(e);
        }

        GurukulModel? gurukul2;

        try {
          gurukul2 = profile.gurukulLists?.data?.data?.list?[1];
        } catch (e) {
          print(e);
        }

        return Container(
          margin: EdgeInsets.symmetric(horizontal: kFlexibleSize(10.0)),
          padding: EdgeInsets.only(
              top: kFlexibleSize(15.0),
              left: kFlexibleSize(15.0),
              right: kFlexibleSize(15.0)),
          decoration: BoxDecoration(
              // boxShadow: kCommonShadow,
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'Gurukuls',
                    style: kTitleStyle,
                  )),
                  if (!isLoading)
                    IconButton(
                        onPressed: () {
                          profile.gurukulModel = GurukulModel();
                          profile.isGurukulUpdating = false;
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                            builder: (context) => EditGurukulScreen(),
                          ))
                              .then((value) {
                            // if(value == true){
                            //   getGurukulList();
                            // }
                          });
                        },
                        icon: Icon(Icons.add_circle))
                ],
              ),
              defaultSizeBoxHeight(height: 5),
              if (isLoading)
                LoadingSmall(
                  color: kPrimaryColor,
                ),
              if (!isLoading && gurukul1 != null ||
                  gurukul2 != null && !hasError)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (gurukul1 != null)
                      GurukulComponent(
                        isEditing: () {
                          profile.fillGurukulModel(gurukul: gurukul1!);
                          profile.isGurukulUpdating = true;
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                            builder: (context) => EditGurukulScreen(),
                          ))
                              .then((value) {
                            // if(value == true){
                            //   getGurukulList();
                            // }
                          });
                        },
                        gurukul: GurukulDetailsModel(
                            gurukulName: '${gurukul1.gurukulName ?? ''}',
                            endDate: gurukul1.startYear,
                            startDate: gurukul1.endYear,
                            purposeText: '${gurukul1.purposeTitle ?? ''}',
                            // purposeTypeStr: 'Seva',
                            saint1Str: '${gurukul1.saint1Name ?? ''}',
                            saint2Str: '${gurukul1.saint2Name ?? ''}',
                            purposeTypeStr: gurukul1.purposeTypeTerm ?? '',
                            divisionStr: gurukul1.standardDivisionTitle ?? '',
                            standardStr: gurukul1.admissionStandardTitle ?? ''),
                      ),
                    defaultSizeBoxHeight(height: 10),
                    if (gurukul2 != null)
                      GurukulComponent(
                        isEditing: () {
                          profile.fillGurukulModel(gurukul: gurukul2!);
                          profile.isGurukulUpdating = true;
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                            builder: (context) => EditGurukulScreen(),
                          ))
                              .then((value) {
                            // if(value == true){
                            //   getGurukulList();
                            // }
                          });
                        },
                        gurukul: GurukulDetailsModel(
                            gurukulName: '${gurukul2.gurukulName ?? ''}',
                            endDate: gurukul2.startYear,
                            startDate: gurukul2.endYear,
                            purposeText: '${gurukul2.purposeTitle ?? ''}',
                            // purposeTypeStr: 'Seva',
                            saint1Str: '${gurukul2.saint1Name ?? ''}',
                            saint2Str: '${gurukul2.saint2Name ?? ''}',
                            purposeTypeStr: gurukul2.purposeTypeTerm ?? '',
                            divisionStr: gurukul2.standardDivisionTitle ?? '',
                            standardStr: gurukul2.admissionStandardTitle ?? ''),
                      ),
                    defaultSizeBoxHeight(height: 10),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AllGurukulScreen(),
                          ));
                        },
                        child: Text(
                          'See All',
                          style: kTitleStyle,
                        )),
                  ],
                ),
              if (hasError)
                NoDataFoundView(
                  title: 'No Gurukuls Found',
                  retryCall: () {
                    getGurukulList();
                  },
                ),
              defaultSizeBoxHeight(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget titleIconButtons(
      {required String title, required GestureTapCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: bgContainer(
          widget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              '$title',
              maxLines: 2,
              style: kTitleStyle,
            ),
          ),
          Icon(
            Icons.chevron_right,
            size: kFlexibleSize(25),
          )
        ],
      )),
    );
  }

  Container bgContainer({required Widget widget}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: kFlexibleSize(10.0)),
      padding: EdgeInsets.all(kFlexibleSize(15.0)),
      decoration: BoxDecoration(
          // boxShadow: kCommonShadow,
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0)),
      child: widget,
    );
  }
}


