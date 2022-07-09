import 'package:dicoding_final_project/heading_widget.dart';
import 'package:flutter/material.dart';

import '../heading_widget.dart';
import '../footer_widget.dart';

import '../data/product_list.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  const DetailPage(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints boxConstraints) {
        if (boxConstraints.maxWidth <= 600) {
          return DetailPageMobile(product);
        } else {
          return DetailPageWeb(product);
        }
      },
    );
  }
}

class DetailPageMobile extends StatelessWidget {
  final Product product;

  const DetailPageMobile(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isMobileWidth = screenSize.width <= 600;
    bool isTabWidth = screenSize.width <= 1200;

    // Scaffold body footer
    var footerContainerPadding = (isMobileWidth)
        ? const EdgeInsets.symmetric(vertical: 16, horizontal: (24 / 2))
        : (isTabWidth)
            ? const EdgeInsets.symmetric(vertical: 16, horizontal: (56 / 2))
            : const EdgeInsets.symmetric(vertical: 16, horizontal: (88 / 2));
    var footerWidget = (isTabWidth)
        ? FooterWidgetMobile(
            padding: footerContainerPadding, width: screenSize.width)
        : FooterWidgetWeb(
            padding: footerContainerPadding, width: screenSize.width);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            // Image
            Container(
              color: Colors.white,
              width: screenSize.width,
              height: screenSize.height - (screenSize.height / 6),
              child: Stack(children: [
                SizedBox(
                  width: screenSize.width,
                  height: screenSize.height - (screenSize.height / 6),
                  child: Hero(
                    tag: product.heroTag,
                    child: Image.asset(
                      product.assetsPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      radius: 27,
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(
                            0,
                            0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                        ),
                        // Container Color
                        const BoxShadow(
                          color: Color.fromRGBO(235, 192, 128, 1),
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      border: Border.all(
                        color: const Color.fromRGBO(175, 132, 68, 1),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.all(14.0),
                    child: Text(
                      product.price,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ]),
              ]),
            ),
            const SizedBox(height: 16),

            // Deskripsi + BPOM
            HeadingContainer(product.name),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                product.description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'No. BPOM: ${product.bpom}',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.25),
                borderRadius: BorderRadius.circular(8),
              ),
              width: screenSize.width,
              height: 8,
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            ),

            // Cara Pemakaian
            const HeadingContainer('Cara Pemakaian'),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                product.howToUse,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),

            // Footer
            const SizedBox(height: 16),
            footerWidget,
          ]),
        ),
      ),
    );
  }
}

class DetailPageWeb extends StatelessWidget {
  final Product product;

  const DetailPageWeb(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isTabWidth = screenSize.width <= 1200;

    // Scaffold body
    var mainContainerMargin = (isTabWidth)
        ? const EdgeInsets.symmetric(vertical: 8, horizontal: 56)
        : const EdgeInsets.symmetric(vertical: 8, horizontal: 88);
    var descContainerFlex = (isTabWidth) ? 1 : 2;

    // Scaffold body footer
    var footerContainerPadding = (isTabWidth)
        ? const EdgeInsets.symmetric(vertical: 16, horizontal: (56 / 2))
        : const EdgeInsets.symmetric(vertical: 16, horizontal: (88 / 2));
    var footerWidget = (isTabWidth)
        ? FooterWidgetMobile(
            padding: footerContainerPadding, width: screenSize.width)
        : FooterWidgetWeb(
            padding: footerContainerPadding, width: screenSize.width);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 8),
            // product name
            Padding(
              padding: mainContainerMargin,
              child: HeadingContainer(product.name),
            ),

            // Image with description
            Container(
              margin: mainContainerMargin,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                // Image
                Expanded(
                  child: Hero(
                    tag: product.heroTag,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        product.assetsPath,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Description
                Expanded(
                  flex: descContainerFlex,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(235, 192, 128, 1),
                          border: Border.all(
                            color: const Color.fromRGBO(175, 132, 68, 1),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          product.price,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.description),
                            const SizedBox(height: 4),
                            Text(
                              'No. BPOM: ${product.bpom}',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Cara Pakai: ',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(product.howToUse),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(30, 30, 30, 1),
                          shadowColor: Colors.white,
                        ),
                        child: const Text('Kembali'),
                      ),
                    ],
                  ),
                ),
              ]),
            ),

            // Footer
            const SizedBox(height: 16),
            footerWidget,
          ]),
        ),
      ),
    );
  }
}
