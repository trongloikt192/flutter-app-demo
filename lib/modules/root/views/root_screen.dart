import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/custom_bottom_nav_bar.dart';
import '../../global_widgets/main_drawer_widget.dart';
import '../controllers/root_controller.dart';

class RootScreen extends GetView<RootController> {
  final String title;
  final Scaffold container;

  final bool hideAppBar;
  final List<Widget>? appBarActions;
  final bool showDrawer;

  const RootScreen({super.key, required this.container,
      this.title = "",
      this.hideAppBar = false,
      this.showDrawer = false,
      this.appBarActions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: showDrawer ? MainDrawerWidget() : null,
      appBar: hideAppBar
          ? null
          : AppBar(
              title: Text(
                title.tr,
              ),
              centerTitle: true,
              actions: appBarActions ?? [],
            ),
      body: container,
      bottomNavigationBar: Obx(() {
        return CustomBottomNavigationBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          itemColor: context.theme.colorScheme.secondary,
          currentIndex: controller.currentIndex.value,
          onChange: (index) {
            controller.changePageByIndex(index);
          },
          children: [
            CustomBottomNavigationItem(
              icon: Icons.home_outlined,
              label: "Home".tr,
            ),
            CustomBottomNavigationItem(
              icon: Icons.qr_code_scanner,
              label: "QR Scan".tr,
            ),
            CustomBottomNavigationItem(
              icon: Icons.person_outline,
              label: "Account".tr,
            ),
            CustomBottomNavigationItem(
              icon: Icons.settings,
              label: "Setting".tr,
            ),
          ],
        );
      }),
    );
  }
}
