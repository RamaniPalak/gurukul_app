import 'package:flutter/material.dart';
import 'package:gurukul_app/app/components/family_basic_detail_component.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_family_member_byuser_id.dart';
import 'package:gurukul_app/app/providers/profile_provider.dart';
import 'package:gurukul_app/app/screens/add_edit/edit_family_screen.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/no_data_found_view.dart';
import 'package:gurukul_app/app/views/loading_small.dart';
import 'package:provider/provider.dart';

import '../../utils/show_snack_bar.dart';
import '../../views/custom_popup_view.dart';
import 'family_pending_list.dart';

class FamilyListScreen extends StatefulWidget {
  const FamilyListScreen({Key? key}) : super(key: key);

  @override
  State<FamilyListScreen> createState() => _FamilyListScreenState();
}

class _FamilyListScreenState extends State<FamilyListScreen> {

  Future getPendingFamilyRequestList() async {

    final home = Provider.of<ProfileProviderImpl>(context, listen: false);

    await home.getListTerms(term: TermCategories.RelationType_Term).then((value) {

      // setState(() {
      //   this.relations = value;
      // });

    });

    home.familyPendingList?.state = Status.LOADING;

    await home.getFaimilyRequestList();

    if(home.familyPendingList?.state == Status.ERROR){
      ShowSnackBar(context: context, message: home.familyPendingList?.msg ?? "");
    }

    if (home.familyPendingList?.state == Status.COMPLETED && (home.familyPendingList?.data?.data?.list?.length ?? 0) > 0) {
      try {
        CustomPopup(context, title: 'Family Request', message: "Your have ${home.familyPendingList?.data?.data?.list?.length ?? 0} Requests", primaryBtnTxt: 'Show',secondaryBtnTxt: 'Cancel',primaryAction: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => FamilyPendingList(),));
        });
      } catch (e) {
        ShowSnackBar(context: context, message: e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Family Members'),
        actions: [
          IconButton(onPressed: (){
            final profile = Provider.of<ProfileProviderImpl>(context,listen: false);
            profile.isFamilyUpdating = false;
            profile.familyMember = FamilyMemberModel();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditFamilyScreen()));
          }, icon: Icon(Icons.add)),
          IconButton(onPressed: (){
            getPendingFamilyRequestList();
          }, icon: Icon(Icons.notification_important,color: Colors.white,))
        ],
      ),
      body: bodyConsumer(context),
    );
  }

  Widget bodyConsumer(BuildContext context) {

    final profile = Provider.of<ProfileProviderImpl>(context);

    final isLoading = profile.familyMembers?.state == Status.LOADING;

    if(isLoading){
      return Center(child: LoadingSmall(color: kPrimaryColor));
    }

    final data = profile.familyMembers?.data?.data?.list;

    if(data == null || data.length == 0){
      return Center(child: NoDataFoundView());
    }

    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return FamilyBasicDetailsScreen(
            onEdit: (){
              profile.isFamilyUpdating = true;
              // profile.familyMember = data[index];
              profile.finnFamilyMember(family: data[index]);
            },
            user: FamilyDetailModel(
            fullName: '${data[index].fullName}',
            mobile: '${data[index].mobileNo}',
            email: 'karan@info.com',
            relationShipStr: '${data[index].relationTypeTitle}',
            occupationStr: '${data[index].occupationTitle}',
            userImageURL: '${data[index].userImage}'
          ),);
        },
    );
  }
}
