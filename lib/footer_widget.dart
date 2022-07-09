import 'package:flutter/material.dart';

import 'data/contact.dart';

String aboutHyza =
    'HYZA Adalah salah satu Produk Perawatan dan kecantikan yang bergerak di bidang kosmetik dan skincare yang telah bernotifikasi BPOM. \n\nHYZA memiliki sudut pandang yang berbeda dengan brand pada umumnya, kecantikan dan kesehatan menjadi prioritas yang mengedepankan kualitas produk dan harga yang terjangkau serta manajemen yang dikelolah oleh tenaga ahli, Propesional dan terlatih di bidangnya.';

class FooterWidgetMobile extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final double width;

  const FooterWidgetMobile(
      {Key? key, required this.padding, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: Colors.black,
      width: width,
      child: Column(children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About Hyza',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                aboutHyza,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: 2,
          margin: const EdgeInsets.symmetric(vertical: 16),
        ),
        SizedBox(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(children: [
              const Icon(Icons.whatsapp),
              const SizedBox(width: 8),
              Text('+62 ${contact.phoneNumber}'),
            ]),
            const SizedBox(height: 8),
            Row(children: [
              const Icon(Icons.email),
              const SizedBox(width: 8),
              Text(contact.email),
            ]),
            const SizedBox(height: 8),
            Row(children: [
              const Icon(
                Icons.location_on,
                size: 28,
              ),
              const SizedBox(width: 4),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('${contact.street}, ${contact.wardOrVillage}'),
                Text(
                    '${contact.district}, ${contact.cityOrRegency}, ${contact.province}'),
              ]),
            ]),
          ]),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(vertical: 16),
          height: 8,
        ),
        const Text('© Hyza. All rights reserved.'),
        const SizedBox(height: 10),
      ]),
    );
  }
}

class FooterWidgetWeb extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final double width;

  const FooterWidgetWeb({Key? key, required this.padding, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: Colors.black,
      width: width,
      child: Column(children: [
        Row(children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.white, width: 2),
                ),
              ),
              margin: const EdgeInsets.only(right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About Hyza',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    aboutHyza,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(children: [
                    const Icon(Icons.whatsapp),
                    const SizedBox(width: 8),
                    Text('+62 ${contact.phoneNumber}'),
                  ]),
                  const SizedBox(height: 8),
                  Row(children: [
                    const Icon(Icons.email),
                    const SizedBox(width: 8),
                    Text(contact.email),
                  ]),
                  const SizedBox(height: 8),
                  Row(children: [
                    const Icon(
                      Icons.location_on,
                      size: 28,
                    ),
                    const SizedBox(width: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${contact.street}, ${contact.wardOrVillage}'),
                        Text(
                            '${contact.district}, ${contact.cityOrRegency}, ${contact.province}'),
                      ],
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ]),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(vertical: 16),
          height: 8,
        ),
        const Text('© Hyza. All rights reserved.'),
        const SizedBox(height: 10),
      ]),
    );
  }
}
