class Product {
  final String heroTag;
  final String assetsPath;
  final String name;
  final String price;
  final String description;
  final String bpom;
  final String howToUse;

  const Product({
    required this.heroTag,
    required this.assetsPath,
    required this.name,
    required this.price,
    required this.description,
    required this.bpom,
    required this.howToUse,
  });
}

const List<Product> productList = [
  Product(
    heroTag: 'product0',
    assetsPath: "assets/images/Product/Lip Cream Matte.jpg",
    name: "Lip Cream Matte",
    price: "Rp.65.000,00",
    description: "Berguna memberi warna natural pada bibir.",
    bpom: "NA 18211302201",
    howToUse: 'Oleskan secara merata pada bibir anda.',
  ),
  Product(
    heroTag: 'product1',
    assetsPath: "assets/images/Product/Hair Living Shampoo.jpg",
    name: "Hair Living Shampoo",
    price: "Rp.80.000,00",
    description:
        "Shampoo yang berguna untuk merawat rambut agar tetap kuat dan sehat. Membersihkan kulit kepala dari minyak, dan kotoran yang menempel. Menyingkirkan penumpukan sel kulit mati dan ketombe. Menjadikan rambut terasa bersih, harum dan gampang di atur.",
    bpom: "NA 18211001799",
    howToUse:
        'Basahi rambut dengan merata, tuangkan Hyza Hair Living Shampoo secukupnya, pada telapak tangan dan usapkan pada permukaan kulit rambut, pijat dan biarkan selama 2-3 menit. Bilas sampai bersih.',
  ),
  Product(
    heroTag: 'product2',
    assetsPath: "assets/images/Product/Hair Living Serum.jpg",
    name: "Hair Living Serum",
    price: "Rp.75.000,00",
    description:
        "Serum rambut yang berguna untuk merawat rambut agar tetap kuat dan sehat, menjadikan rambut lebih tebal dan mudah di atur.",
    bpom: "NA 18211001800",
    howToUse:
        'Tuangkan, secekupnya pada telapak tangan lalu usapkan ke kepala. Gunakan setelah mandi secara rutin agar mendapat hasil yang maksimal',
  ),
  Product(
    heroTag: 'product3',
    assetsPath: "assets/images/Product/Lip Gloss Serum.jpg",
    name: "Lip Gloss Serum",
    price: "Rp.75.000,00",
    description: "null",
    bpom: "NA 18211302114",
    howToUse:
        'Oleskan beberapa tetes lipserum pada bibir yang sudah bersih, diamkan selama beberapa menit',
  ),
  Product(
    heroTag: 'product4',
    assetsPath: "assets/images/Product/Whitening Body Lotion.jpg",
    name: "Whitening Body Lotion",
    price: "Rp.110.000,00",
    description:
        "Lotion ini dapat membantu kulit nanpak lebih cerah dan melindungi kulit dari UV filter. melindungi kulit dari pengaruh buruk sinar matahari, serta membantu merawat dan menjaga kelembaban kulit agar tetap sehat.",
    bpom: "NA 18210111617",
    howToUse:
        'Usapkan HYZA Whitening Body Lotion secara merata ke seluruh tubuh yang telah bersih pada pagi dan siang hari, ulangi pemakaian setiap kali diperlukan.',
  ),
  // Product(
  //   heroTag: 'product5',
  //   assetsPath: 'assets/images/Product/',
  //   name: '',
  //   price: 'Rp.,,00',
  //   description: '',
  //   bpom: '',
  //   howToUse: '',
  // ),
];
