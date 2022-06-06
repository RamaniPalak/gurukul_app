import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// class PickImage {
//   File? imageFile;
//   Uint8List? imgBytesData;
//
//   final picker = ImagePicker();
//
//   double maxWidth = 200;
//
//   final VoidCallback updateFile;
//
//   PickImage({required this.updateFile, required this.context});
//
//   final BuildContext context;
//
//   Future _selectFromCamera() async {
//
//     try{
//       final pickedFile = await picker.pickImage(source: ImageSource.camera,imageQuality: 25);
//       if (pickedFile != null) {
//         imageFile = File(pickedFile.path);
//         imgBytesData = await pickedFile.readAsBytes();
//         updateFile();
//       } else {
//         print('No image selected.');
//       }
//     }catch(e){
//       print('Error is $e');
//     }
//   }
//
//   Future _selectFromGallery() async {
//     try {
//       final pickedFile = await picker.pickImage(source: ImageSource.gallery,imageQuality: 25).timeout(Duration(seconds: 5));
//       if (pickedFile != null) {
//             imageFile = File(pickedFile.path);
//             imgBytesData = await pickedFile.readAsBytes();
//             updateFile();
//           } else {
//             print('No image selected.');
//           }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   selectImage() {
//     if (Platform.isIOS) {
//       CupertinoAlertDialog alert = CupertinoAlertDialog(
//         title: Text("Pic Profile Image"),
//         content: Text("Please select an option to pic your image."),
//         actions: [
//           CupertinoDialogAction(
//             child: Text("Gallery"),
//             onPressed: () async{
//               Navigator.pop(context);
//               await _selectFromGallery();
//             },
//           ),
//           CupertinoDialogAction(
//             child: Text("Camera"),
//             onPressed: () async {
//               Navigator.pop(context);
//               await _selectFromCamera();
//             },
//           ),
//           CupertinoDialogAction(
//             child: Text("Cancel", style: TextStyle(color: Colors.red),),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       );
//
//       showCupertinoDialog(context: context, builder: (context) {
//         return alert;
//       },);
//     } else {
//       // set up the AlertDialog
//       AlertDialog alert = AlertDialog(
//         title: Text("Pic Profile Image"),
//         content: Text("Please select an option to pic your image."),
//         actions: [
//           TextButton(
//             child: Text("Camera"),
//             onPressed: () {
//               Navigator.pop(context);
//               _selectFromCamera();
//             },
//           ),
//           TextButton(
//             child: Text("Gallery"),
//             onPressed: () {
//               Navigator.pop(context);
//               _selectFromGallery();
//             },
//           ),
//           TextButton(
//             child: Text("Cancel", style: TextStyle(color: Colors.red),),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           )
//         ],
//       );
//
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return alert;
//         },
//       );
//     }
//   }
//
//   directSelectCamera(){
//     _selectFromCamera();
//   }
//
//   selectImageFromCamera() {
//     if (Platform.isIOS) {
//       CupertinoAlertDialog alert = CupertinoAlertDialog(
//         title: Text("Pic Profile Image"),
//         content: Text("Please select an option to pic your image."),
//         actions: [
//           CupertinoDialogAction(
//             child: Text("Camera"),
//             onPressed: () {
//               Navigator.pop(context);
//               _selectFromCamera();
//             },
//           ),
//           CupertinoDialogAction(
//             child: Text("Cancel", style: TextStyle(color: Colors.red),),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       );
//
//       showCupertinoDialog(context: context, builder: (context) {
//         return alert;
//       },);
//     } else {
//       // set up the AlertDialog
//       AlertDialog alert = AlertDialog(
//         title: Text("Pic Profile Image"),
//         content: Text("Please select an option to pic your image."),
//         actions: [
//           TextButton(
//             child: Text("Camera"),
//             onPressed: () {
//               Navigator.pop(context);
//               _selectFromCamera();
//             },
//           ),
//           TextButton(
//             child: Text("Cancel", style: TextStyle(color: Colors.red),),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           )
//         ],
//       );
//
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return alert;
//         },
//       );
//     }
//   }
// }


class PickImage {
  XFile? imageFile;
  Uint8List? imgBytesData;

  final _picker = ImagePicker();

  Function(String)? onFile;
  Function(bool)? onLoading;
  Function(String)? onError;

  bool isLoading = false;

  selectImage(BuildContext context) {
    bottom(context);
  }

  bottom(BuildContext context){

    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context, builder: (context){

      return PickImageSheet(onCameraClick: (){
        Navigator.pop(context);
        _pick(ImageSource.camera);
      },onGalleryClick: (){
        Navigator.pop(context);
        _pick(ImageSource.gallery);
      });

    });

  }

  setIsLoading(bool isLoading){
    if(onLoading != null){
      this.isLoading = isLoading;
      onLoading!(isLoading);
    }
  }

  updateFileWithPath(XFile file){
    if(onFile != null){
      onFile!(file.path);
    }
  }

  onErrorCall(String error){
    if(onError != null){
      onError!(error);
    }
  }

  _pick(ImageSource source) async {
    setIsLoading(true);
    try {
      final image = await _picker.pickImage(source: source,imageQuality: 75);

      if (image != null){
        imageFile = image;
        updateFileWithPath(image);
        imgBytesData = await image.readAsBytes();
      }

    } catch (e) {
      onErrorCall(e.toString());
    } finally {
      setIsLoading(false);
    }
  }

}

class PickImageSheet extends StatelessWidget {
  const PickImageSheet({Key? key, required this.onCameraClick, required this.onGalleryClick}) : super(key: key);

  final Function onCameraClick;
  final Function onGalleryClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
      ),
      child: Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [

            const Text("Select Image From?",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                InkWell(
                  onTap: (){
                    onCameraClick();
                  },
                  child: Column(
                    children: const [
                      Icon(Icons.camera_alt_rounded,size: 60),
                      Text("Camera",style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),)
                    ],
                  ),
                ),

                InkWell(
                  onTap: (){
                    onGalleryClick();
                  },
                  child: Column(
                    children: const [
                      Icon(Icons.image,size: 60),
                      Text("Gallery",style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),)
                    ],
                  ),
                )

              ],
            ),

          ],
        ),
      ),
    );
  }
}