import 'package:flutter/material.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_skill_hobby_by_userId.dart';
import 'package:gurukul_app/app/providers/profile_provider.dart';
import 'package:gurukul_app/app/screens/base/base_state_full.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/views/base_button.dart';
import 'package:gurukul_app/app/views/loading_small.dart';
import 'package:provider/provider.dart';

class HobbiesAndSkills extends BasePage {
  HobbiesAndSkills({Key? key});

  @override
  _HobbiesAndSkillsState createState() => _HobbiesAndSkillsState();
}

class _HobbiesAndSkillsState extends BaseState<HobbiesAndSkills> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hobbies & skills'),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          hobbiesAndSkillsConsumer(),
          Padding(
            padding: EdgeInsets.all(kFlexibleSize(15.0)),
            child: saveHobbiesAndSkillsConsumer(),
          )
        ],
      ),
    );
  }

  Widget saveHobbiesAndSkillsConsumer() {

    return Consumer<ProfileProviderImpl>(builder: (_, profile, __) {

      final bool isLoading = profile.updateHobbiesAndSkill?.state == Status.LOADING;

      return BaseAppButton(title: 'SAVE',
        isLoading: isLoading,onTap: (){
        if(isLoading){return;}
        profile.updateHobbySkillByUserId();
      },);
    },);

  }

  Widget hobbiesAndSkillsConsumer() {
    return Consumer<ProfileProviderImpl>(builder: (_, profile, __) {

      final isLoading = profile.hobbiesAndSkill?.state == Status.LOADING;

      if(isLoading){
        return Expanded(child: LoadingSmall(color: kPrimaryColor,));
      }

      final data = profile.hobbiesAndSkill?.data?.data;

      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            hobbiesConsumer(objects: data?.hobby ?? []),
            skillsConsumer(objects: data?.skill ?? []),
          ],
        ),
      );
    },);
  }

  Widget hobbiesConsumer({required List<Hobby> objects}){
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(kFlexibleSize(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hobbies',
              maxLines: 1,
              style: kTitleStyle,
            ),
            SizedBox(
              height: kFlexibleSize(10),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: chipList(objects: objects),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget skillsConsumer({required List<Hobby> objects}){
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(kFlexibleSize(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Skills',
              maxLines: 1,
              style: kTitleStyle,
            ),
            SizedBox(
              height: kFlexibleSize(10),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: chipList(objects: objects),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> getWidgets({required List<Hobby> objects}){

    List<Widget> myWidgets = [];

    objects.forEach((element) {
      myWidgets.add(HobbiesChip(object: element));
    });

    return myWidgets;
  }

  chipList({required List<Hobby> objects}) {
    return Wrap(
      spacing: kFlexibleSize(6.0),
      // runSpacing: 6.0,
      children: getWidgets(objects: objects),
    );
  }
}

class HobbiesChip extends StatefulWidget {
  const HobbiesChip({Key? key,required this.object}) : super(key: key);

  final Hobby object;

  @override
  _HobbiesChipState createState() => _HobbiesChipState();
}

class _HobbiesChipState extends State<HobbiesChip> {


  @override
  Widget build(BuildContext context) {

    final isSelected = widget.object.isSelected == 1;

    return Chip(
      labelPadding: EdgeInsets.symmetric(horizontal: kFlexibleSize(7.0)),
      onDeleted: (){

        if(isSelected){
          setState(() {
            widget.object.isSelected = 0;
          });
        }else{
          setState(() {
            widget.object.isSelected = 1;
          });
        }

      },
      deleteIconColor: isSelected ? Colors.white : kPrimaryColor,
      deleteIcon: isSelected ? Icon(Icons.cancel_rounded,size: kFlexibleSize(18),) : Icon(Icons.add_circle,size: kFlexibleSize(18),),
      shape: StadiumBorder(
          side: BorderSide(color: kPrimaryColor)
      ),
      label: Text(
        '${widget.object.title ?? ''}',
        style: TextStyle(
            fontSize: kSmallFontSize,
            color: isSelected ? Colors.white : kPrimaryColor,
            fontWeight: FontWeight.w500
        ),
      ),
      backgroundColor: isSelected ? kPrimaryColor : Colors.transparent,
      shadowColor: Colors.grey[60],
    );
  }
}
