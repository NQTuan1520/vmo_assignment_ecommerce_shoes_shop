import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const PageWidget({super.key, required this.imageUrl, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            height: 400.h,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 42.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Text(
            description,
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.grey,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
