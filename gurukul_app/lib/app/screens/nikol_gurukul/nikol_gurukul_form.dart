import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gurukul_app/app/providers/profile_provider.dart';
import 'package:gurukul_app/app/screens/base/base_state_full.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/show_snack_bar.dart';
import 'package:provider/provider.dart';
import '../../data/entity/res_entity/res_get_type_term.dart';
import '../../views/base_button.dart';
import '../../views/category_type_drop_down.dart';

class NikolGurukulForm extends BasePage {
  NikolGurukulForm({Key? key}) : super(key: key);

  @override
  State<NikolGurukulForm> createState() => _NikolGurukulFormState();
}

class _NikolGurukulFormState extends BaseState<NikolGurukulForm> {

  int? _selectedSeva;

  int? _selectedSamajik;


  List<ResGetTypeTermListElement>? nikolSeva;

  ResGetTypeTermListElement? selectedNikolSeva;

  TextEditingController sansthaController = TextEditingController();
  TextEditingController positionController = TextEditingController();


  saveNikolGurukul() async {
    try{

      final profile = Provider.of<ProfileProviderImpl>(context,listen: false);

      await profile.addNikolGurukul();

      final res = profile.updateNikolGurukul;

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

      final profile = Provider.of<ProfileProviderImpl>(context,listen: false);

      await  profile.getNikolList();

      final nikol = profile.nikolLists?.data?.data;

      setState(() {
        this._selectedSeva = nikol?.isJoiningGurukulSeva;
        this._selectedSamajik = nikol?.isSociety;
        this.sansthaController.text = nikol?.organizationName ?? "";
        this.positionController.text = nikol?.societyPosition ?? "";
      });


      profile.getListTerms(term: TermCategories.activity_term).then((value) {
        setState(() {
          this.nikolSeva = value;
          try {

            this.selectedNikolSeva = value?.where((element) => element.termCode == nikol?.activityTerm).first;

          } catch (e) {
            print(e);
          }
        });
      });

    });
  }

  @override
  Widget build(BuildContext context) {

    final profile = Provider.of<ProfileProviderImpl>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Nikol Gurukul'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text('$nikolGurukul', style: kTextBold),
                ),
                SizedBox(height: 10),
                CategoryTypeDropDown(
                  data: nikolSeva ?? [],
                  hint: 'સેવા પસંદ કરો',
                  selectedValue: selectedNikolSeva,
                  onChange: (value) {
                    print(value?.termCode);
                    setState(() {
                      selectedNikolSeva = value;
                    });
                    profile.nikolGurukulData?.activityTerm = value?.termCode;
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      child: Text('$sevaSelection', style: kTextBold),
                    ),
                  ),
                  SizedBox(height: kFlexibleSize(10)),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CommonRadio(
                        text: "YES",
                        radioValue: 1,
                        selectedGender: _selectedSeva,
                        radioValue1: 0,
                        selectedGender1: _selectedSeva,
                        text1: "No",
                        onChange: (value) {
                          setState(() {
                            _selectedSeva = value;
                          });
                          print(value);
                          profile.nikolGurukulData?.isJoiningGurukulSeva = value;
                        }),
                  )
                ],
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      child: Text('$samajikSelection', style: kTextBold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CommonRadio(
                        text: "YES",
                        radioValue: 1,
                        selectedGender: _selectedSamajik,
                        radioValue1: 0,
                        selectedGender1: _selectedSamajik,
                        text1: "No",
                        onChange: (value) {
                          setState(() {
                            _selectedSamajik = value;
                          });
                          profile.nikolGurukulData?.isSociety = value;
                        }),
                  )
                ],
              ),
            ),
            //   SizedBox(height: 10),
            if (_selectedSamajik == 1)
              Column(
                children: [
                  //Text('DO YOU WANT TO JOIN ANY ACTIVITIES OF NIKOL GURUKUL?'),
                  TextField(
                    style: TextStyle(
                        fontSize: kMediumFontSize,
                        color: Colors.black,
                        fontWeight: FontWeight.w700
                    ),
                    decoration: InputDecoration(hintText: '$sansthanuname'),controller: sansthaController,
                    onChanged: (str){
                      profile.nikolGurukulData?.organizationName = str ;

                    },
                  ),
                  //SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(hintText: 'પોઝિશન',
                    ),
                    style: TextStyle(
                      fontSize: kMediumFontSize,
                      color: Colors.black,
                      fontWeight: FontWeight.w700
                    ),
                      controller: positionController,
                    onChanged: (str){
                      profile.nikolGurukulData?.societyPosition = str ;

                    },
                  ),
                  SizedBox(height: 5),
                ],
              ),
            SizedBox(height: 15),
            saveNikolConsumer(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget saveNikolConsumer() {
    return Consumer<ProfileProviderImpl>(builder: (_, profile, __) {

      final isLoading = profile.updateFamily?.state == Status.LOADING;

      return BaseAppButton(title: 'SAVE', isLoading: isLoading,onTap: (){
        saveNikolGurukul();
      },);
    },);
  }

  Widget CommonRadio(
      {int? radioValue,
      int? selectedGender,
      String? text,
        int? radioValue1,
        int? selectedGender1,
      String? text1,
      required Function(int?) onChange}) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio<int>(
              activeColor: kPrimaryColor,
              value: radioValue! ,
              groupValue: selectedGender,
              onChanged: (val) {
                onChange(val);
                setState(() {
                  selectedGender = val!;
                });
              },
            ),
            Text(
              text ?? '',
              style: new TextStyle(
                  fontSize: kSmallFontSize, fontFamily: kRegularFonts),
            ),
            Radio<int>(
              activeColor: kPrimaryColor,
              value: radioValue1!,
              groupValue: selectedGender1,
              onChanged: (val) {
                onChange(val);
                setState(() {
                  selectedGender = val!;
                });
              },
            ),
            Text(
              text1 ?? "",
              style: new TextStyle(
                  fontSize: kSmallFontSize, fontFamily: kRegularFonts),
            ),
          ],
        ),
      ],
    );
  }
}
