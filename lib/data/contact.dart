class Contact {
  final int phoneNumber;
  final String email;
  final String street;
  final String wardOrVillage;
  final String district;
  final String cityOrRegency;
  final String province;

  const Contact({
    required this.phoneNumber,
    required this.email,
    required this.street,
    required this.wardOrVillage,
    required this.district,
    required this.cityOrRegency,
    required this.province,
  });
}

const Contact contact = Contact(
  phoneNumber: 8988226750,
  email: "kemalidris3362@gmail.com",
  street: 'Jl. Minasa Upa M1',
  wardOrVillage: 'Gunung Sari',
  district: 'Rappocini',
  cityOrRegency: 'Makassar',
  province: "Sulawesi Selatan",
);
