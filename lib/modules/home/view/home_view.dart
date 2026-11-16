import 'package:contact/core/constants/app_strings.dart';
import 'package:contact/core/gen/assets.gen.dart';
import 'package:contact/core/theme/app_colors.dart';
import 'package:contact/models/contact_model.dart';
import 'package:contact/modules/home/widgets/add_contact_bottom_sheet.dart';
import 'package:contact/modules/home/widgets/contact_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/home_view';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<ContactModel> contacts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Assets.images.splashImg.image(),
        ),
        leadingWidth: 133,
      ),
      body: contacts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    Assets.animations.listAnimation,
                    width: 250,
                    height: 250,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppStrings.noContactsMessage,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.6,
              ),
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ContactCard(
                  name: contact.name,
                  email: contact.email,
                  number: contact.phone,
                  image: contact.image,
                  onDelete: () {
                    setState(() {
                      contacts.removeAt(index);
                    });
                  },
                );
              },
            ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (contacts.isNotEmpty)
            FloatingActionButton(
              heroTag: 'delete_fab',
              backgroundColor: AppColors.red,
              onPressed: () {
                setState(() {
                  contacts.removeLast();
                });
              },
              child: Assets.icons.deleteIcon.svg(color: AppColors.white),
            ),
          if (contacts.isNotEmpty && contacts.length < 6)
            const SizedBox(height: 10),

          if (contacts.length < 6)
            FloatingActionButton(
              heroTag: 'add_fab',
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.darkBlue,
              onPressed: () async {
                final ContactModel? newContact =
                    await showModalBottomSheet<ContactModel>(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsetsGeometry.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: AddContactBottomSheet(),
                        );
                      },
                    );
                if (newContact != null) {
                  setState(() {
                    contacts.add(newContact);
                  });
                }
              },
              child: Assets.icons.addIcon.svg(width: 30),
            ),
        ],
      ),
    );
  }
}
