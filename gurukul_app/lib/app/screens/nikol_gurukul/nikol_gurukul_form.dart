import 'package:flutter/material.dart';

import '../../data/entity/res_entity/res_get_type_term.dart';
import '../../views/base_button.dart';
import '../../views/category_type_drop_down.dart';

class NikolGurukulForm extends StatefulWidget {
  NikolGurukulForm({Key? key}) : super(key: key);

  @override
  State<NikolGurukulForm> createState() => _NikolGurukulFormState();
}

class _NikolGurukulFormState extends State<NikolGurukulForm> {
  ResGetTypeTermListElement? selectedSevaType;

  ResGetTypeTermListElement? selectedIntrestedSevaType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nikol Gurukul'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Column(
              children: [
                Text('HAVE YOU ASSOCIATED WITH ANY SEWA OR SOCIAL ACTIVITIES OF GURUKUL NIKOL?'),
                SizedBox(height: 10),
                ListView.builder(physics: NeverScrollableScrollPhysics(),padding: EdgeInsets.zero,shrinkWrap: true,itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CategoryTypeDropDown(
                      data: [],
                      hint: 'SEWA OR SOCIAL ACTIVITIES',
                      selectedValue: selectedSevaType,
                      onChange: (value) {
                        print(value?.termCode);
                        setState(() {
                          selectedSevaType = value;
                        });
                      },
                    ),
                  );
                },itemCount: 2,)
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Text('DO YOU WANT TO JOIN ANY ACTIVITIES OF NIKOL GURUKUL?'),
                SizedBox(height: 10),
                ListView.builder(physics: NeverScrollableScrollPhysics(),padding:EdgeInsets.zero,shrinkWrap: true,itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CategoryTypeDropDown(
                      data: [],
                      hint: 'SEWA OR SOCIAL ACTIVITIES',
                      selectedValue: selectedSevaType,
                      onChange: (value) {
                        print(value?.termCode);
                        setState(() {
                          selectedSevaType = value;
                        });
                      },
                    ),
                  );
                },itemCount: 2,)
              ],
            ),
            SizedBox(height: 10),
            Text('DO YOU WANT TO JOIN ANY ACTIVITIES OF NIKOL GURUKUL?'),
            TextField(
              decoration: InputDecoration(
                hintText: 'ACTIVITES NAME'
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  hintText: 'POSITION'
              ),
            ),
            SizedBox(height: 15),
            BaseAppButton(
        title: 'SAVE',
        isLoading: false,
        onTap: () {
        },
      )
          ],
        ),
      ),
    );
  }
}
