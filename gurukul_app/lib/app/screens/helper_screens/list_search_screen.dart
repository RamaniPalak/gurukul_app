import 'package:flutter/material.dart';
import 'package:gurukul_app/app/utils/constants.dart';

class ListSearchScreen extends StatefulWidget {
  const ListSearchScreen({Key? key,required this.searchList, this.selectedObject}) : super(key: key);

  final List<ListSearchModel> searchList;

  final Function(ListSearchModel)? selectedObject;

  @override
  _ListSearchScreenState createState() => _ListSearchScreenState();
}

class _ListSearchScreenState extends State<ListSearchScreen> {

  List<ListSearchModel> searchList = [];

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
                  searchList = widget.searchList.where((element) => element.title.toLowerCase().contains(text.toLowerCase())).toList();
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
          enabled: !searchList[index].isSelected,
        );

      },),
    );
  }
}

class ListSearchModel{
  final int reqID;
  final int? index;
  final String title;
  final bool isSelected;

  ListSearchModel({required this.reqID,this.index,required this.title, required this.isSelected});
}