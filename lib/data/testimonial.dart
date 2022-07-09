/// size image harus sekitar 200px * 200px biar ClipOvalnya bagus

class Testimonial {
  final String assetsPath;
  final String name;
  final String testimonial;

  const Testimonial(
      {required this.assetsPath, required this.name, required this.testimonial});
}

const List<Testimonial> testimonialList = [
  Testimonial(
    assetsPath: "assets/images/Testimonial/Jumria Khaerani.jpg",
    name: "Jumria Khaerani",
    testimonial:
        "Lip Gloss Serum dari Hyza membuat bibir saya terasa lembab dan cerah",
  ),
  Testimonial(
    assetsPath: "assets/images/Testimonial/Keids.jpg",
    name: "Kemal Idris",
    testimonial:
        "Ketika memakai Hair Living Shampoo dari Hyza, rambut saya benar-benar menjadi bersih tanpa ketombe. Uwaw.",
  ),
  Testimonial(
    assetsPath: "assets/images/Testimonial/Asisah.jpg",
    name: "Asisah Imut",
    testimonial:
        "Tiap pagi dan malam, ibu saya selalu memberi Whitening Body Lotion dari Hyza di kulitku. Makanya kulit saya terlihat cerah bukan",
  ),
  // Testimonial(
  //   assetsPath: "assets/images/Testimonial/",
  //   name: "",
  //   testimonial:
  //       "",
  // ),
];
