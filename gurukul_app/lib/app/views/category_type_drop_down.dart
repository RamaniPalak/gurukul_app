import 'package:flutter/material.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_type_term.dart';
import 'package:gurukul_app/app/utils/constants.dart';

class CategoryTypeDropDown extends StatefulWidget {

  CategoryTypeDropDown({this.hint, required this.data, this.selectedValue,required this.onChange});

  final String? hint;
  final List<ResGetTypeTermListElement> data;
  late ResGetTypeTermListElement? selectedValue;
  final Function(ResGetTypeTermListElement?) onChange;

  @override
  _CategoryTypeDropDownState createState() => _CategoryTypeDropDownState();
}

class _CategoryTypeDropDownState extends State<CategoryTypeDropDown> {
  // var _chosenValue;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(15.0)),
      height: kFlexibleSize(45.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: DropdownButton<ResGetTypeTermListElement>(
          value: widget.selectedValue,
          iconSize: kFlexibleSize(30.0),
          style: TextStyle(color: Colors.black),
          isExpanded: true,
          underline: SizedBox(),
          items: widget.data.map<DropdownMenuItem<ResGetTypeTermListElement>>((ResGetTypeTermListElement value) {
            return DropdownMenuItem<ResGetTypeTermListElement>(
              value: value,
              child: Text(
                value.termName ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: kRegularFontSize,
                ),
              ),
            );
          }).toList(),
          hint: Text(widget.hint ?? '',style: TextStyle(
            fontSize: kRegularFontSize,
          ),),
          onChanged: (ResGetTypeTermListElement? value) {
            widget.onChange(value);
            widget.selectedValue = value;
          },
        ),
      ),
    );
  }
}