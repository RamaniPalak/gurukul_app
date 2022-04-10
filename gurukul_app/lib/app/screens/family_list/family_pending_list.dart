import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/entity/res_entity/res_get_type_term.dart';
import '../../providers/profile_provider.dart';
import '../../utils/constants.dart';
import '../../utils/enums.dart';
import '../../utils/no_data_found_view.dart';
import '../../utils/show_snack_bar.dart';
import '../../views/category_type_drop_down.dart';

class FamilyPendingList extends StatefulWidget {
  const FamilyPendingList({Key? key}) : super(key: key);

  @override
  State<FamilyPendingList> createState() => _FamilyPendingListState();
}

class _FamilyPendingListState extends State<FamilyPendingList> {

  List<ResGetTypeTermListElement>? relations;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {

      final profile = Provider.of<ProfileProviderImpl>(context,listen: false);

      final data = profile.familyMember;

      getNeededTerms();

    });

  }

  Future getNeededTerms() async {
    final profile = Provider.of<ProfileProviderImpl>(context,listen: false);
    profile.getListTerms(term: TermCategories.RelationType_Term).then((value) {
      setState(() {
        this.relations = value;

      });

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ProfileProviderImpl>(
        builder: (context, provider, child) {
          final familyList = provider.familyPendingList;

          if(familyList?.state == Status.ERROR){
            return Center(child: NoDataFoundView(title: familyList?.msg ?? 'No Data Found',));
          }

          final list = familyList?.data?.data?.list;

          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final obj = list?[index];

                        return Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 11, horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          obj?.firstName ??
                                              '' +
                                                  ' ' +
                                                  (obj?.middleName ??
                                                      '') +
                                                  ' ' +
                                                  (obj?.lastName ?? ''),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight:
                                              FontWeight.w500),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                            obj?.relationTypeTerm ?? "",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight:
                                                FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: kFlexibleSize(150),
                                    child: CategoryTypeDropDown(
                                      data: relations ?? [],
                                      hint: 'Select Relation',
                                      selectedValue: obj?.selectedRelations,
                                      onChange: (value) {
                                        print(value?.termCode);
                                        setState(() {
                                          obj?.selectedRelations = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                          onTap: () async {

                                            if(obj?.selectedRelations == null){
                                              ShowSnackBar(context: context, message: 'Please Select Family Replations.');
                                              return;
                                            }

                                            await provider.acceptRejectRequestFaimily(familyID: obj?.memberFamilyId ?? 0, status: 'Accepted',term: obj?.selectedRelations?.termCode);
                                            final res = provider.familyReq;

                                            if (res?.state == Status.COMPLETED){
                                              ShowSnackBar(context: context, message: 'Updated');
                                            }
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(5)),
                                              child: Padding(
                                                padding:
                                                const EdgeInsets
                                                    .all(8.0),
                                                child: Text(
                                                  'Approve',
                                                  style: TextStyle(
                                                    fontSize: kFlexibleSize(15),
                                                      color:
                                                      Colors.white),
                                                ),
                                              ))),
                                      SizedBox(height: 5),
                                      InkWell(
                                          onTap: () {
                                            provider.acceptRejectRequestFaimily(familyID: obj?.memberFamilyId ?? 0, status: 'Rejected');
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(5)),
                                              child: Padding(
                                                padding:
                                                const EdgeInsets
                                                    .all(8.0),
                                                child: Text(
                                                  'Reject',
                                                  style: TextStyle(
                                                      fontSize: kFlexibleSize(15),
                                                      color:
                                                      Colors.white),
                                                ),
                                              ))),
                                    ],
                                  ),
                                ],
                              ),
                              Divider()
                            ],
                          ),
                        );
                      },
                      itemCount: list?.length ?? 0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          // height: 40,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'OK',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}