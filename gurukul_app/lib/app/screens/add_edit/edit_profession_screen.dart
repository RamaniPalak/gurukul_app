import 'package:flutter/material.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_type_term.dart';
import 'package:gurukul_app/app/providers/profile_provider.dart';
import 'package:gurukul_app/app/screens/base/base_state_full.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/views/base_button.dart';
import 'package:gurukul_app/app/views/category_type_drop_down.dart';
import 'package:provider/provider.dart';

class EditProfessionScreen extends BasePage {
  EditProfessionScreen();

  @override
  _EditProfessionScreenState createState() => _EditProfessionScreenState();
}

class _EditProfessionScreenState extends BaseState<EditProfessionScreen> {

  List<ResGetTypeTermListElement>? occupations;

  List<ResGetTypeTermListElement>? jobOccupations;

  List<ResGetTypeTermListElement>? businessOccupations;

  ResGetTypeTermListElement? selectedOccupations;

  ResGetTypeTermListElement? selectedJobOccupations;

  ResGetTypeTermListElement? selectedBusinessOccupations;

  Future getNeededTerms() async {
    final profile = Provider.of<ProfileProviderImpl>(context, listen: false);

    final data = profile.occupation?.data?.data;

    profile.getListTerms(term: TermCategories.Occupation_Term).then((value) {

      setState(() {
        this.occupations = value;

        try {
          selectedOccupations = occupations?.where((element) {
                    return element.termCode == data?.occupationTerm;
                  }).first;
        } catch (e) {
          print(e);
        }

      });

    });



    profile.getListTerms(term: TermCategories.JobType_Term).then((value) {
      setState(() {
        this.jobOccupations = value;

        try {
          selectedJobOccupations = value?.where((element) {
                    return element.termCode == data?.jobTypeTerm;
                  }).first;
        } catch (e) {
          print(e);
        }

      });
    });

    profile.getListTerms(term: TermCategories.IndustryType_Term).then((value) {
      setState(() {
        this.businessOccupations = value;

        try {
          selectedBusinessOccupations = value?.where((element) {
                    return element.termCode == data?.industryTypeTerm;
                  }).first;
        } catch (e) {
          print(e);
        }

      });
    });
  }

  Future saveProfession() async{
    // occupationData

    try {
      final profile = Provider.of<ProfileProviderImpl>(context, listen: false);

      final data = profile.occupationData;

      data.occupationTerm = selectedOccupations?.termCode;

      if(selectedOccupations?.termCode == 'job') {
        data.jobTypeTerm = selectedJobOccupations?.termCode;
        data.industryTypeTerm = null;
      } else if (selectedOccupations?.termCode == 'business') {
        data.industryTypeTerm = selectedBusinessOccupations?.termCode;
        data.jobTypeTerm = null;
      }else{
        data.jobTypeTerm = null;
        data.industryTypeTerm = null;
      }

      await profile.updateProfessionDetail();

      final res = profile.updateOccupation;

      handleRes(res: res!, context: context);

      if(res.state == Status.COMPLETED){
        Navigator.of(context).pop();
      }

    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {

      await getNeededTerms();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: true,
        title: Text('Profession Details',
            textAlign: TextAlign.center, style: kAppbarTitle),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(20.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: kFlexibleSize(20.0)),

              Container(
                child: Text('Occupations', style: kTextBold),
              ),
              defaultSizedBox(),
              CategoryTypeDropDown(
                data: occupations ?? [],
                hint: 'Occupations',
                selectedValue: selectedOccupations,
                onChange: (value) {
                  print(value?.termCode);
                  setState(() {
                    selectedOccupations = value;
                  });
                },
              ),

              defaultSizedBox(),

              if(selectedOccupations?.termCode == 'job')
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Text('Job', style: kTextBold),
                  ),
                  defaultSizedBox(),
                  CategoryTypeDropDown(
                    data: jobOccupations ?? [],
                    hint: 'Job',
                    selectedValue: selectedJobOccupations,
                    onChange: (value) {
                      print(value?.termCode);
                      setState(() {
                        selectedJobOccupations = value;
                      });
                    },
                  ),
                ],
              ),

              defaultSizedBox(),

              if(selectedOccupations?.termCode == 'business')
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Text('Business', style: kTextBold),
                  ),
                  defaultSizedBox(),
                  CategoryTypeDropDown(
                    data: businessOccupations ?? [],
                    hint: 'Business',
                    selectedValue: selectedBusinessOccupations,
                    onChange: (value) {
                      print(value?.termCode);
                      setState(() {
                        selectedBusinessOccupations = value;
                      });
                    },
                  ),
                ],
              ),

              defaultSizedBox(height: 20.0),
              updateProfessionConsumer(),
              defaultSizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget updateProfessionConsumer() {
    return Consumer<ProfileProviderImpl>(builder: (_, profile, __) {

      final isLoading = profile.updateOccupation?.state == Status.LOADING;

      return BaseAppButton(title: 'SAVE', isLoading: isLoading,onTap: (){
        if(isLoading){return;}
        saveProfession();
      },);
    },);
  }

  SizedBox defaultSizedBox({double? height}) =>
      SizedBox(height: kFlexibleSize(height ?? 10.0));
}
