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
import 'package:gurukul_app/app/utils/extensions.dart';
import 'package:gurukul_app/app/views/base_button.dart';
import 'package:gurukul_app/app/views/category_type_drop_down.dart';
import 'package:gurukul_app/app/views/date_pick_view.dart';
import 'package:provider/provider.dart';

class EditGurukulScreen extends BasePage {
  EditGurukulScreen({Key? key});

  @override
  _EditGurukulScreenState createState() => _EditGurukulScreenState();
}

class _EditGurukulScreenState extends BaseState<EditGurukulScreen> {
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  String? purpose;

  List<ResGetAllGurukulsList>? gurukuls = [];

  SearchModel? selectedGurukul;

  List<ResGetSaintsList>? saints = [];

  SearchModel? selectedSaint1;
  SearchModel? selectedSaint2;

  List<ResGetTypeTermListElement>? purposes;

  ResGetTypeTermListElement? selectedPurpose;

  List<ResGetTypeTermListElement>? standards;

  ResGetTypeTermListElement? selectedStandard;

  List<ResGetTypeTermListElement>? divisions;

  ResGetTypeTermListElement? selectedDivision;

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

  saveGurukul() async {
    final profile = Provider.of<ProfileProviderImpl>(context,listen: false);

    await profile.addUserGurukul();

    final res = profile.updateGurukul;

    handleRes(res: res!, context: context);

    if(res.state == Status.COMPLETED){
      Navigator.of(context).pop(true);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {

      final service = Provider.of<ServiceProviderImpl>(context,listen: false);
      final profile = Provider.of<ProfileProviderImpl>(context,listen: false);

      final gurukul = profile.gurukulModel;

      service.getAllGurukulList().then((value) {

        setState(() {
          this.gurukuls = value;

          try {
            final selectedGurukul = gurukulList()?.where((element) => element.id == gurukul.gurukulId).first;

            this.selectedGurukul = selectedGurukul;
          } catch (e) {
            print(e);
          }
        });
      });

      setState(() {
        selectedStartDate = gurukul.startYear;
        selectedEndDate = gurukul.endYear;
      });

      service.getAllSaintList().then((value) {

        setState(() {
          this.saints = value;

          try {
            final selectedSaint1 = saintsList()?.where((element) => element.id == gurukul.saintId1).first;
            final selectedSaint2 = saintsList()?.where((element) => element.id == gurukul.saintId2).first;

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
          try {
            this.selectedPurpose = value?.where((element) => element.termCode == gurukul.purposeTypeTerm).first;
          } catch (e) {
            print(e);
          }
        });
      });

      profile.getListTerms(term: TermCategories.AdmissionStandard_Term).then((value) {
        setState(() {
          this.standards = value;
          try {
            this.selectedStandard = value?.where((element) => element.termCode == gurukul.admissionStandardTerm).first;
          } catch (e) {
            print(e);
          }
        });
      });


      profile.getListTerms(term: TermCategories.StandardDivision_Term).then((value) {
        setState(() {
          this.divisions = value;
          try {
            this.selectedDivision = value?.where((element) => element.termCode == gurukul.standardDivisionTerm).first;
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
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: true,
        title: Text('Gurukul Details',
            textAlign: TextAlign.center, style: kAppbarTitle),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {

    final profile = Provider.of<ProfileProviderImpl>(context,listen: false);

    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kFlexibleSize(20.0)),
            Container(
              child: Text('Gurukul', style: kTextBold),
            ),
            defaultSizedBox(),
            SearchList(searchList: gurukulList() ?? [], selectedObject: (obj){
              setState(() {
                if(this.selectedGurukul == obj){return;}
                this.selectedGurukul = obj;
                profile.gurukulModel.gurukulId = obj.id;
              });
            }, hint: 'Select Gurukul',title: selectedGurukul?.title,),
            defaultSizedBox(),
            // BaseTextField(hint: 'Purpose', keyboardType: TextInputType.text),
            // defaultSizedBox(),
            DatePickView(
              title: selectedStartDate == null ? 'Start Date' : selectedStartDate!.toStrCommonFormat() ,
              selectedDate: (date) {
                setState(() {
                  selectedStartDate = date;
                });
                profile.gurukulModel.startYear = date;
              },
              passedDate: selectedStartDate,
            ),
            defaultSizedBox(),
            DatePickView(
              title: selectedEndDate == null ? 'End Date' : selectedEndDate!.toStrCommonFormat() ,
              selectedDate: (date) {
                setState(() {
                  selectedEndDate = date;
                });
                profile.gurukulModel.endYear = date;
              },
              passedDate: selectedEndDate,
            ),
            defaultSizedBox(),

            // SearchList(searchList: saintsList() ?? [], selectedObject: (obj){
            //   setState(() {
            //     if(this.selectedSaint1 == obj){return;}
            //     this.selectedSaint1 = obj;
            //   });
            //   profile.gurukulModel.saintId1 = obj.id;
            // }, hint: 'Select Saint 1',title: selectedSaint1?.title,),
            // defaultSizedBox(),
            // SearchList(searchList: saintsList() ?? [], selectedObject: (obj){
            //   setState(() {
            //     if(this.selectedSaint2 == obj){return;}
            //     this.selectedSaint2 = obj;
            //   });
            //   profile.gurukulModel.saintId2 = obj.id;
            // }, hint: 'Select Saint 1',title: selectedSaint2?.title,),
            // defaultSizedBox(),

            CategoryTypeDropDown(
              data: purposes ?? [],
              hint: 'Purpose',
              selectedValue: selectedPurpose,
              onChange: (value) {
                print(value?.termCode);
                setState(() {
                  selectedPurpose = value;
                });
                profile.gurukulModel.purposeTypeTerm = value?.termCode;
              },
            ),
            if (selectedPurpose?.termCode == 'education')
              Column(children: [
                SizedBox(height: kFlexibleSize(10.0)),
                CategoryTypeDropDown(
                  data: standards ?? [],
                  hint: 'Standard',
                  selectedValue: selectedStandard,
                  onChange: (value) {
                    print(value?.termCode);
                    setState(() {
                      selectedStandard = value;
                    });
                    profile.gurukulModel.admissionStandardTerm = value?.termCode;
                  },
                ),
                SizedBox(height: kFlexibleSize(10.0)),
                CategoryTypeDropDown(
                  data: divisions ?? [],
                  hint: 'Division',
                  selectedValue: selectedDivision,
                  onChange: (value) {
                    print(value?.termCode);
                    setState(() {
                      selectedDivision = value;
                    });
                    profile.gurukulModel.standardDivisionTerm = value?.termCode;
                  },
                ),
              ]),
            defaultSizedBox(height: 20.0),
            saveGurukulConsumer(profile),
            defaultSizedBox(height: 20.0),
          ],
        ),
      ),
    ));
  }

  Widget saveGurukulConsumer(ProfileProviderImpl profile) {
    return Consumer<ProfileProviderImpl>(builder: (_, profile, __) {

      final isLoading = profile.updateGurukul?.state == Status.LOADING;

      return BaseAppButton(title: 'SAVE', isLoading: isLoading,onTap: (){
        if(isLoading){return;}
        this.saveGurukul();
      },);
    },);
  }

  SizedBox defaultSizedBox({double? height}) =>
      SizedBox(height: kFlexibleSize(height ?? 10.0));
}
