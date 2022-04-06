import 'package:flutter/material.dart';
import 'package:gurukul_app/app/utils/constants.dart';

class NewsdetailsScreen extends StatelessWidget {
  const NewsdetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.transparent,
              // toolbarHeight: size.height * 0.25,
              expandedHeight: size.height * 0.43,
              flexibleSpace: ClipRRect(
                borderRadius: BorderRadius.only(bottomRight: const Radius.circular(15),bottomLeft: Radius.circular(15)),
                child: Container(color: Colors.green,),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 9),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text('Leeds beautician who opened Horsforth salon',style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700
                          ),),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Icon(Icons.share,color: Colors.white,),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    // views(),
                    const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus et, consequat interdum porta. Massa ac et volutpat proin eget et pellentesque. Morbi amet, laoreet vivamus habitasse dignissim volutpat. Dignissim semper vitae euismod ac, tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus et, consequat interdum porta. Massa ac et volutpat proin eget et pellentesque. Morbi amet, laoreet vivamus habitasse dignissim volutpat. Dignissim semper vitae euismod ac, tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus et, consequat interdum porta. Massa ac et volutpat proin eget et pellentesque. Morbi amet, laoreet vivamus habitasse dignissim volutpat. Dignissim semper vitae euismod ac, tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus et, consequat interdum porta. Massa ac et volutpat proin eget et pellentesque. Morbi amet, laoreet vivamus habitasse dignissim volutpat. Dignissim semper vitae euismod ac, tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus et, consequat interdum porta. Massa ac et volutpat proin eget et pellentesque. Morbi amet, laoreet vivamus habitasse dignissim volutpat. Dignissim semper vitae euismod ac, tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus et, consequat interdum porta. Massa ac et volutpat proin eget et pellentesque. Morbi amet, laoreet vivamus habitasse dignissim volutpat. Dignissim semper vitae euismod ac, tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus et, consequat interdum porta. Massa ac et volutpat proin eget et pellentesque. Morbi amet, laoreet vivamus habitasse dignissim volutpat. Dignissim semper vitae euismod ac, tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus et, consequat interdum porta. Massa ac et volutpat proin eget et pellentesque. Morbi amet, laoreet vivamus habitasse dignissim volutpat. Dignissim semper vitae euismod ac, tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus et, consequat interdum porta. Massa ac et volutpat proin eget et pellentesque. Morbi amet, laoreet vivamus habitasse dignissim .',style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ),),
                  ],
                ),
              ),
            )
          ],
        ));
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
                                  Icon(Icons.access_time,color: kPrimaryColor),
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
                                  Icon(Icons.remove_red_eye,color: Colors.white),
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
}
