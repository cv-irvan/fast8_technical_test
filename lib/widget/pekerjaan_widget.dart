// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:fast8_technical_test/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/profile_model.dart';

class PekerjaanWidget extends StatefulWidget {
  const PekerjaanWidget({super.key});

  @override
  State<PekerjaanWidget> createState() => _PekerjaanWidgetState();
}

class _PekerjaanWidgetState extends State<PekerjaanWidget> {
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
                controller: profileProvider.namaUsahaController,
                decoration: const InputDecoration(labelText: 'Nama Usaha'),
              ),
              TextFormField(
                controller: profileProvider.alamatUsahaController,
                decoration: const InputDecoration(labelText: 'Alamat Usaha'),
              ),
              TextFormField(
                controller: profileProvider.lamaBekerjaController,
                decoration: const InputDecoration(labelText: 'Lama Bekerja'),
              ),
              TextFormField(
                controller: profileProvider.sumberPendapatanController,
                decoration:
                    const InputDecoration(labelText: 'Sumber Pendapatan'),
              ),
              TextFormField(
                controller: profileProvider.pendapatanPertahunController,
                decoration:
                    const InputDecoration(labelText: 'Pendapatan Pertahun'),
              ),
              TextFormField(
                controller: profileProvider.namaBankController,
                decoration: const InputDecoration(labelText: 'Nama Bank'),
              ),
              TextFormField(
                controller: profileProvider.nomorRekeningController,
                decoration: const InputDecoration(labelText: 'Nomor Rekening'),
              ),
              TextFormField(
                controller: profileProvider.cabangBankController,
                decoration: const InputDecoration(labelText: 'Cabang Bank'),
              ),
              TextFormField(
                controller: profileProvider.namaRekeningController,
                decoration: const InputDecoration(labelText: 'Nama Rekening'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Provider.of<ProfileController>(context, listen: false)
                        .submitProfile(context);
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
