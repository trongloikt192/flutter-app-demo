/*
 * Copyright (c) 2020 .
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/routes.dart';
import '../../services/auth_service.dart';
import '../root/controllers/root_controller.dart' show RootController;
import 'drawer_link_widget.dart';

class MainDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerLinkWidget(
            icon: Icons.home_outlined,
            text: "Home",
            onTap: (e) async {
              await Get.find<RootController>().changePageByName(Routes.HOME);
            },
          ),
          ListTile(
            dense: true,
            title: Text(
              "Application preferences".tr,
              style: Get.textTheme.bodySmall,
            ),
            trailing: Icon(
              Icons.remove,
              color: Get.theme.focusColor.withOpacity(0.3),
            ),
          ),
          DrawerLinkWidget(
            icon: Icons.person_outline,
            text: "Profile",
            onTap: (e) async {
              await Get.find<RootController>().changePageByName(Routes.PROFILE);
            },
          ),
          DrawerLinkWidget(
            icon: Icons.settings_outlined,
            text: "Setting",
            onTap: (e) async {
              await Get.find<RootController>().changePageByName(Routes.SETTING);
            },
          ),
          // CustomPageDrawerLinkWidget(),
          Obx(() {
            if (Get.find<AuthService>().isAuth) {
              return DrawerLinkWidget(
                icon: Icons.logout,
                text: "Logout",
                onTap: (e) async {
                  await Get.find<AuthService>().removeCurrentUser();
                  await Get.offAllNamed(Routes.LOGIN);
                },
              );
            } else {
              return const SizedBox(height: 0);
            }
          }),
        ],
      ),
    );
  }
}
