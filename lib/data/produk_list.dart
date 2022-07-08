class Produk {
  final String heroTag;
  final String assetsPath;
  final String nama;
  final String harga;
  final String deskripsi;
  final String bpom;
  final String howToUse;

  const Produk({
    required this.heroTag,
    required this.assetsPath,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.bpom,
    required this.howToUse,
  });
}

const List<Produk> produkList = [
  Produk(
    heroTag: 'produk0',
    assetsPath: "assets/images/Produk/Lip Cream Matte.jpg",
    nama: "Lip Cream Matte",
    harga: "Rp.65.000,00",
    deskripsi: "Berguna memberi warna natural pada bibir.",
    bpom: "NA 18211302201",
    howToUse: 'Oleskan secara merata pada bibir anda.',
  ),
  Produk(
    heroTag: 'produk1',
    assetsPath: "assets/images/Produk/Hair Living Shampoo.jpg",
    nama: "Hair Living Shampoo",
    harga: "Rp.80.000,00",
    deskripsi:
        "Shampoo yang berguna untuk merawat rambut agar tetap kuat dan sehat. Membersihkan kulit kepala dari minyak, dan kotoran yang menempel. Menyingkirkan penumpukan sel kulit mati dan ketombe. Menjadikan rambut terasa bersih, harum dan gampang di atur.",
    bpom: "NA 18211001799",
    howToUse:
        'Basahi rambut dengan merata, tuangkan Hyza Hair Living Shampoo secukupnya, pada telapak tangan dan usapkan pada permukaan kulit rambut, pijat dan biarkan selama 2-3 menit. Bilas sampai bersih.',
  ),
  Produk(
    heroTag: 'produk2',
    assetsPath: "assets/images/Produk/Hair Living Serum.jpg",
    nama: "Hair Living Serum",
    harga: "Rp.75.000,00",
    deskripsi:
        "Serum rambut yang berguna untuk merawat rambut agar tetap kuat dan sehat, menjadikan rambut lebih tebal dan mudah di atur.",
    bpom: "NA 18211001800",
    howToUse:
        'Tuangkan, secekupnya pada telapak tangan lalu usapkan ke kepala. Gunakan setelah mandi secara rutin agar mendapat hasil yang maksimal',
  ),
  Produk(
    heroTag: 'produk3',
    assetsPath: "assets/images/Produk/Lip Gloss Serum.jpg",
    nama: "Lip Gloss Serum",
    harga: "Rp.75.000,00",
    deskripsi: "null",
    bpom: "NA 18211302114",
    howToUse:
        'Oleskan beberapa tetes lipserum pada bibir yang sudah bersih, diamkan selama beberapa menit',
  ),
  Produk(
    heroTag: 'produk4',
    assetsPath: "assets/images/Produk/Whitening Body Lotion.jpg",
    nama: "Whitening Body Lotion",
    harga: "Rp.110.000,00",
    deskripsi:
        "Lotion ini dapat membantu kulit nanpak lebih cerah dan melindungi kulit dari UV filter. melindungi kulit dari pengaruh buruk sinar matahari, serta membantu merawat dan menjaga kelembaban kulit agar tetap sehat.",
    bpom: "NA 18210111617",
    howToUse:
        'Usapkan HYZA Whitening Body Lotion secara merata ke seluruh tubuh yang telah bersih pada pagi dan siang hari, ulangi pemakaian setiap kali diperlukan.',
  ),
];
