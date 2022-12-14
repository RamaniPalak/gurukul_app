import 'package:flutter/material.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/views/loading_small.dart';

class BaseButton extends StatelessWidget {
  final Widget? child;
  final GestureTapCallback? onTap;
  final bool? isLoading;

  const BaseButton(
      {required Widget? child, GestureTapCallback? onTap, bool? isLoading})
      : child = child,
        onTap = onTap,
        isLoading = isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      child: child,
      onTap: onTap,
    );
  }
}

class AppButton extends BaseButton {
  const AppButton(
      {required Widget? child, GestureTapCallback? onTap, bool? isLoading})
      : super(child: child, onTap: onTap, isLoading: isLoading);
}

class ButtonFill extends StatelessWidget {
  final String text;
  final GestureTapCallback? onTap;
  final bool? isLoading;
  final EdgeInsets? margin;

  const ButtonFill(
      {required String text,
      GestureTapCallback? onTap,
      bool? isLoading,
      EdgeInsets? margin})
      : text = text,
        onTap = onTap,
        isLoading = isLoading,
        margin = margin;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: (isLoading == true) ? null : onTap,
      isLoading: isLoading,
      child: Container(
        margin: margin,
        height: 44,
        decoration: BoxDecoration(
            color: kPrimaryColor.withAlpha((isLoading == true) ? 80 : 1000),
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          widthFactor: 1,
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isLoading == true) LoadingSmall(size: kFlexibleSize(15)),
                  if (isLoading == true) SizedBox(width: 10),
                  Text(
                    text,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class ButtonBorder extends StatelessWidget {
  final String text;
  final GestureTapCallback? onTap;
  final bool? isLoading;

  const ButtonBorder(
      {required String text, GestureTapCallback? onTap, bool? isLoading})
      : text = text,
        onTap = onTap,
        isLoading = isLoading;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: (isLoading == true) ? null : onTap,
      isLoading: isLoading,
      child: Container(
        height: 38,
        decoration: BoxDecoration(
            border: Border.all(color: kPrimaryColor),
            borderRadius:
                BorderRadius.circular((isLoading == true) ? 22.0 : 5.0)),
        child: Center(
          widthFactor: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: (isLoading == true)
                  ? LoadingSmall(
                      color: kPrimaryColor,
                    )
                  : Text(
                      text,
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    )),
        ),
      ),
    );
  }
}

class BaseAppButton extends StatelessWidget {
  const BaseAppButton({Key? key, this.title, this.onTap, this.isLoading}) : super(key: key);

  final String? title;

  final GestureTapCallback? onTap;

  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: kFlexibleSize(45.0),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: kCommonRedShadow,
        ),
        // padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(15.0)),
        child: Container(
          width: double.infinity,
          child: Center(
            child: _child(),
          ),
        ),
      ),
    );
  }

  Widget _child() {

    if(isLoading ?? false){
      return Container(
          height: 15,
          width: 15,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ));
    }else{
      return Text(
        title ?? '',
        style: TextStyle(
            fontSize: kRegularFontSize,
            fontWeight: FontWeight.w700,
            color: Colors.white),
      );
    }

  }
}

