import 'package:activity_ring/activity_ring.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:spice_dating_app/models/user_model.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';
import '../widgets/base_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final List<User> users = User.users;
    const int selectedUser = 1;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: pagePaddingSize,
            left: pagePaddingSize,
            right: pagePaddingSize,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 40.0,
                    child: Image(
                      image: AssetImage(appLogo),
                      alignment: Alignment.center,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: pagePaddingSize),
                    child: Ring(
                      percent: 20,
                      color: RingColorScheme(
                          ringColor: const Color(appPrimaryColor),
                          backgroundColor: appLoadingBackgroundColor),
                      radius: 30,
                      width: 5,
                      child: const Center(child: Text('1/5')),
                    ),
                  )
                ],
              ),
              const SizedBox(height: maxSizedBox * 3),
              Text(
                'Question',
                style: Theme.of(context).textTheme.caption,
              ),
              const SizedBox(height: maxSizedBox),
              Text(
                'Which Of These Girls is Your Favourite?',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: maxSizedBox * 1.5),
              GridView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: MediaQuery.of(context).size.height * 0.225,
                ),
                itemBuilder: (_, index) {
                  User user = users[index];
                  return Container(
                    padding: const EdgeInsets.all(minPaddingSize),
                    decoration: BoxDecoration(
                      border: index == selectedUser
                          ? Border.all(
                              width: 2,
                              color: const Color(appPrimaryColor),
                            )
                          : null,
                    ),
                    child: SizedBox(
                      child: Image(
                        image: NetworkImage(user.photos.first),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: maxSizedBox * 1.5),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: pagePaddingSize / 2),
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      color: appLoadingBackgroundColor,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Icon(LineIcons.random),
                          const SizedBox(width: maxSizedBox),
                          Text(
                            'Shuffle',
                            style: Theme.of(context).textTheme.button,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: maxSizedBox * 2),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'Skip',
                            style: Theme.of(context).textTheme.button,
                          ),
                          const SizedBox(width: maxSizedBox),
                          const Icon(LineIcons.arrowRight),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BaseBottomBar(),
    );
  }
}
