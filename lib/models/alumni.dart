class Alumni {
  String nama;
  String tahunLulus;
  String pekerjaan;
  String perusahaan;

  Alumni({
    required this.nama,
    required this.tahunLulus,
    required this.pekerjaan,
    required this.perusahaan,
  });
}

/// database sementara
List<Alumni> alumniDatabase = [];