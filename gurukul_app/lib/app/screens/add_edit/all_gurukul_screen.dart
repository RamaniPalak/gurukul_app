import 'package:flutter/material.dart';
import 'package:gurukul_app/app/components/gurukul_component.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_gurukul_list.dart';
import 'package:gurukul_app/app/providers/profile_provider.dart';
import 'package:gurukul_app/app/screens/add_edit/edit_gurukul_screen.dart';
import 'package:gurukul_app/app/screens/base/base_state_full.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/views/loading_small.dart';
import 'package:provider/provider.dart';

class AllGurukulScreen extends BasePage {
  AllGurukulScreen();

  @override
  _AllGurukulScreenState createState() => _AllGurukulScreenState();
}

class _AllGurukulScreenState extends BaseState<AllGurukulScreen> {

  getGurukulList() async{
    final home = Provider.of<ProfileProviderImpl>(context,listen: false);
    await home.getGurukulList(isForAll: true);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Gurukul List'),
        actions: [
          IconButton(onPressed: (){
            final profile = Provider.of<ProfileProviderImpl>(context,listen: false);
            profile.gurukulModel = GurukulModel();
            profile.isGurukulUpdating = false;
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditGurukulScreen(),)).then((value) {
              if(value == true){
                getGurukulList();
              }
            });
          }, icon: Icon(Icons.add))
        ],
      ),
      body: gurukulConsumer(),
    );
  }

  Widget gurukulConsumer() {

    return Consumer<ProfileProviderImpl>(builder: (_, profile, __) {

      final isLoading = profile.gurukulLists?.state == Status.LOADING;

      if(isLoading){
        return Center(child: LoadingSmall(color: kPrimaryColor,));
      }

      final gurukuls = profile.gurukulLists?.data?.data?.list;

      return ListView.builder(
        itemCount: gurukuls?.length ?? 0,
        itemBuilder: (context, index) {

          final gurukul = gurukuls![index];

          return Container(
            margin: EdgeInsets.symmetric(horizontal: kFlexibleSize(10.0),vertical: kFlexibleSize(5.0)),
            padding: EdgeInsets.only(
                top: kFlexibleSize(15.0),
                left: kFlexibleSize(15.0),
                right: kFlexibleSize(15.0)),
            decoration: BoxDecoration(
              // boxShadow: kCommonShadow,
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0)),
            child: GurukulComponent(
              isEditing: (){
                profile.fillGurukulModel(gurukul: gurukul);
                profile.isGurukulUpdating = true;
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditGurukulScreen(),)).then((value) {
                  if(value == true){
                    getGurukulList();
                  }
                });
              },
              gurukul: GurukulDetailsModel(
                  gurukulName: '${gurukul.gurukulName ?? ''}',
                  endDate: gurukul.startYear,
                  startDate: gurukul.endYear,
                  purposeText: '${gurukul.purposeTitle ?? ''}',
                  // purposeTypeStr: 'Seva',
                  saint1Str: '${gurukul.saint1Name ?? ''}',
                  saint2Str: '${gurukul.saint2Name ?? ''}',
                  purposeTypeStr: gurukul.purposeTypeTerm ?? '',
                  divisionStr: gurukul.standardDivisionTitle ?? '',
                  standardStr: gurukul.admissionStandardTitle ?? ''
              ),),
          );
        },
      );
    },);
  }
}
