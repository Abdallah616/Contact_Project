import 'dart:io';

import 'package:contact/core/constants/app_strings.dart';
import 'package:contact/core/gen/assets.gen.dart';
import 'package:contact/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String email;
  final String number;
  final File image;
  final VoidCallback onDelete;

  const ContactCard({
    super.key,
    required this.name,
    required this.email,
    required this.number,
    required this.image,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: AppColors.gold,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                alignment: AlignmentGeometry.bottomLeft,
                children: [
                  Image.file(
                    image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.gold,
                    ),
                    child: Text(
                      name,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Assets.icons.emailIcon.svg(width: 18, height: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            email,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: AppColors.darkBlue,
                                  fontSize: 11,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Assets.icons.phoneIcon.svg(width: 18, height: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            number,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: AppColors.darkBlue,
                                  fontSize: 11,
                                ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: onDelete,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.red,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.icons.deleteIcon.svg(width: 16, height: 16),
                            const SizedBox(width: 6),
                            Text(
                              AppStrings.deleteButton,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
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
