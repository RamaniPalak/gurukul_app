import 'package:flutter/material.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/no_data_found_view.dart';
import 'package:gurukul_app/app/views/network_image.dart';
import 'package:provider/provider.dart';

import '../../providers/home_provider.dart';

class NewsdetailsScreen extends StatefulWidget {
  NewsdetailsScreen({Key? key, this.wallId}) : super(key: key);

  final int? wallId;

  @override
  State<NewsdetailsScreen> createState() => _NewsdetailsScreenState();
}

class _NewsdetailsScreenState extends State<NewsdetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      final home = Provider.of<HomeProviderImpl>(context, listen: false);
      home.getGurukulPostDetails(id: widget.wallId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: bodyDetail(),
    );
  }

  Column views() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.access_time, color: kPrimaryColor),
                    //news-eye-icon.svg
                    Text(
                      ' 2h ago',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              flex: 2,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Color(0xff242426),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.remove_red_eye, color: Colors.white),
                    //news-eye-icon.svg
                    const Text(
                      ' 1k',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              flex: 2,
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget bodyDetail() {
    final size = MediaQuery.of(context).size;

    return Consumer<HomeProviderImpl>(
      builder: (_, postdetail, __) {
        final isLoading =
            postdetail.getGurukulPostDetailRes?.state == Status.LOADING;

        final hasError = postdetail.getGurukulPostDetailRes?.state ==
                Status.ERROR ||
            postdetail.getGurukulPostDetailRes?.state == Status.UNAUTHORISED;

        if (hasError) {
          return bgContainer(
              widget: NoDataFoundView(
                  retryCall: () {
                    postdetail.getGurukulPostDetails(id: widget.wallId);
                  },
                  title: 'No Profile Data Found'));
        }

        final data = postdetail.getGurukulPostDetailRes?.data?.data;

        print('data=${data?.postTitle}');

        return CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.transparent,
              // toolbarHeight: size.height * 0.25,
              expandedHeight: size.height * 0.43,
              flexibleSpace: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: const Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                child: Container(
                  height: double.infinity,
                  child: CustomNetWorkImage(
                    url: data?.userImage ?? 'assets/images/placeholder.png',
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${data?.postTitle}',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),

                              SizedBox(height: 5),
                              Text('${data?.gurukulName}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
                              Text('Published on: ${data?.publishedOn?.day}-${data?.publishedOn?.month}-${data?.publishedOn?.year}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.grey),),
                            ],
                          ),
                        ),

                        const SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(
                      height: 1,
                      thickness: 2,
                      color: Color(0xff576d7e).withOpacity(0.15),
                    ),
                    SizedBox(height: 10),
                    // views(),
                    Text(
                      '${data?.postDescription}',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Container bgContainer({required Widget widget}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: kFlexibleSize(10.0)),
      padding: EdgeInsets.all(kFlexibleSize(15.0)),
      decoration: BoxDecoration(
          // boxShadow: kCommonShadow,
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0)),
      child: widget,
    );
  }
}
