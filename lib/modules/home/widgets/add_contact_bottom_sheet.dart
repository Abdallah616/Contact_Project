import 'package:contact/core/constants/app_strings.dart';
import 'package:contact/core/theme/app_colors.dart';
import 'package:contact/core/theme/app_theme_manager.dart';
import 'package:contact/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

class AddContactBottomSheet extends StatefulWidget {
  const AddContactBottomSheet({super.key});

  @override
  State<AddContactBottomSheet> createState() => _AddContactBottomSheetState();
}

class _AddContactBottomSheetState extends State<AddContactBottomSheet> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  File? selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.gold, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: selectedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(selectedImage!, fit: BoxFit.cover),
                        )
                      : const Center(
                          child: Icon(
                            Icons.image,
                            size: 50,
                            color: AppColors.gold,
                          ),
                        ),
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      nameController.text.isEmpty
                          ? AppStrings.defaultUserName
                          : nameController.text,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Divider(
                      color: AppColors.gold,
                      thickness: 1,
                      height: 20,
                    ),

                    Text(
                      emailController.text.isEmpty
                          ? AppStrings.defaultEmail
                          : emailController.text,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Divider(
                      color: AppColors.gold,
                      thickness: 1,
                      height: 20,
                    ),

                    Text(
                      phoneController.text.isEmpty
                          ? AppStrings.defaultPhone
                          : phoneController.text,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          TextField(
            controller: nameController,
            onChanged: (value) => setState(() {}),
            style: Theme.of(context).textTheme.bodySmall
                ?.copyWith(color: AppColors.white),
            decoration: const InputDecoration(
              hintText: AppStrings.enterUserNameHint,
            ),
          ),
          const SizedBox(height: 12),

          TextField(
            controller: emailController,
            onChanged: (value) => setState(() {}),
            style: Theme.of(context).textTheme.bodySmall
                ?.copyWith(color: AppColors.white),
            decoration: const InputDecoration(
              hintText: AppStrings.enterUserEmailHint,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 12),

          TextField(
            controller: phoneController,
            onChanged: (value) => setState(() {}),
            style: Theme.of(context).textTheme.bodySmall
                ?.copyWith(color: AppColors.white),
            decoration: const InputDecoration(
              hintText: AppStrings.enterUserPhoneHint,
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              if (selectedImage != null &&
                  nameController.text.isNotEmpty &&
                  emailController.text.isNotEmpty &&
                  phoneController.text.isNotEmpty) {
                final newContact = ContactModel(
                  name: nameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                  image: selectedImage!,
                );
                Navigator.pop(context, newContact);
              }
            },
            child: const Text(AppStrings.enterUserButton),
          ),
        ],
      ),
    );
  }
}
