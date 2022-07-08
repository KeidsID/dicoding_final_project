import 'package:flutter/material.dart';

import '../appbar_action_button.dart';
import '../footer_widget.dart';

import '../page/detail_page.dart';

import '../data/produk_list.dart';

class ProdukListPage extends StatefulWidget {
  const ProdukListPage({Key? key}) : super(key: key);

  @override
  State<ProdukListPage> createState() => _ProdukListPageState();
}

class _ProdukListPageState extends State<ProdukListPage> {
  final scrollCtrlerForBtn = ScrollController();
  bool showbtn = false;

  @override
  void initState() {
    scrollCtrlerForBtn.addListener(() {
      //scroll listener
      double showoffset =
          10.0; //Back to top botton will show on scroll offset 10.0

      if (scrollCtrlerForBtn.offset > showoffset) {
        showbtn = true;
        setState(() {
          //update state
        });
      } else {
        showbtn = false;
        setState(() {
          //update state
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isMobileWidth = screenSize.width <= 600;
    bool isTabWidth = screenSize.width <= 1200;

    // Scaffold appBar
    var appBarTitleAlignment =
        (isMobileWidth) ? MainAxisAlignment.center : MainAxisAlignment.start;
    double appBArTitleSizedBoxWidth = (isMobileWidth)
        ? 25
        : (isTabWidth)
            ? 0
            : 100;
    var appBarActionMargin = (isTabWidth)
        ? const EdgeInsets.symmetric(vertical: 24, horizontal: 12)
        : const EdgeInsets.all(24.0);
    var appBarActionWidget = (isMobileWidth)
        ? <Widget>[
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                  onPressed: () {
                    scrollCtrlerForBtn.animateTo(
                        9999, // scroll offset to go (0 => top, >0 => getting down)
                        duration: const Duration(
                            milliseconds: 500), // duration of scroll
                        curve: Curves.fastOutSlowIn // scroll type
                        );
                  },
                  icon: const Icon(Icons.contact_support),
                )),
          ]
        : (isTabWidth)
            ? <Widget>[
                AppBarActionButton(
                  margin: appBarActionMargin,
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/');
                  },
                  text: 'Beranda',
                ),
                AppBarActionButton(
                  margin: appBarActionMargin,
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/joinMember');
                  },
                  text: 'Join Member',
                ),
                AppBarActionButton(
                  margin: appBarActionMargin,
                  onPressed: () {
                    scrollCtrlerForBtn.animateTo(
                        9999, // scroll offset to go (0 => top, >0 => getting down)
                        duration: const Duration(
                            milliseconds: 500), // duration of scroll
                        curve: Curves.fastOutSlowIn // scroll type
                        );
                  },
                  text: 'Contact Us',
                ),
                const SizedBox(width: 24),
              ]
            : <Widget>[
                AppBarActionButton(
                  margin: appBarActionMargin,
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/');
                  },
                  text: 'Beranda',
                ),
                AppBarActionButton(
                  margin: appBarActionMargin,
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/joinMember');
                  },
                  text: 'Join Member',
                ),
                AppBarActionButton(
                  margin: appBarActionMargin,
                  onPressed: () {
                    scrollCtrlerForBtn.animateTo(
                        9999, // scroll offset to go (0 => top, >0 => getting down)
                        duration: const Duration(
                            milliseconds: 500), // duration of scroll
                        curve: Curves.fastOutSlowIn // scroll type
                        );
                  },
                  text: 'Contact Us',
                ),
                const SizedBox(width: 100),
              ];

    // Scaffold body
    var mainContainerMargin = (isMobileWidth)
        ? const EdgeInsets.symmetric(vertical: 16, horizontal: 24)
        : (isTabWidth)
            ? const EdgeInsets.symmetric(vertical: 16, horizontal: 56)
            : const EdgeInsets.symmetric(vertical: 16, horizontal: 88);

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
      appBar: AppBar(
        automaticallyImplyLeading: isMobileWidth,
        title: Row(
          mainAxisAlignment: appBarTitleAlignment,
          children: [
            SizedBox(width: appBArTitleSizedBoxWidth),
            Container(
                padding: const EdgeInsets.all(14),
                width: 120,
                height: 120,
                child: Image.asset(
                  'assets/images/Logo/LOGO HYZA copy.png',
                  fit: BoxFit.contain,
                )),
          ],
        ),
        // title: Center(child: Text(screenSize.toString())),
        actions: appBarActionWidget,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 255, 220, 131).withOpacity(0.1),
                Colors.transparent
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        toolbarHeight: 75,
      ),
      body: SingleChildScrollView(
        controller: scrollCtrlerForBtn,
        child: Column(children: [
          // Produk List
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            // color: Colors.white.withOpacity(0),
            width: screenSize.width,
            margin: mainContainerMargin,
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 8,
              runSpacing: 16,
              children: produkList
                  .map((produkObj) => ProdukContainer(produkObj))
                  .toList(),
            ),
          ),

          // Footer
          footerWidget,
        ]),
      ),
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 100), // animation duration
        opacity: showbtn ? 1.0 : 0.0, // set opacity
        child: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(235, 192, 128, 1),
          hoverColor: const Color.fromRGBO(215, 172, 108, 1),
          onPressed: () {
            scrollCtrlerForBtn.animateTo(
                0, // scroll offset to go (0 => top, >0 => getting down)
                duration:
                    const Duration(milliseconds: 500), // duration of scroll
                curve: Curves.fastOutSlowIn // scroll type
                );
          },
          child: const Icon(Icons.arrow_upward),
        ),
      ),
      drawer: Drawer(
        child: ListView(children: [
          Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(
                      0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                  // Container Color
                  const BoxShadow(
                    color: Color.fromARGB(255, 60, 60, 60),
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ],
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 255, 220, 131).withOpacity(0.1),
                    Colors.transparent
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              height: 75,
              child: Image.asset(
                'assets/images/Logo/LOGO HYZA copy.png',
                fit: BoxFit.contain,
              )),
          ListTile(
            onTap: () {
              Navigator.popAndPushNamed(context, '/');
            },
            title: const Text('Beranda'),
          ),
          ListTile(
            onTap: () {
              Navigator.popAndPushNamed(context, '/joinMember');
            },
            title: const Text('Join Member'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              scrollCtrlerForBtn.animateTo(
                2000, // scroll offset to go (0 => top, >0 => getting down)
                duration:
                    const Duration(milliseconds: 500), // duration of scroll
                curve: Curves.fastOutSlowIn, // scroll type
              );
            },
            title: const Text('Contact Us'),
          ),
        ]),
      ),
    );
  }
}

class ProdukContainer extends StatelessWidget {
  final Produk produk;

  const ProdukContainer(this.produk, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width and height
      width: 200,
      height: 304,
      child: Material(
        // decoration
        color: const Color.fromRGBO(30, 30, 30, 1),
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPage(produk);
            }));
          },
          child: Padding(
            // padding
            padding: const EdgeInsets.all(8.0),
            // Container content
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image
                Expanded(
                  child: Stack(children: [
                    Hero(
                      tag: produk.heroTag,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          produk.assetsPath,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
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
                          margin: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            produk.harga,
                            style: const TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ]),
                ),

                // Nama
                Text(produk.nama,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 2),
                const Text('Tekan untuk detail',
                    style: TextStyle(color: Colors.white60, fontSize: 12)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
