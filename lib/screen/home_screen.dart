import 'dart:developer';
import 'dart:io';

import 'package:fast8_technical_test/controller/home_controller.dart';
import 'package:fast8_technical_test/controller/produk_controller.dart';
import 'package:fast8_technical_test/controller/profile_controller.dart';
import 'package:fast8_technical_test/screen/profile_screen.dart';
import 'package:fast8_technical_test/utils/color_app.dart';
import 'package:fast8_technical_test/widget/item_produk_widget.dart';
import 'package:fast8_technical_test/widget/segemted_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../controller/image_picker_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.primary,
      body: Stack(
        children: [
          Consumer<HomeController>(builder:
              (BuildContext context, HomeController homeController, _) {
            if (homeController.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (homeController.error.isNotEmpty) {
              return Center(child: Text('Error: ${homeController.error}'));
            } else {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: ColorApp.primary,
                    toolbarHeight: 80,
                    floating: false,
                    pinned: true,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Fast8 Technical Test",
                          style: TextStyle(
                            color: ColorApp.white,
                            fontSize: 13,
                          ),
                        ),
                        Consumer<ProfileController>(
                          builder: (BuildContext context,
                              ProfileController homeController, _) {
                            if (homeController.profile.nama == null ||
                                homeController.profile.nama!.isEmpty) {
                              return const Text(
                                "Edit in Profile",
                                style: TextStyle(
                                  color: ColorApp.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            } else {
                              return Text(
                                homeController.profile.nama.toString(),
                                style: const TextStyle(
                                  color: ColorApp.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Badge(
                          label: Text("0"),
                          child: Icon(FeatherIcons.bell, color: ColorApp.white),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileScreen(),
                            ),
                          );
                        },
                        child: Consumer<ImagePickerController>(
                          builder: (BuildContext context,
                              ImagePickerController imagePickerController, _) {
                            if (imagePickerController.imagePath == null ||
                                imagePickerController.imagePath!.isEmpty) {
                              return const CircleAvatar(
                                child: Icon(Icons.person),
                              );
                            } else {
                              return CircleAvatar(
                                backgroundImage: FileImage(File(
                                    imagePickerController.imagePath
                                        .toString())),
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: ColorApp.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: ListView(
                        padding: const EdgeInsets.all(20),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          SegmentedButtonSlide(
                            padding: const EdgeInsets.all(3),
                            height: 40,
                            entries: const [
                              SegmentedButtonSlideEntry(
                                label: "Payuung Pribadi",
                              ),
                              SegmentedButtonSlideEntry(
                                label: "Payuung Karyawan",
                              ),
                            ],
                            selectedEntry: 0,
                            onChange: (selected) => setState(() {
                              log(selected.toString());
                            }),
                            colors: const SegmentedButtonSlideColors(
                              barColor: ColorApp.whiteSplash,
                              backgroundSelectedColor: ColorApp.primary,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Produk Keuangan",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1 / 1.2,
                            ),
                            itemCount: homeController.menuKeuangan.length,
                            itemBuilder: (context, index) => SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    homeController.menuKeuangan[index]['icon'],
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    homeController.menuKeuangan[index]['title'],
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Kategori Pilihan",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: ColorApp.whiteSplash,
                                ),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Wishlist",
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                          color: ColorApp.primary,
                                          shape: BoxShape.circle),
                                      child: const Text(
                                        "0",
                                        style: TextStyle(
                                          color: ColorApp.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1 / 1.2,
                            ),
                            itemCount: homeController.menuKategori.length + 1,
                            itemBuilder: (context, index) {
                              if (index < homeController.menuKategori.length) {
                                return SizedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        homeController.menuKategori[index]
                                            ['icon'],
                                        height: 30,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        homeController.menuKategori[index]
                                            ['title'],
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return const SizedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FeatherIcons.grid,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'More',
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Explore Willness",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: ColorApp.whiteSplash,
                                ),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Wishlist",
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                          color: ColorApp.primary,
                                          shape: BoxShape.circle),
                                      child: const Text("0"),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Consumer<ProductController>(
                            builder: (BuildContext context,
                                ProductController produkController, child) {
                              return GridView.builder(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 0, 200),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 1 / 1.3,
                                ),
                                itemCount: produkController.listProduk.length,
                                itemBuilder: (context, index) {
                                  return ItemProdukWidget(
                                    img: produkController.listProduk[index]
                                        ['img'],
                                    price: produkController.listProduk[index]
                                        ['harga'],
                                    title: produkController.listProduk[index]
                                        ['title'],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
          Consumer<HomeController>(
            builder: (BuildContext context, HomeController homeController, _) {
              if (homeController.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (homeController.error.isNotEmpty) {
                return Center(child: Text('Error: ${homeController.error}'));
              } else {
                return DraggableScrollableSheet(
                  minChildSize: 0.12,
                  maxChildSize: 0.5,
                  initialChildSize: 0.12,
                  builder: (BuildContext context, scrollController) {
                    return Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          color: ColorApp.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: ColorApp.text.withOpacity(0.2),
                              blurRadius: 10,
                            ),
                          ]),
                      child: CustomScrollView(
                        controller: scrollController,
                        slivers: [
                          SliverToBoxAdapter(
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).hintColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                height: 4,
                                width: 40,
                                margin: const EdgeInsets.only(top: 10),
                              ),
                            ),
                          ),
                          const SliverToBoxAdapter(
                            child: SizedBox(
                              height: 10,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: GridView.builder(
                              padding: const EdgeInsets.all(10),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1.1,
                              ),
                              itemCount: homeController.listNavBar.length,
                              itemBuilder: (context, index) => SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      homeController.listNavBar[index]['icon'],
                                      color: homeController.listNavBar[index] ==
                                              homeController.listNavBar.first
                                          ? ColorApp.primary
                                          : ColorApp.text,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      homeController.listNavBar[index]['label'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: homeController
                                                    .listNavBar[index] ==
                                                homeController.listNavBar.first
                                            ? ColorApp.primary
                                            : ColorApp.text,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
