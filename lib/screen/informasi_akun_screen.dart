// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:fast8_technical_test/utils/color_app.dart';
import 'package:fast8_technical_test/widget/alamat_widget.dart';
import 'package:fast8_technical_test/widget/pekerjaan_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/profile_controller.dart';
import '../widget/biodata_widget.dart';

class InformasiAkunScreen extends StatefulWidget {
  const InformasiAkunScreen({super.key});

  @override
  State<InformasiAkunScreen> createState() => _InformasiAkunScreenState();
}

class _InformasiAkunScreenState extends State<InformasiAkunScreen> {
  @override
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileController>(context, listen: false).changeTab(0);
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileController>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Informasi Akun"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            EasyStepper(
              padding: EdgeInsets.zero,
              activeStep: profileProvider.activeStep,
              activeStepTextColor: ColorApp.text,
              finishedStepTextColor: ColorApp.text,
              showLoadingAnimation: true,
              showStepBorder: true,
              stepRadius: 20,
              finishedStepBackgroundColor: ColorApp.primary,
              lineStyle: LineStyle(
                lineType: LineType.normal,
                finishedLineColor: ColorApp.primary,
                defaultLineColor: ColorApp.text,
                lineLength: MediaQuery.of(context).size.width * 0.2,
                lineThickness: 4.0,
              ),
              steps: [
                EasyStep(
                  customStep: CircleAvatar(
                    backgroundColor: profileProvider.activeStep >= 0
                        ? ColorApp.primary
                        : Colors.white,
                    child: const Text("1"),
                  ),
                  title: 'Biodata',
                ),
                EasyStep(
                  customStep: CircleAvatar(
                    backgroundColor: profileProvider.activeStep >= 1
                        ? ColorApp.primary
                        : Colors.white,
                    child: const Text("2"),
                  ),
                  title: 'Alamat',
                ),
                EasyStep(
                  customStep: CircleAvatar(
                    backgroundColor: profileProvider.activeStep >= 2
                        ? ColorApp.primary
                        : Colors.white,
                    child: const Text("3"),
                  ),
                  title: 'Perkerjaan',
                ),
              ],
              onStepReached: (index) {
                Provider.of<ProfileController>(context, listen: false)
                    .changeTab(index);
              },
            ),
            Expanded(
              child: formWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget formWidget() {
    if (Provider.of<ProfileController>(context, listen: false).activeStep ==
        0) {
      return const BiodataWidget();
    } else if (Provider.of<ProfileController>(context, listen: false)
            .activeStep ==
        1) {
      return const AlamatWidget();
    } else if (Provider.of<ProfileController>(context, listen: false)
            .activeStep ==
        2) {
      return const PekerjaanWidget();
    } else {
      return const SizedBox();
    }
  }
}
