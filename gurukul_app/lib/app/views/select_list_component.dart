import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gurukul_app/app/screens/helper_screens/list_search_screen.dart';
import 'package:gurukul_app/app/utils/constants.dart';

class SelectListComponent extends StatefulWidget {
  SelectListComponent({Key? key,required this.text, this.title,required this.hint, required this.onTap, required this.hasTitle, this.searchList, this.enabled}) : super(key: key);

  final String? title;
  final String hint;
  final String text;
  final bool hasTitle;
  final Function(ListSearchModel?) onTap;
  final List<ListSearchModel>? searchList;

  final bool? enabled;

  @override
  _SelectListComponentState createState() => _SelectListComponentState();
}

class _SelectListComponentState extends State<SelectListComponent> {

  ListSearchModel? obj;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.hasTitle)
        Text('${widget.title ?? ''}',maxLines: 2, style: kTextBold),
        if (widget.hasTitle)
        SizedBox(
          height: kFlexibleSize(10),
        ),
        InkWell(
          onTap: (){

            if(widget.enabled == false){
              return;
            }

            if (widget.searchList != null){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListSearchScreen(searchList: widget.searchList!,selectedObject: (obj){
                setState(() {
                  this.obj = obj;
                  widget.onTap(obj);
                });
              },),
                fullscreenDialog: true
              ),
              );
            }

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
                            '${obj?.title != null ? widget.text : widget.hint}',
                            style: TextStyle(
                                fontSize: kRegularFontSize,
                                color: (widget.enabled == false) ? Colors.grey : Colors.black
                            ),
                          ))),
                  Container(
                    margin: EdgeInsets.all(kFlexibleSize(13)),
                    child: Icon(Icons.arrow_drop_down,color: (widget.enabled == false) ? Colors.grey : Colors.black,size: kFlexibleSize(30.0),),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
