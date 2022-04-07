import 'package:flutter/material.dart';
import 'package:gurukul_app/app/providers/home_provider.dart';
import 'package:gurukul_app/app/screens/base/base_state_full.dart';
import 'package:gurukul_app/app/screens/helper_screens/side_menu_screen.dart';
import 'package:gurukul_app/app/screens/news/news_details.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/no_data_found_view.dart';
import 'package:gurukul_app/app/views/common_images.dart';
import 'package:gurukul_app/app/views/network_image.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';

class NewsListScreen extends BasePage {
   NewsListScreen({Key? key}) : super(key: key);

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends BaseState<NewsListScreen> {

  bool isLoading = false;

  late ScrollController? _controller;


  getNewsData() async {
    final home = Provider.of<HomeProviderImpl>(context, listen: false);
    await home.getGurukulPost();
    handleRes(
        res: home.getGurukulPostRes!,
        context: context,
        retryCall: () {
          getNewsData();
        });
  }

  _scrollListener() async {

    final home = Provider.of<HomeProviderImpl>(context, listen: false);
    // print(_controller?.position.extentAfter);
    if ((_controller?.position.extentAfter ?? 0) <= 0 && !isLoading && (home.totalPage ?? 0) >= (home.page)) {
      isLoading = true;
      await home.getGurukulPost();
      isLoading = false;
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      getNewsData();
    });

    _controller = ScrollController();

    _controller?.addListener(() {
      _scrollListener();
    });

  }

  @override
  void dispose() {
     _controller?.removeListener(_scrollListener());
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gurukul Parivar'),),
      drawer: Container(width: kFlexibleSize(280), child: SideMenuScreen()),
      body: userNewsList(),
    );
  }


  Widget userNewsList() {
    return Consumer<HomeProviderImpl>(
      builder: (_, news, __) {
        final isLoading = news.getGurukulPostRes?.state == Status.LOADING;

        final hasError = news.getGurukulPostRes?.state == Status.ERROR ||
            news.getGurukulPostRes?.state == Status.UNAUTHORISED;

        if (hasError) {
          return bgContainer(
              widget: NoDataFoundView(
                  retryCall: () {
                    getNewsData();
                  },
                  title: 'No Profile Data Found'));
        }

        final data = news.posts;

        print(data?.length);

        // if(_controller == null){
        //   return Container();
        // }

        return ListView.builder(padding: EdgeInsets.all(15),
            controller: _controller,
            itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8),
            child: InkWell(
              onTap: (){
                // news.getGurukulPostDetails(
                //   id: data?[index].wallId);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsdetailsScreen(wallId: data?[index].wallId ),));
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
                        height: 150,
                        width: double.infinity,
                        child: CustomNetWorkImage(
                          url: data?[index].userImage ?? 'assets/images/placeholder.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${data?[index].postTitle}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                                SizedBox(height: 5),
                                Text('${data?[index].gurukulName}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
                                Text('Published on: ${data?[index].publishedOn?.day}-${data?[index].publishedOn?.month}-${data?[index].publishedOn?.year}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.grey),),
                              ],
                            )),
                            Icon(Icons.arrow_forward_rounded)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },itemCount: data?.length);
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
