class ProfileModel {
  String? nama;
  String? tglLahir;
  String? jenisKelamin;
  String? email;
  String? phone;
  String? pendidikan;
  String? statusPerkawinan;
  String? photoKtp;
  String? nik;
  String? alamatKtp;
  String? provinsi;
  String? kota;
  String? kecamatan;
  String? kelurahan;
  String? kodePos;
  String? namaUsaha;
  String? alamatUsaha;
  String? lamaBekerja;
  String? sumberPendapatan;
  String? pendapatanPertahun;
  String? namaBank;
  String? nomorRekening;
  String? cabangBank;
  String? namaRekening;

  ProfileModel(
      {this.nama,
      this.tglLahir,
      this.jenisKelamin,
      this.email,
      this.phone,
      this.pendidikan,
      this.statusPerkawinan,
      this.photoKtp,
      this.nik,
      this.alamatKtp,
      this.provinsi,
      this.kota,
      this.kecamatan,
      this.kelurahan,
      this.kodePos,
      this.namaUsaha,
      this.alamatUsaha,
      this.lamaBekerja,
      this.sumberPendapatan,
      this.pendapatanPertahun,
      this.namaBank,
      this.nomorRekening,
      this.cabangBank,
      this.namaRekening});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    tglLahir = json['tgl_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    email = json['email'];
    phone = json['phone'];
    pendidikan = json['pendidikan'];
    statusPerkawinan = json['status_perkawinan'];
    photoKtp = json['photo_ktp'];
    nik = json['nik'];
    alamatKtp = json['alamat_ktp'];
    provinsi = json['provinsi'];
    kota = json['kota'];
    kecamatan = json['kecamatan'];
    kelurahan = json['kelurahan'];
    kodePos = json['kode_pos'];
    namaUsaha = json['nama_usaha'];
    alamatUsaha = json['alamat_usaha'];
    lamaBekerja = json['lama_bekerja'];
    sumberPendapatan = json['sumber_pendapatan'];
    pendapatanPertahun = json['pendapatan_pertahun'];
    namaBank = json['nama_bank'];
    nomorRekening = json['nomor_rekening'];
    cabangBank = json['cabang_bank'];
    namaRekening = json['nama_rekening'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['tgl_lahir'] = tglLahir;
    data['jenis_kelamin'] = jenisKelamin;
    data['email'] = email;
    data['phone'] = phone;
    data['pendidikan'] = pendidikan;
    data['status_perkawinan'] = statusPerkawinan;
    data['photo_ktp'] = photoKtp;
    data['nik'] = nik;
    data['alamat_ktp'] = alamatKtp;
    data['provinsi'] = provinsi;
    data['kota'] = kota;
    data['kecamatan'] = kecamatan;
    data['kelurahan'] = kelurahan;
    data['kode_pos'] = kodePos;
    data['nama_usaha'] = namaUsaha;
    data['alamat_usaha'] = alamatUsaha;
    data['lama_bekerja'] = lamaBekerja;
    data['sumber_pendapatan'] = sumberPendapatan;
    data['pendapatan_pertahun'] = pendapatanPertahun;
    data['nama_bank'] = namaBank;
    data['nomor_rekening'] = nomorRekening;
    data['cabang_bank'] = cabangBank;
    data['nama_rekening'] = namaRekening;
    return data;
  }
}
