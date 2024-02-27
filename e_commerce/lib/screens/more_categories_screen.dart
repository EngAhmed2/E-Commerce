import 'package:e_commerce/const_variable/colors.dart';
import 'package:e_commerce/const_variable/text_direction.dart';
import 'package:e_commerce/cubits/categories/category_cubit.dart';
import 'package:e_commerce/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class MoreCategoryScreen extends StatefulWidget {
  const MoreCategoryScreen({super.key});

  @override
  State<MoreCategoryScreen> createState() => _MoreCategoryScreenState();
}

class _MoreCategoryScreenState extends State<MoreCategoryScreen> {
  @override
  void initState() {
    context.read<CategoryCubit>().getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: myBackground,
      appBar: AppBar(
        title: const Text(
          "More Categories",
          style: TextStyle(
              color: myNeutralDark, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        backgroundColor: myBackground,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: myNeutralDark,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is CategorySuccess) {
                  return Container(
                    margin: const EdgeInsets.all(16),
                    height: 700,
                    child: ListView.builder(
                      itemExtent: 80,
                      scrollDirection: Axis.vertical,
                      itemCount: state.categoriesData.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryScreen(index),
                            ),
                          ),
                          title: Text(
                            state.categoriesData[index].name,
                            textAlign: TextAlign.start,
                            textDirection: arabic,
                            style: const TextStyle(
                              color: myNeutralDark,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          leading: Image.network(
                            state.categoriesData[index].image,
                            errorBuilder: (context, error, stackTrace) =>  Shimmer.fromColors(
                              baseColor: myNeutralGray,
                              highlightColor: myNeutralLight,
                              child: Container(
                                height: 109,
                                width: 109,
                                decoration: BoxDecoration(
                                    color: myNeutralGray,
                                    borderRadius: BorderRadius.circular(14)),

                              )
                          ),
                          ),
                        );
                      },
                    ),
                  );
                }
                if (state is CategoryNetworkFailed) {
                  return Container(
                    height: deviceHeight*0.90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/network_error.png"),
                        const Text(
                          "تحقق من الاتصال بالشبكة",
                          style: TextStyle(
                            color: myNeutralDark,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (state is CategoryFailed) {
                  return Container(
                    height: deviceHeight*0.90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/failed.png"),
                        const Text(
                          "حدث خطأ ما يرجى المحاولة لاحقا",
                          style: TextStyle(
                            color: myNeutralDark,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const Text(
                  "نعمل علي حل المشكلة \n حاول مرة اخرى لاحقا...",
                  style: TextStyle(color: myNeutralDark,fontSize: 18),
                  textDirection: arabic,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
