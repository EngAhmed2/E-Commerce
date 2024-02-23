
import 'package:e_commerce/const_variable/colors.dart';
import 'package:e_commerce/const_variable/text_direction.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyCircularAvatar extends StatelessWidget {
  final String image;
  final String name;
  const MyCircularAvatar({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: myNeutralLight,
          child: CircleAvatar(
            radius: 33,
            backgroundColor: myBackground,
            child: Image.network(
                image,
                height: 35,
                fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
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
              },
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: 65,
          child: Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: myNeutralGray,
              fontSize: 10,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}

class MyItemCard extends StatelessWidget {

  final String image;
  final String name;
  final double price;
  final int discount;

  const MyItemCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:Border.all(color: myNeutralLight),
          borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        textDirection: arabic,
        children: [
          Image.network(
            image,
            height: 109,
            width: 109,
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) {
              return Shimmer.fromColors(
                  baseColor: myNeutralGray,
                  highlightColor: myNeutralLight,
                  child: Container(
                    height: 109,
                    width: 109,
                    decoration: BoxDecoration(
                        color: myNeutralGray,
                        borderRadius: BorderRadius.circular(14)),

                  )
              );
            },
          ),
          const SizedBox(
            height: 8,
          ),
          //name//
          SizedBox(
            width: 85,
            child: Text(
              name,
              style: const TextStyle(
                  color: myNeutralDark,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textDirection: arabic,
            ),
          ),
          const SizedBox(height: 8),
          //new Price//
          Text(
            "\$${(price - (price * discount / 100)).toInt()}",
            style: const TextStyle(
                color: myBlue,
                fontSize: 12,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          // price .... discount % off//
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                discount > 0 ? '\$$price' : '',
                style: const TextStyle(
                  color: myNeutralGray,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.lineThrough,
                  decorationThickness: 4,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                discount > 0
                    ? '$discount% Off'
                    : '',
                style: const TextStyle(
                  color: myRed,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

