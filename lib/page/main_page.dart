import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../appbar_action_button.dart';
import '../heading_widget.dart';
import '../footer_widget.dart';

import '../page/detail_page.dart';

import '../data/highlight.dart';
import '../data/product_list.dart';
import '../data/testimonial.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int _currentCarouselIndex = 0;
  int _currentCarouselIndex2 = 0;

  final _carouselCtrler = CarouselController();
  final _scrollController = ScrollController();
  final _carouselCtrler2 = CarouselController();

  final _scrollCtrlerForBtn = ScrollController();
  bool _showbtn = false;

  @override
  void initState() {
    _scrollCtrlerForBtn.addListener(() {
      //scroll listener
      double showoffset =
          10.0; //Back to top botton will show on scroll offset 10.0

      if (_scrollCtrlerForBtn.offset > showoffset) {
        _showbtn = true;
        setState(() {
          //update state
        });
      } else {
        _showbtn = false;
        setState(() {
          //update state
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
                    _scrollCtrlerForBtn.animateTo(
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
                    Navigator.popAndPushNamed(context, '/productList');
                  },
                  text: 'Daftar Product',
                ),
                AppBarActionButton(
                    margin: appBarActionMargin,
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/joinMember');
                    },
                    text: 'Join Member'),
                AppBarActionButton(
                  margin: appBarActionMargin,
                  onPressed: () {
                    _scrollCtrlerForBtn.animateTo(
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
                    Navigator.popAndPushNamed(context, '/productList');
                  },
                  text: 'Daftar Product',
                ),
                AppBarActionButton(
                    margin: appBarActionMargin,
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/joinMember');
                    },
                    text: 'Join Member'),
                AppBarActionButton(
                  margin: appBarActionMargin,
                  onPressed: () {
                    _scrollCtrlerForBtn.animateTo(
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
    double produkListDisplayContainerHeight = (isTabWidth) ? 350 : 326;
    var produkListDisplay = (isTabWidth)
        ? ProdukListDisplayMobile(scrollController: _scrollController)
        : const ProdukListDisplayWeb();

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
        controller: _scrollCtrlerForBtn,
        child: Column(children: [
          // Highlight
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Color.fromRGBO(255, 255, 255, 0.5),
              width: 3,
            ))),
            margin: const EdgeInsets.only(bottom: 8),
            child: Column(children: [
              CarouselSlider(
                items: highlightImgList
                    .map(
                      (assetsPath) => Container(
                        width: screenSize.width,
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ClipRRect(
                          child: Image.asset(
                            assetsPath,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                carouselController: _carouselCtrler,
                options: CarouselOptions(
                  height: screenSize.height - (screenSize.height / 4),
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 6),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.easeOutBack,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentCarouselIndex = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: productList.asMap().entries.map((produkListMap) {
                  return GestureDetector(
                    onTap: () =>
                        _carouselCtrler.animateToPage(produkListMap.key),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            const Color.fromRGBO(235, 192, 128, 1).withOpacity(
                          _currentCarouselIndex == produkListMap.key ? 1 : 0.5,
                        ),
                      ),
                      width: 16.0,
                      height: 16.0,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 4.0,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ]),
          ),
          const SizedBox(height: 16),

          // Product Hyza
          const HeadingContainer('Product Hyza'),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            width: screenSize.width,
            height: produkListDisplayContainerHeight,
            margin: mainContainerMargin,
            child: produkListDisplay,
          ),
          const SizedBox(height: 16),

          // Kenapa Pilih Hyza
          const HeadingContainer('Kelebihan Product Hyza'),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            width: screenSize.width,
            margin: mainContainerMargin,
            child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: 8,
                runSpacing: 16,
                children: [
                  SizedBox(
                    width: 200,
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(30, 30, 30, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          'assets/images/Logo/Logo BPOM.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Terdaftar di BPOM',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ),
                  //
                  SizedBox(
                    width: 200,
                    child: Column(children: [
                      Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(30, 30, 30, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            'assets/images/Logo/fresh icon resized.png',
                            fit: BoxFit.cover,
                          )),
                      const SizedBox(height: 16),
                      const Text(
                        'Fresh and Natural',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
                  ),
                  //
                  SizedBox(
                    width: 200,
                    child: Column(children: [
                      Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(30, 30, 30, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            'assets/images/Logo/quality icon resized.png',
                            fit: BoxFit.cover,
                          )),
                      const SizedBox(height: 16),
                      const Text(
                        'Kualitas Terjamin',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
                  ),
                ]),
          ),
          const SizedBox(height: 16),

          // Testimoni
          const HeadingContainer('Testimoni'),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            width: screenSize.width,
            height: 400,
            margin: mainContainerMargin,
            child: Column(children: [
              CarouselSlider(
                items: testimonialList
                    .map(
                      (testimoniObj) => Container(
                        margin: const EdgeInsets.only(top: 16, bottom: 8),
                        width: screenSize.width - (screenSize.width / 4),
                        child: Column(children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(30, 30, 30, 1),
                              shape: BoxShape.circle,
                            ),
                            width: 125,
                            height: 125,
                            child: ClipOval(
                              child: Image.asset(
                                testimoniObj.assetsPath,
                                scale: 2.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '"${testimoniObj.testimonial}"',
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text("- ${testimoniObj.name} -"),
                        ]),
                      ),
                    )
                    .toList(),
                carouselController: _carouselCtrler2,
                options: CarouselOptions(
                  height: 300,
                  viewportFraction: 1,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentCarouselIndex2 = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: testimonialList.asMap().entries.map((testimoniListMap) {
                  return GestureDetector(
                    onTap: () =>
                        _carouselCtrler2.animateToPage(testimoniListMap.key),
                    child: Container(
                      width: 16.0,
                      height: 16.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(
                              _currentCarouselIndex2 == testimoniListMap.key
                                  ? 1
                                  : 0.25)),
                    ),
                  );
                }).toList(),
              ),
            ]),
          ),
          const SizedBox(height: 16),

          // Footer
          footerWidget,
        ]),
      ),
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: _showbtn ? 1.0 : 0.0,
        child: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(235, 192, 128, 1),
          hoverColor: const Color.fromRGBO(215, 172, 108, 1),
          onPressed: () {
            _scrollCtrlerForBtn.animateTo(
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
              Navigator.popAndPushNamed(context, '/productList');
            },
            title: const Text('Daftar Product'),
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
              _scrollCtrlerForBtn.animateTo(
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

// Product List Display Container
class ProdukListContainer extends StatelessWidget {
  final Product product;

  const ProdukListContainer(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // margin
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        // width and height
        width: 200,
        child: Material(
          // decoration
          color: const Color.fromRGBO(30, 30, 30, 1),
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(product);
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
                        tag: product.heroTag,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            product.assetsPath,
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
                              product.price,
                              style: const TextStyle(color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ]),
                  ),

                  // Nama
                  Text(product.name,
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
      ),
    );
  }
}

class ProdukListDisplayMobile extends StatelessWidget {
  final ScrollController scrollController;

  const ProdukListDisplayMobile({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: ListView(
          scrollDirection: Axis.horizontal,
          controller: scrollController,
          children: [
            ProdukListContainer(productList[0]),
            ProdukListContainer(productList[1]),
            ProdukListContainer(productList[2]),
            ProdukListContainer(productList[3]),
            Container(
              padding: const EdgeInsets.all(8),
              width: 200,
              height: 334,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    radius: 27,
                    child: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, '/productList');
                        },
                        icon: const Icon(Icons.arrow_forward)),
                  ),
                  const SizedBox(height: 8),
                  const Text('Lihat product lainnya'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProdukListDisplayWeb extends StatelessWidget {
  const ProdukListDisplayWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ProdukListContainer(productList[0]),
      ProdukListContainer(productList[1]),
      ProdukListContainer(productList[2]),
      Container(
        padding: const EdgeInsets.all(8),
        width: 200,
        height: 334,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              radius: 27,
              child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, '/productList');
                  },
                  icon: const Icon(Icons.arrow_forward)),
            ),
            const SizedBox(height: 8),
            const Text('Lihat product lainnya'),
          ],
        ),
      ),
    ]);
  }
}
