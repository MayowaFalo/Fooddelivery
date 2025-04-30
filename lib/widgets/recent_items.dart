import 'package:flutter/material.dart';
import 'package:foodapp/widgets/color_extension.dart';

class RecentItems extends StatelessWidget {
  const RecentItems({super.key, this.onTap, this.rObj});

  final Map? rObj;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: InkWell(
        onTap: onTap!,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                rObj!["image"].toString(),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12), // Space between image and text
            // Text Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rObj!["name"],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Tcolor.primaryText,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        rObj!["type"],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Tcolor.secondaryText,
                        ),
                      ),
                      Text(
                        " · ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Tcolor.secondaryText,
                        ),
                      ),
                      Text(
                        rObj!["food_type"],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Tcolor.secondaryText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.star, size: 14, color: Tcolor.primary),
                      SizedBox(width: 4),
                      Text(
                        rObj!["rate"],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Tcolor.primary,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        "(${rObj!["rating"]} Ratings)",
                        style: TextStyle(
                          fontSize: 12,
                          color: Tcolor.secondaryText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
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
