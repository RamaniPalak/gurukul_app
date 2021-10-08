import 'package:flutter/material.dart';
import 'package:gurukul_app/app/components/common_components.dart';
import 'package:gurukul_app/app/data/data_service/server_configs.dart';
import 'package:gurukul_app/app/providers/serviceProvider.dart';
import 'package:gurukul_app/app/screens/base/base_state_full.dart';
import 'package:gurukul_app/app/screens/helper_screens/cms_screen.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/utils/user_prefs.dart';
import 'package:gurukul_app/app/views/common_images.dart';
import 'package:gurukul_app/app/views/network_image.dart';
import 'package:provider/provider.dart';

class SideMenuScreen extends BasePage {
  SideMenuScreen({Key? key}) : super(key: key);

  @override
  _SideMenuScreenState createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends BaseState<SideMenuScreen> {
  List<String> screens = [
    'About Us',
    'Privacy Policy',
    'Terms & Conditions',
    'Logout'
  ];

  late LocalUser? user;

  bool isUserSet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {

      final getUser = await UserPrefs.shared.getUser;

      setState(() {
        user = getUser;
        isUserSet = true;
        print(ServerConfigs.imageBaseURL + (user?.image ?? ''));
      });

    });

  }

  @override
  Widget build(BuildContext context) {
    if(!isUserSet){
      return Container();
    }
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: kPrimaryColor,
            child: Padding(
              padding: EdgeInsets.only(
                  top: kFlexibleSize(30), bottom: kFlexibleSize(15)),
              child: SafeArea(
                bottom: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: kFlexibleSize(80),
                        width: kFlexibleSize(80),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CustomNetWorkImage(url: ServerConfigs.imageBaseURL + (user?.image ?? '')),
                        )),
                    defaultSizeBoxHeight(height: 5),
                    Text(
                      '${user?.fullName ?? ''}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: kMediumFontSize,
                          fontWeight: FontWeight.w700),
                    ),
                    defaultSizeBoxHeight(height: 5),
                    prefixTitle('${user?.mobile ?? ''}', callIconImageWhite,
                        color: Colors.white),
                    defaultSizeBoxHeight(height: 5),
                    prefixTitle('${user?.email ?? ''}', mailIconImageWhite,
                        color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            // physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(
                top: kFlexibleSize(10), bottom: kFlexibleSize(10)),
            itemCount: screens.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {

                  if(index != screens.length - 1){

                    var cms = CMSType.aboutUs;

                    if(index == 0){
                      cms = CMSType.aboutUs;
                    }else if(index == 1){
                      cms = CMSType.privacyPolicy;
                    }else{
                      cms = CMSType.terms;
                    }

                    Provider.of<ServiceProviderImpl>(context,listen: false).getCmsPages(type: cms);

                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CMSScreen(type: cms),));

                    return;
                  }
                  showLogoutPopup(context);

                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: kFlexibleSize(21)),
                  height: kFlexibleSize(60.0),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                        width: 1, color: Colors.black.withOpacity(0.1)),
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${screens[index]}',
                        style: TextStyle(
                            fontSize: kMediumFontSize,
                            fontWeight: FontWeight.w400),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        size: kFlexibleSize(15.0),
                      )
                    ],
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
