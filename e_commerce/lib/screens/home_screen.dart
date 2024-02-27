import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/const_variable/colors.dart';
import 'package:e_commerce/const_variable/widget.dart';
import 'package:e_commerce/cubits/categories/category_cubit.dart';
import 'package:e_commerce/screens/category_screen.dart';
import 'package:e_commerce/screens/more_categories_screen.dart';
import 'package:e_commerce/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _sliderIndex = 0;
  final carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final searchController = TextEditingController();

    bool isDeviceRounded() {
      return deviceWidth > 400 ? true : false;
    }

    return Scaffold(
      backgroundColor: myBackground,
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // [search bar, favorite icon, notifications icon] //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Search Bar //
                SizedBox(
                  width: deviceWidth * 0.7,
                  child: TextFormField(
                    controller: searchController,
                    cursorColor: myBlue,
                    maxLines: 1,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          size: 30,
                          color: myBlue,
                        ),
                        hintText: "Search Product",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        hintStyle: TextStyle(color: myNeutralGray)),
                  ),
                ),
                // Favorite Icon //
                const Icon(
                  Icons.favorite_border_rounded,
                  color: myNeutralGray,
                  size: 30,
                ),
                // Notification Icon //
                const Icon(
                  Icons.notifications_none_outlined,
                  color: myNeutralGray,
                  size: 30,
                ),
              ],
            ),

            const SizedBox(
              height: 16,
            ),

            const Divider(
              height: 1,
              color: myNeutralGray,
            ),

            const SizedBox(
              height: 16,
            ),

            //  Data  //
            Expanded(
              child: ListView(
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  // Banners //
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 206,
                      enableInfiniteScroll: true,
                      onPageChanged: (index, reason) => setState(() {
                        _sliderIndex = index;
                      }),
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                      autoPlayCurve: Curves.ease,
                    ),
                    itemCount: 5,
                    carouselController: carouselController,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        height: 200,
                        width: deviceWidth,
                        child: Image.network(
                          "",
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return Shimmer.fromColors(
                                baseColor: myNeutralGray,
                                highlightColor: myNeutralLight,
                                child: Container(
                                  height: 200,
                                  color: myNeutralGray,
                                ));
                          },
                        ),
                      );
                    },
                  ),

                  // Dot indicator //
                  DotsIndicator(
                    dotsCount: 5,
                    onTap: (index) => setState(() {
                      _sliderIndex = index;
                      carouselController.jumpToPage(index);
                    }),
                    position: _sliderIndex,
                    decorator: DotsDecorator(
                      color: myNeutralGray,
                      activeColor: myBlue,
                      activeSize: const Size(25, 10),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  // Category     see more button //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Category',
                        style: TextStyle(
                          color: myNeutralDark,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => CategoryCubit(),
                                  child: const MoreCategoryScreen(),
                                ),
                              ));
                        },
                        child: const Text(
                          'More Category',
                          style: TextStyle(
                            color: myBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  //  Category items  //
                  Container(
                    height: 107,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: BlocBuilder<CategoryCubit, CategoryState>(
                      builder: (context, state) {
                        if (state is CategoryLoading) {
                          return const CircularProgressIndicator();
                        }
                        if (state is CategorySuccess) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.categoriesData.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return  CategoryScreen(index);
                                        },
                                      ));
                                    },
                                    child: MyCircularAvatar(
                                      image: state.categoriesData[index].image,
                                      name: state.categoriesData[index].name,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        if (state is CategoryNetworkFailed) {
                          return Shimmer.fromColors(
                              baseColor: myNeutralGray,
                              highlightColor: myNeutralLight,
                              child: Container(
                                height: 68,
                                width: 68,
                                //color: myNeutralGray,
                                decoration: BoxDecoration(
                                    color: myNeutralGray,
                                    borderRadius: BorderRadius.circular(40)),
                              )
                          );
                        }
                        if (state is CategoryFailed) {
                          return const Text("Category Failed Error");
                        }
                        return const Text("unExpected error");
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  // Flash Sale ....... See More button //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Flash Sale',
                        style: TextStyle(
                          color: myNeutralDark,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'See More',
                          style: TextStyle(
                            color: myBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  //Flash Sale Items //
                  SizedBox(
                    height: 240,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const ProductScreen();
                                    },
                                  ),
                                );
                              },
                              child: const MyItemCard(
                                image:
                                    "https://www.shutterstock.com/image-illustration/mens-fashion-shoes-black-classic-260nw-1080406805.jpg",
                                name: "Test Test Test Test Test Test",
                                discount: 10,
                                price: 20050,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  // Image Recommended Product //
                  GestureDetector(
                    onTap: () {},
                    child: Stack(children: [
                      Image.asset(
                        'assets/images/Recommended_Product.png',
                        height: 206,
                        width: deviceWidth,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        top: 48,
                        left: deviceWidth > 400 ? 55 : 24,
                        child: Text(
                          deviceWidth > 400
                              ? 'Recommended Product'
                              : 'Recommended\nProduct',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isDeviceRounded() ? 50 : 34,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 136,
                        left: isDeviceRounded() ? 55 : 24,
                        child: Text(
                          'We recommend the best for you',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isDeviceRounded() ? 25 : 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  // Display All Items //
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isDeviceRounded() ? 4 : 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 2 / 3,
                    ),
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ProductScreen();
                              },
                            ),
                          );
                        },
                        child: const MyItemCard(
                          image:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-Ib4SxJUZVvD7Wq5ISO6q5UOWiG_DGULl-Q&usqp=CAU",
                          name: "Test Test Test Test Test Test",
                          discount: 10,
                          price: 20050,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
