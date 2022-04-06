import 'package:flutter/material.dart';
import 'package:gurukul_app/app/screens/helper_screens/side_menu_screen.dart';
import 'package:gurukul_app/app/screens/news/news_details.dart';

import '../../utils/constants.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gurukul Parivar'),),
      drawer: Container(width: kFlexibleSize(280), child: SideMenuScreen()),
      body: ListView.builder(padding: EdgeInsets.all(15),itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsdetailsScreen(),));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.9),
                  blurRadius: 10,
                  blurStyle: BlurStyle.outer,
                  // offset: Offset(10,10)
                ),]
              ),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    color: Colors.green,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(child: Text('Today is Ram Navmi',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)),
                        Icon(Icons.arrow_forward_rounded)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },itemCount: 1),
    );
  }
}
