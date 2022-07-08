class Kontak {
  final int nomorHp;
  final String email;
  final String jlnDesa;
  final String kecKab;
  final String provinsi;

  const Kontak(
      {required this.nomorHp,
      required this.email,
      required this.jlnDesa,
      required this.kecKab,
      required this.provinsi});
}

const Kontak kontak = Kontak(
  nomorHp: 8988226750,
  email: "kemalidris3362@gmail.com",
  jlnDesa: 'Jl. Minasa Upa M1, Gunung Sari, ',
  kecKab: "Rappocini, Makassar, ",
  provinsi: "Sulawesi Selatan",
);
