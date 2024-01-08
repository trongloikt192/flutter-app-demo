import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';

class QRScanController extends GetxController {
  Rx<ScanResult> scanResult = ScanResult().obs;

  final flashOnController = TextEditingController(text: 'Flash on');
  final flashOffController = TextEditingController(text: 'Flash off');
  final cancelController = TextEditingController(text: 'Cancel');

  final aspectTolerance = (0.00).obs;
  final numberOfCameras = 0.obs;
  final selectedCamera = (-1).obs;
  final useAutoFocus = true.obs;
  final autoEnableFlash = false.obs;

  static final possibleFormats = BarcodeFormat.values.toList()
    ..removeWhere((e) => e == BarcodeFormat.unknown);

  List<BarcodeFormat> selectedFormats = [...possibleFormats];


  QRScanController() {
    // constructor
  }

  Future<void> onScan() async {
    try {
      final result = await BarcodeScanner.scan(
        options: ScanOptions(
          strings: {
            'cancel': cancelController.text,
            'flash_on': flashOnController.text,
            'flash_off': flashOffController.text,
          },
          restrictFormat: selectedFormats,
          useCamera: selectedCamera.value,
          autoEnableFlash: autoEnableFlash.value,
          android: AndroidOptions(
            aspectTolerance: aspectTolerance.value,
            useAutoFocus: useAutoFocus.value,
          ),
        ),
      );
      scanResult.value = result;
    } on PlatformException catch (e) {
      scanResult.value = ScanResult(
        rawContent: e.code == BarcodeScanner.cameraAccessDenied
            ? 'The user did not grant the camera permission!'
            : 'Unknown error: $e',
      );
    }
  }
}
