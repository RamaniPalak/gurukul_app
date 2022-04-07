import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gurukul_app/app/providers/auth_provider.dart';
import 'package:gurukul_app/app/providers/home_provider.dart';
import 'package:gurukul_app/app/screens/base/base_state_full.dart';
import 'package:provider/provider.dart';

class HomeScreenSample extends BasePage {
  HomeScreenSample({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends BaseState<HomeScreenSample>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //For the initial Screen We can take a state full widget for initial api call
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final home = Provider.of<HomeProviderImpl>(context,listen: false);
    //  home.getRes();
    });

  }

  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<AuthProviderImpl>(context,listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(onPressed: (){
              auth.logOutUser();
            }, icon: Icon(Icons.logout))
          ],
        ),
        body: Container()
    );
  }

  // Widget consumerPattern() {
  //   return Consumer<HomeProviderImpl>(
  //     builder: (context, home, __) {
  //       //
  //       // if (home.res != null){
  //       //
  //       //   return resContainer(context: context,res: home.res!, successWidget: Container(
  //       //     color: Colors.green,
  //       //   ),
  //       //       retryCall: (){
  //       //        // home.getRes();
  //       //       }
  //       //   );
  //       // }else{
  //       //   return Container();
  //       // }
  //     },);
  // }
}

