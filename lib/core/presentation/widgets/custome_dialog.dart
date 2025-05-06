import 'package:demo2/core/resources/palette.dart';
import 'package:demo2/core/resources/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog extends StatefulWidget {
  final String title;
  final String content;
  final VoidCallback onButtonLeft;
  final VoidCallback onButtonRight;
  final String textButtonLeft;
  final String textButtonRight;
  final bool isSingle;
  final bool isPositive;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onButtonLeft,
    required this.textButtonLeft,
    required this.onButtonRight,
    this.textButtonRight = '',
    this.isSingle = true,
    this.isPositive = true,
  });

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            Text(
              widget.content,
              style: TextStyle(fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: widget.onButtonLeft,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.isPositive ? Palette.white
                                                         : Palette.primary,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    child: Text(
                      widget.textButtonLeft,
                      style: widget.isPositive ? semiBold16.copyWith(color: Palette.gray500)
                                                : semiBold16.copyWith(color: Palette.white),
                    ),
                  ),
                ),
                const SizedBox(width: 5,),
                if ( !widget.isSingle)
                  Expanded(
                  child: ElevatedButton(
                    onPressed: widget.onButtonRight,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.isPositive ? Palette.primary
                                                          : Palette.confirmDangerous,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    child: Text(
                      widget.textButtonRight,
                      style: semiBold16.copyWith(color: Palette.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}