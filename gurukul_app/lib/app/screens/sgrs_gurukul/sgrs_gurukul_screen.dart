import 'package:flutter/material.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_all_gurukul_list.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_saints.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_type_term.dart';
import 'package:gurukul_app/app/providers/profile_provider.dart';
import 'package:gurukul_app/app/providers/serviceProvider.dart';
import 'package:gurukul_app/app/screens/base/base_state_full.dart';
import 'package:gurukul_app/app/screens/helper_screens/search_selection_screen.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/show_snack_bar.dart';
import 'package:gurukul_app/app/views/base_button.dart';
import 'package:provider/provider.dart';

import '../../views/category_type_drop_down.dart';

class SGRSGurukulScreen extends BasePage {
   SGRSGurukulScreen({Key? key}) : super(key: key);

  @override
  _SGRSGurukulScreenState createState() => _SGRSGurukulScreenState();
}

class _SGRSGurukulScreenState extends BaseState<SGRSGurukulScreen> {


  int? selectedStartDate;
  int? selectedEndDate;

  List<ResGetAllGurukulsList>? gurukuls = [];

  SearchModel? selectedGurukul;

  SearchModel? selectedGurukulOldSchool;

  List<ResGetSaintsList>? saints = [];

  SearchModel? selectedSaint1;
  SearchModel? selectedSaint2;

  List<ResGetTypeTermListElement>? purposes =[] ;
  List<ResGetTypeTermListElement>?  purpose = [] ;

  ResGetTypeTermListElement? selectedPurpose;

  DateTime? start;


  List<SearchModel>? gurukulList(){
    try {
      return gurukuls!.map((e) => SearchModel(title: '${e.gurukulName}',id: e.gurukulId ?? 0)).toList();
    } catch (e) {
      return [];
    }
  }

  List<SearchModel>? saintsList(){
    try {
      return saints!.map((e) => SearchModel(title: '${e.saintName}',id: e.saintId ?? 0)).toList();
    } catch (e) {
      return [];
    }
  }

  saveSGRSGurukul() async {
    try{

      final profile = Provider.of<ProfileProviderImpl>(context,listen: false);

      await profile.addSgrsGurukul();

      final res = profile.updateSgrsGurukul;

      handleRes(res: res!, context: context);

      if(res.state == Status.COMPLETED){
        Navigator.of(context).pop(true);
      }

    } catch(e){
      ShowSnackBar(context: context, message: e.toString());
    }

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {

      final service = Provider.of<ServiceProviderImpl>(context,listen: false);
      final profile = Provider.of<ProfileProviderImpl>(context,listen: false);

      await profile.getSgrsList();

      final sgrsData = profile.sgrsLists?.data?.data;


      setState(() {
        selectedStartDate = sgrsData?.startYear?.year;
        selectedEndDate = sgrsData?.endYear?.year;
      });


      try {
        service.getAllGurukulList().then((value) {

          setState(() {
            this.gurukuls = value;

            try {
              final selectedGurukul = gurukulList()?.where((element) => element.id == sgrsData?.gurukulId).first;
              final selectedGurukulOldSchool = gurukulList()?.where((element) => element.id == sgrsData?.pastGurukulId).first;

              this.selectedGurukul = selectedGurukul;
              this.selectedGurukulOldSchool = selectedGurukulOldSchool;

            } catch (e) {
              print(e);
            }
          });
        });
      } catch (e) {
        print(e);
      }

      service.getAllSaintList().then((value) {

        setState(() {
          this.saints = value;

          try {
            final selectedSaint1 = saintsList()?.where((element) => element.id == sgrsData?.saintId1).first;
            final selectedSaint2 = saintsList()?.where((element) => element.id == sgrsData?.saintId2).first;

            this.selectedSaint1 = selectedSaint1;
            this.selectedSaint2 = selectedSaint2;
          } catch (e) {
            print(e);
          }

        });
      });

      profile.getListTerms(term: TermCategories.PurposeType_Term).then((value) {

        setState(() {
          this.purposes = value;
          value?.forEach((element) {
            if(this.purpose?.length == 0 || this.purpose?.length == 1 )
              purpose?.add(element);
            print(purpose);

          });

          try {

            this.selectedPurpose = purpose?.where((element) => element.termCode == sgrsData?.purposeTypeTerm).first;
          } catch (e) {
            print(e);
          }
        });
      });

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SGRS Gurukul"),
      ),
      body: _body()

    );
  }

  Widget _body(){

    final profile = Provider.of<ProfileProviderImpl>(context,listen: false);

    final List<String> Years = profile.years.map((e) => e.toString()).toList();
    

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(20.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: kFlexibleSize(20.0)),
              Container(
                child: Text('$Sgrsgurukul', style: kTextBold),
              ),
              SizedBox(height: kFlexibleSize(10)),
              // CommonDropDown(
              //   data: purpose ?? [],
              //   hint: 'Select',
              //   selectedValue: selectedType,
              //   onChange: (value) {
              //     print(value);
              //     setState(() {
              //       selectedType = value;
              //     });
              //     profile.sgrsGurukulData?.purposeTypeTerm = value;
              //   },
              // ),
              CategoryTypeDropDown(
                data: purpose ?? [],
                hint: 'સેવા પસંદ કરો',
                selectedValue: selectedPurpose,
                onChange: (value) {
                  print(value?.termCode);
                  setState(() {
                    selectedPurpose = value;
                  });
                  profile.sgrsGurukulData?.purposeTypeTerm = value?.termCode;
                },
              ),
              SizedBox(height: kFlexibleSize(10)),

              if(selectedPurpose?.termCode == 'paststudent')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('$oldSchool', style: kTextBold),
                    ),
                    SizedBox(height: kFlexibleSize(10)),
                    SearchList(searchList: gurukulList() ?? [], selectedObject: (obj){
                      setState(() {
                        if(this.selectedGurukulOldSchool == obj){return;}
                        this.selectedGurukulOldSchool = obj;
                        profile.sgrsGurukulData?.pastGurukulId = obj.id;
                      });
                    }, hint: 'પસંદ કરો ગુરુકુલ',title: selectedGurukulOldSchool?.title,),
                    SizedBox(height: kFlexibleSize(10)),
                    Container(
                      child: Text('$yearSelection', style: kTextBold),
                    ),
                    SizedBox(height: kFlexibleSize(10)),
                   CommonDropDown(
                       data: Years,
                       hint: "શરૂઆતનું વર્ષ",
                       selectedValue: selectedStartDate.toString(),
                       onChange: (value){
                         setState(() {
                           selectedStartDate = int.parse(value!);
                         });

                         profile.sgrsGurukulData?.startYear = DateTime(selectedStartDate ?? 2022);
                       }
                   ),
                    SizedBox(height: kFlexibleSize(10)),
                    CommonDropDown(
                      data: Years,
                      hint: 'અંત વર્ષ',
                        selectedValue: selectedEndDate.toString(),
                        onChange: (value){
                          setState(() {
                            selectedEndDate = int.parse(value!);
                          });
                          profile.sgrsGurukulData?.endYear = DateTime(selectedEndDate ?? 2022);
                        }

                    ),
                    SizedBox(height: kFlexibleSize(10)),
                  ],
                ),

              if(selectedPurpose?.termCode?.isNotEmpty == true)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('$gurukulSelection', style: kTextBold),
                    ),
                    SizedBox(height: kFlexibleSize(10)),
                    SearchList(searchList: gurukulList() ?? [], selectedObject: (obj){
                      setState(() {
                        if(this.selectedGurukul == obj){return;}
                        this.selectedGurukul = obj;
                        profile.sgrsGurukulData?.gurukulId = obj.id;
                      });
                    }, hint: 'પસંદ કરો ગુરુકુલ',title: selectedGurukul?.title,),
                    SizedBox(height: kFlexibleSize(10)),
                    Divider(
                      height: 1,
                      thickness: 2,
                      color: Color(0xff576d7e).withOpacity(0.15),
                    ),
                    SizedBox(height: kFlexibleSize(10)),
                    Container(
                      child: Text('$saintSelection', style: kTextBold),
                    ),
                    SizedBox(height: kFlexibleSize(10)),
                    SearchList(searchList: saintsList() ?? [], selectedObject: (obj){
                      setState(() {
                        if(this.selectedSaint1 == obj){return;}
                        this.selectedSaint1 = obj;
                      });
                      profile.sgrsGurukulData?.saintId1 = obj.id;
                    }, hint: 'Select Saint 1',title: selectedSaint1?.title,),
                    SizedBox(height: kFlexibleSize(10)),
                    SearchList(searchList: saintsList() ?? [], selectedObject: (obj){
                      setState(() {
                        if(this.selectedSaint2 == obj){return;}
                        this.selectedSaint2 = obj;
                      });
                      profile.sgrsGurukulData?.saintId2 = obj.id;
                    }, hint: 'Select Saint 2',title: selectedSaint2?.title,),
                    SizedBox(height: kFlexibleSize(10)),
                  ],
                ),
              SizedBox(height: kFlexibleSize(10)),
              saveSGRSConsumer(),
              SizedBox(height: kFlexibleSize(10)),
            ],
          ),
        ),
      ),
    );

  }

  Widget saveSGRSConsumer() {
    return Consumer<ProfileProviderImpl>(builder: (_, profile, __) {

      final isLoading = profile.updateSgrsGurukul?.state == Status.LOADING;

      return BaseAppButton(title: 'SAVE', isLoading: isLoading,onTap: (){
        saveSGRSGurukul();

      },);
    },);
  }

}

class CommonDropDown extends StatefulWidget {
  CommonDropDown(
      {this.title,
        this.hint,
        required this.data,
        this.selectedValue,
        required this.onChange});

  final String? title;
  final String? hint;
  final List<String> data;
  late String? selectedValue;
  final Function(String?) onChange;

  @override
  _CommonDropDownState createState() => _CommonDropDownState();
}

class _CommonDropDownState extends State<CommonDropDown> {
  // var _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) Text('${widget.title}'),
        if (widget.title != null) SizedBox(height: 6),
        Container(
          padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(15)),
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: DropdownButton<String>(
              value: widget.data.contains(widget.selectedValue) ? widget.selectedValue : null,
              style: TextStyle(color: Colors.black),
              iconEnabledColor: Colors.black,
              isExpanded: true,
              iconSize: kFlexibleSize(30),
              underline: SizedBox(),
              items: widget.data.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
              hint: Text(
                widget.hint ?? '',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: kMediumFontSize,
                    fontWeight: FontWeight.w400),
              ),
              onChanged: (String? value) {
                widget.onChange(value);
                setState(() {
                  widget.selectedValue = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

