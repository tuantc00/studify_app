import 'package:demo2/core/resources/palette.dart';
import 'package:flutter/material.dart';

class StyleToastCard extends StatelessWidget {
  final String? textTile;
  final bool status;

  const StyleToastCard({required this.textTile, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: status ? Palette.bgActive : Palette.bgPointContainerRed,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    status
                        ? Icon(
                          Icons.check_circle_outline,
                          color: Palette.green500,
                        )
                        : Icon(
                          Icons.error_outline_outlined,
                          color: Palette.errorText,
                        ),
                    const SizedBox(width: 5),
                    Text(
                      '$textTile',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: status ? Palette.green500 : Palette.errorText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
