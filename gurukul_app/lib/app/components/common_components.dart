import 'package:flutter/material.dart';
import 'package:gurukul_app/app/utils/constants.dart';

Widget prefixTitle(String text, Image image, {Color? color, bool? isCenter}) {
  return Row(
    mainAxisAlignment: isCenter == false ? MainAxisAlignment.start : MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: kFlexibleSize(12),
        child: image,
      ),
      SizedBox(
        width: kFlexibleSize(5),
      ),
      Flexible(
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: color ?? Colors.black,
              fontSize: kSmallFontSize,
              fontWeight: FontWeight.w400),
        ),
      ),
    ],
  );
}

Widget keyValueComponent({required String key, required String value, bool? isCenter}) {
  return Row(
    mainAxisAlignment: isCenter == false ? MainAxisAlignment.start : MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('$key : ',
          style: TextStyle(
              color: Colors.black,
              fontSize: kSmallFontSize,
              fontWeight: FontWeight.w400)),
      Expanded(
        flex: (isCenter == false) ? 1 : 0,
        child: Text('$value',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: kSmallFontSize,
                fontWeight: FontWeight.w700)),
      )
    ],
  );
}

Widget defaultSizeBoxHeight({double? height}) {
  return SizedBox(
    height: kFlexibleSize(height ?? 10.0),
  );
}

Widget defaultSizeBoxWidth({double? width}) {
  return SizedBox(
    width: kFlexibleSize(width ?? 10.0),
  );
}