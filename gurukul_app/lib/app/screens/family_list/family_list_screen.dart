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

class FamilyListScreen extends StatelessWidget {
  const FamilyListScreen({Key? key}) : super(key: key);

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
          }, icon: Icon(Icons.add))
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
