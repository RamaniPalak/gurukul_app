import 'package:flutter/material.dart';
import 'package:gurukul_app/app/utils/constants.dart';

class SearchSelectionScreen extends StatefulWidget {
  SearchSelectionScreen({Key? key,required this.searchList, required this.selectedObject}) : super(key: key);

  final List<SearchModel> searchList;

  final Function(SearchModel)? selectedObject;

  @override
  _SearchSelectionScreenState createState() => _SearchSelectionScreenState();
}

class _SearchSelectionScreenState extends State<SearchSelectionScreen> {

  List<SearchModel> searchList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      searchList = widget.searchList;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(44)
          ),
          child: TextField(
            onChanged: (text){
              if(text.isEmpty){
                setState(() {
                  searchList = widget.searchList;
                });
                return;
              }else{
                setState(() {
                  searchList = widget.searchList.where((element) => (element.title ?? '').toLowerCase().contains(text.toLowerCase())).toList();
                });
              }
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search'
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (context, index) {

          return ListTile(
            title: Text('${searchList[index].title}',style: TextStyle(
                fontSize: kRegularFontSize,
                fontWeight: FontWeight.w600
            ),),
            onTap: (){
              if (widget.selectedObject != null){
                widget.selectedObject!(searchList[index]);
              }
              Navigator.of(context).pop();
            },
          );

        },),
    );
  }
}

class SearchModel{
  int? id;
  String? title;

  SearchModel({this.id,this.title});

}

void callSearchList({required BuildContext context, required List<SearchModel> searchList, required Function(SearchModel)? selectedObject}){

  final searchScreen = SearchSelectionScreen(searchList: searchList, selectedObject: selectedObject);

  Navigator.of(context).push(MaterialPageRoute(builder: (context) => searchScreen,fullscreenDialog: true));

}

class SearchList extends StatelessWidget {
  const SearchList({Key? key,required this.searchList, required this.selectedObject,this.title,required this.hint}) : super(key: key);

  final List<SearchModel> searchList;

  final Function(SearchModel)? selectedObject;

  final String? title;

  final String hint;

  @override
  Widget build(BuildContext context) {

    final enabled = searchList.length > 0;

    return InkWell(
      onTap: (){
        if(!enabled){return;}
        final searchScreen = SearchSelectionScreen(searchList: searchList, selectedObject: selectedObject);

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => searchScreen,fullscreenDialog: true));
      },
      child: Container(
          height: kFlexibleSize(45.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            // boxShadow: kCommonShadow,
          ),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: kFlexibleSize(15.0)),
                      child: Text(
                        '${title ?? '$hint'}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: kRegularFontSize,
                            color: enabled ? Colors.black : Colors.grey
                        ),
                      ))),
              Container(
                margin: EdgeInsets.all(kFlexibleSize(10)),
                child: Icon(Icons.arrow_drop_down,color:enabled ? Colors.black : Colors.grey,size: kFlexibleSize(30.0),),
              )
            ],
          )),
    );
  }
}
