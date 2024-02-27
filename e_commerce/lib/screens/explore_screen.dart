import 'package:e_commerce/const_variable/colors.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final searchController = TextEditingController();
    return Scaffold(
      backgroundColor: myBackground,
      body: Column(
        children: [
          const SizedBox(height: 24,),
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

          Expanded(

            child: ListView(
              children: [
                Image.asset("assets/images/explore.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
