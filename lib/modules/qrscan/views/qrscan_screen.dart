import 'dart:io' show Platform;

import 'package:demo/modules/qrscan/controllers/qrscan_controller.dart';
import 'package:demo/modules/root/views/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QRScanScreen extends GetView<QRScanController> {
  QRScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RootScreen(
        showDrawer: true,
        title: "QR Scanner",
        appBarActions: [
          IconButton(
            icon: const Icon(Icons.camera),
            tooltip: 'Scan',
            onPressed: controller.onScan,
          ),
        ],
        container: Scaffold(
            body: Obx(() => ListView(
              shrinkWrap: true,
              children: <Widget>[
                if (controller.scanResult.value.rawContent != '')
                  Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: const Text('Result Type'),
                          subtitle: Text(controller.scanResult.value.type.toString()),
                        ),
                        ListTile(
                          title: const Text('Raw Content'),
                          subtitle: Text(controller.scanResult.value.rawContent),
                        ),
                        ListTile(
                          title: const Text('Format'),
                          subtitle: Text(controller.scanResult.value.format.toString()),
                        ),
                        ListTile(
                          title: const Text('Format note'),
                          subtitle: Text(controller.scanResult.value.formatNote),
                        ),
                      ],
                    ),
                  ),
                const ListTile(
                  title: Text('Camera selection'),
                  dense: true,
                  enabled: false,
                ),
                RadioListTile(
                  onChanged: (v) => controller.selectedCamera.value = -1,
                  value: -1,
                  title: const Text('Default camera'),
                  groupValue:controller.selectedCamera.value,
                ),
                ...List.generate(
                  controller.numberOfCameras.value,
                      (i) => RadioListTile(
                    onChanged: (v) => controller.selectedCamera.value = i,
                    value: i,
                    title: Text('Camera ${i + 1}'),
                    groupValue: controller.selectedCamera.value,
                  ),
                ),
                if (Platform.isAndroid) ...[
                  const ListTile(
                    title: Text('Android specific options'),
                    dense: true,
                    enabled: false,
                  ),
                  ListTile(
                    title: Text(
                      'Aspect tolerance (${controller.aspectTolerance.value.toStringAsFixed(2)})',
                    ),
                    subtitle: Slider(
                      min: -1,
                      value: controller.aspectTolerance.value,
                      onChanged: (value) {
                          controller.aspectTolerance.value = value;
                      },
                    ),
                  ),
                  CheckboxListTile(
                    title: const Text('Use autofocus'),
                    value: controller.useAutoFocus.value,
                    onChanged: (checked) {
                        controller.useAutoFocus.value = checked!;
                    },
                  ),
                ],
                const ListTile(
                  title: Text('Other options'),
                  dense: true,
                  enabled: false,
                ),
                CheckboxListTile(
                  title: const Text('Start with flash'),
                  value: controller.autoEnableFlash.value,
                  onChanged: (checked) {
                      controller.autoEnableFlash.value = checked!;
                  },
                ),
                const ListTile(
                  title: Text('Barcode formats'),
                  dense: true,
                  enabled: false,
                ),
                ListTile(
                  trailing: Checkbox(
                    tristate: true,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: controller.selectedFormats.length == QRScanController.possibleFormats.length
                        ? true
                        : controller.selectedFormats.isEmpty
                        ? false
                        : null,
                    onChanged: (checked) {
                        controller.selectedFormats.value = [
                          if (checked ?? false) ...QRScanController.possibleFormats,
                        ];
                    },
                  ),
                  dense: true,
                  enabled: false,
                  title: const Text('Detect barcode formats'),
                  subtitle: const Text(
                    'If all are unselected, all possible '
                        'platform formats will be used',
                  ),
                ),
                ...QRScanController.possibleFormats.map(
                      (format) => CheckboxListTile(
                    value: controller.selectedFormats.contains(format),
                    onChanged: (i) {
                      controller.selectedFormats.contains(format)
                          ? controller.selectedFormats.remove(format)
                          : controller.selectedFormats.add(format);
                    },
                    title: Text(format.toString()),
                  ),
                ),
              ],
            ),
        ))
    );
  }
}
