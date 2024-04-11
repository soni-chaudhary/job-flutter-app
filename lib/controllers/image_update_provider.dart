import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_studio/constansts/app_constants.dart';

class ImageUpdateProvider with ChangeNotifier {
  final ImagePicker _imagePicker = ImagePicker();
  String? imageUrl;
  String? imagePath;
  List<String> imageUrlName = [];

  void pickImage() async {
    XFile? _imageFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    _imageFile = await cropImage(_imageFile!);

    if (_imageFile != null) {
      imageUrlName.add(_imageFile.path);
      imagePath = _imageFile.path;
    } else {
      return;
    }
  }

  Future<XFile?> cropImage(XFile imageFile) async {
    CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
      sourcePath: imageFile.path,
      maxHeight: 800,
      maxWidth: 600,
      compressQuality: 70,
      cropStyle: CropStyle.rectangle,
      aspectRatioPresets: [CropAspectRatioPreset.ratio5x4],
      uiSettings: [
        AndroidUiSettings(
          toolbarColor: Color(klightBlue.value),
          toolbarTitle: "Job Studio",
          toolbarWidgetColor: Color(kLight.value),
          initAspectRatio: CropAspectRatioPreset.ratio5x4,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: "Job Studio",
        ),
      ],
    );
    if (croppedFile != null) {
      notifyListeners();
      return XFile(croppedFile.path);
    } else {
      return null;
    }
  }
}
