import 'package:flutter/material.dart';
import 'package:supermedia/layers/presentation/setting/widgets/group_menu.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Settings',
        showBackButton: false,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 30, 24, 111),
          child: Column(children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/icons/profile_icon.png',
                  width: 56,
                  height: 56,
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  children: [
                    Text(
                      'Andy Lexsian',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text('@Andy1999',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: const Color(0xff66707A))),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              // height: MediaQuery.of(context).size.height,
              height: 1000,
              child: Column(
                children: <Widget>[
                  GroupMenu(
                    title: 'Personal Info',
                    fields: [
                      Pair(
                          title: 'Profile',
                          icon: Icons.person,
                          showChevronRight: true,
                          showToggleButton: false),
                      Pair(
                          title: 'Wishlist',
                          icon: Icons.bookmark,
                          showChevronRight: true,
                          showToggleButton: false)
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GroupMenu(
                    title: 'Theme Mode',
                    fields: [
                      Pair(
                          title: 'Dark Mode',
                          icon: Icons.dark_mode,
                          showChevronRight: false,
                          showToggleButton: true),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GroupMenu(
                    title: 'Security',
                    fields: [
                      Pair(
                          title: 'Change Password',
                          icon: Icons.password,
                          showChevronRight: true,
                          showToggleButton: false),
                      Pair(
                          title: 'Forgot Password',
                          icon: Icons.password,
                          showChevronRight: true,
                          showToggleButton: false)
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GroupMenu(
                    title: 'General',
                    fields: [
                      Pair(
                          title: 'Language',
                          icon: Icons.language,
                          showChevronRight: true,
                          showToggleButton: false),
                      Pair(
                          title: 'Clear Cache',
                          icon: Icons.cases,
                          showChevronRight: true,
                          showToggleButton: false)
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GroupMenu(
                    title: 'About',
                    fields: [
                      Pair(
                          title: 'Legal and Policies',
                          icon: Icons.language,
                          showChevronRight: true,
                          showToggleButton: false),
                      Pair(
                          title: 'Tell us',
                          icon: Icons.cases,
                          showChevronRight: true,
                          showToggleButton: false)
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
