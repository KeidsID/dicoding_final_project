/// size image harus sekitar 200px * 200px biar ClipOvalnya bagus

class Testimoni {
  final String assetsPath;
  final String nama;
  final String testimoni;

  const Testimoni(
      {required this.assetsPath, required this.nama, required this.testimoni});
}

const List<Testimoni> testimoniList = [
  Testimoni(
    assetsPath: "assets/images/Testimoni/Jumria Khaerani.jpg",
    nama: "Jumria Khaerani",
    testimoni:
        "Lip Gloss Serum dari Hyza membuat bibir saya terasa lembab dan cerah",
  ),
  Testimoni(
    assetsPath: "assets/images/Testimoni/Keids.jpg",
    nama: "Kemal Idris",
    testimoni:
        "Ketika memakai Hair Living Shampoo dari Hyza, rambut saya benar-benar menjadi bersih tanpa ketombe. Uwaw.",
  ),
  Testimoni(
    assetsPath: "assets/images/Testimoni/Asisah.jpg",
    nama: "Asisah Imut",
    testimoni:
        "Tiap pagi dan malam, ibu saya selalu memberi Whitening Body Lotion dari Hyza di kulitku. Makanya kulit saya terlihat cerah bukan",
  ),
  // Testimoni(
  //   assetsPath: "assets/images/Testimoni/",
  //   nama: "",
  //   testimoni:
  //       "",
  // ),
];
