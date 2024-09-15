// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:fast8_technical_test/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/profile_model.dart';

class BiodataWidget extends StatefulWidget {
  const BiodataWidget({super.key});

  @override
  State<BiodataWidget> createState() => _BiodataWidgetState();
}

class _BiodataWidgetState extends State<BiodataWidget> {
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
              TextFormField(
                controller: profileProvider.namaController,
                decoration: const InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: profileProvider.tglLahirController,
                decoration: const InputDecoration(labelText: 'Tanggal Lahir'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your birth date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: profileProvider.jenisKelaminController,
                decoration: const InputDecoration(labelText: 'Jenis Kelamin'),
              ),
              TextFormField(
                controller: profileProvider.emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: profileProvider.phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: profileProvider.pendidikanController,
                decoration: const InputDecoration(labelText: 'Pendidikan'),
              ),
              TextFormField(
                controller: profileProvider.statusPerkawinanController,
                decoration:
                    const InputDecoration(labelText: 'Status Perkawinan'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Provider.of<ProfileController>(context, listen: false)
                        .changeTab(1);
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
