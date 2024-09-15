// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:fast8_technical_test/screen/informasi_akun_screen.dart';
import 'package:fast8_technical_test/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

import '../controller/image_picker_controller.dart';
import '../widget/item_profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Provider.of<ImagePickerController>(context, listen: false)
                          .showImageSourceDialog(context);
                    },
                    child: Stack(
                      children: [
                        Consumer<ImagePickerController>(
                          builder: (BuildContext context,
                              ImagePickerController imagePickerController, _) {
                            if (imagePickerController.imagePath == null ||
                                imagePickerController.imagePath!.isEmpty) {
                              return const CircleAvatar(
                                minRadius: 30,
                                child: Icon(Icons.person),
                              );
                            } else {
                              return CircleAvatar(
                                minRadius: 30,
                                backgroundImage: FileImage(File(
                                    imagePickerController.imagePath
                                        .toString())),
                              );
                            }
                          },
                        ),
                        const Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: ColorApp.secondary,
                            minRadius: 10,
                            child: Icon(FeatherIcons.camera,
                                size: 10, color: ColorApp.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Irvan Flutter Developer",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text("Masuk reguler dengan email"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ItemProfileWidget(
              icon: FeatherIcons.user,
              title: "Informasi Akun",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InformasiAkunScreen()),
                );
              },
            ),
            ItemProfileWidget(
              icon: FeatherIcons.key,
              title: "Ubah Password",
              onTap: () {},
            ),
            ItemProfileWidget(
              icon: FeatherIcons.messageCircle,
              title: "Bantuan",
              onTap: () {},
            ),
            ItemProfileWidget(
              icon: FeatherIcons.logOut,
              title: "Keluar",
              onTap: () {},
            ),
            ItemProfileWidget(
              icon: FeatherIcons.trash,
              title: "Hapus Akun",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
