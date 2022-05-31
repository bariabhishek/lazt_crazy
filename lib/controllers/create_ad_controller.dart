

import 'dart:io';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';

class CreateAdController  extends GetxController{

  List<Album>? albums;
  RxBool loading = false.obs;

  Future<void> initAsync() async {
    if (await _promptPermissionSetting()) {
      List<Album> albums =
      await PhotoGallery.listAlbums(mediumType: MediumType.image);
        this.albums = albums;
        loading.value = false;

    }

      loading.value = false;

  }

  Future<bool> _promptPermissionSetting() async {
    if (Platform.isIOS &&
        await Permission.storage.request().isGranted &&
        await Permission.photos.request().isGranted ||
        Platform.isAndroid && await Permission.storage.request().isGranted) {
      return true;
    }
    return false;
  }


  @override
  void onInit() {
    loading.value = true;
    initAsync();
    super.onInit();

  }
}