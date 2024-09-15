// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:fast8_technical_test/controller/profile_controller.dart';
import 'package:fast8_technical_test/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

import '../model/profile_model.dart';

class AlamatWidget extends StatefulWidget {
  const AlamatWidget({super.key});

  @override
  State<AlamatWidget> createState() => _AlamatWidgetState();
}

class _AlamatWidgetState extends State<AlamatWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileController>(context);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Foto KTP"),
              InkWell(
                onTap: () {
                  Provider.of<ProfileController>(context, listen: false)
                      .uploadKtp();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: ColorApp.whiteSplash),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(
                        File(profileProvider.photoKtpController.text),
                      ),
                    ),
                  ),
                  child: const Icon(
                    FeatherIcons.upload,
                    size: 24.0,
                  ),
                ),
              ),
              TextFormField(
                controller: profileProvider.nikController,
                decoration: const InputDecoration(labelText: 'NIK'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your NIK';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: profileProvider.alamatKtpController,
                decoration: const InputDecoration(labelText: 'Alamat KTP'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your KTP address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: profileProvider.provinsiController,
                decoration: const InputDecoration(labelText: 'Provinsi'),
              ),
              TextFormField(
                controller: profileProvider.kotaController,
                decoration: const InputDecoration(labelText: 'Kota'),
              ),
              TextFormField(
                controller: profileProvider.kecamatanController,
                decoration: const InputDecoration(labelText: 'Kecamatan'),
              ),
              TextFormField(
                controller: profileProvider.kelurahanController,
                decoration: const InputDecoration(labelText: 'Kelurahan'),
              ),
              TextFormField(
                controller: profileProvider.kodePosController,
                decoration: const InputDecoration(labelText: 'Kode Pos'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Provider.of<ProfileController>(context, listen: false)
                        .changeTab(2);
                  }
                },
                child: const Text('Berikutnya'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
