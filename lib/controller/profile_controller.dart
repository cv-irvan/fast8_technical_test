import 'dart:convert';
import 'package:fast8_technical_test/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../model/profile_model.dart';

class ProfileController extends ChangeNotifier {
  static const String boxName = 'profileBox';
  static const String profileKey = 'userProfile';

  int activeStep = 0;

  final TextEditingController namaController = TextEditingController();
  final TextEditingController tglLahirController = TextEditingController();
  final TextEditingController jenisKelaminController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController pendidikanController = TextEditingController();
  final TextEditingController statusPerkawinanController =
      TextEditingController();
  final TextEditingController photoKtpController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController alamatKtpController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kotaController = TextEditingController();
  final TextEditingController kecamatanController = TextEditingController();
  final TextEditingController kelurahanController = TextEditingController();
  final TextEditingController kodePosController = TextEditingController();
  final TextEditingController namaUsahaController = TextEditingController();
  final TextEditingController alamatUsahaController = TextEditingController();
  final TextEditingController lamaBekerjaController = TextEditingController();
  final TextEditingController sumberPendapatanController =
      TextEditingController();
  final TextEditingController pendapatanPertahunController =
      TextEditingController();
  final TextEditingController namaBankController = TextEditingController();
  final TextEditingController nomorRekeningController = TextEditingController();
  final TextEditingController cabangBankController = TextEditingController();
  final TextEditingController namaRekeningController = TextEditingController();

  ProfileModel profile = ProfileModel();

  ProfileController() {
    loadProfile();
  }

  Future<void> initHive() async {
    await Hive.initFlutter();
    await Hive.openBox(boxName);
  }

  Future<void> saveProfile(ProfileModel profile) async {
    final box = await Hive.openBox(boxName);
    final jsonString = jsonEncode(profile.toJson());
    await box.put(profileKey, jsonString);
  }

  Future loadProfile() async {
    final box = await Hive.openBox(boxName);
    final jsonString = box.get(profileKey);
    if (jsonString != null) {
      final Map<String, dynamic> json = jsonDecode(jsonString);
      profile = ProfileModel.fromJson(json);
    }
  }

  Future uploadKtp() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      final String imagePath = image.path;
      photoKtpController.text = imagePath;
      notifyListeners();
    }
  }

  Future changeTab(int index) async {
    activeStep = index;
    notifyListeners();
  }

  Future submitProfile(BuildContext context) async {
    ProfileModel profile = ProfileModel(
      nama: namaController.text,
      tglLahir: tglLahirController.text,
      jenisKelamin: jenisKelaminController.text,
      email: emailController.text,
      phone: phoneController.text,
      pendidikan: pendidikanController.text,
      statusPerkawinan: statusPerkawinanController.text,
      photoKtp: photoKtpController.text,
      nik: nikController.text,
      alamatKtp: alamatKtpController.text,
      provinsi: provinsiController.text,
      kota: kotaController.text,
      kecamatan: kecamatanController.text,
      kelurahan: kelurahanController.text,
      kodePos: kodePosController.text,
      namaUsaha: namaUsahaController.text,
      alamatUsaha: alamatUsahaController.text,
      lamaBekerja: lamaBekerjaController.text,
      sumberPendapatan: sumberPendapatanController.text,
      pendapatanPertahun: pendapatanPertahunController.text,
      namaBank: namaBankController.text,
      nomorRekening: nomorRekeningController.text,
      cabangBank: cabangBankController.text,
      namaRekening: namaRekeningController.text,
    );

    await saveProfile(profile);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
  }
}
