import 'package:activity_ring/activity_ring.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../widgets/widgets.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<User> users = User.users;
  late int selectedUser;
  late int chosenUser;
  late AnimationController chosenController;

  @override
  void initState() {
    selectedUser = users.length;
    chosenUser = users.length;
    chosenController = AnimationController(vsync: this);
    chosenController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        _showModal();
        chosenController.reset();
      }
    });
    super.initState();
  }

  void _showModal() {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.95,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: const ProfilePage(),
          ),
        );
        // return const ProfilePage();
      },
    );
  }

  void _shuffleUsers() {
    setState(() {
      users.shuffle();
      selectedUser = users.length;
      chosenUser = users.length;
    });
  }

  void _selectUser(index) {
    setState(() {
      selectedUser = index;
      if (chosenUser != index) {
        chosenUser = users.length;
      }
    });
  }

  void _chooseUser(context, index) async {
    setState(() {
      selectedUser = index;
      chosenUser = index;
    });
  }

  @override
  void dispose() {
    chosenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: pagePaddingSize,
            left: pagePaddingSize,
            right: pagePaddingSize,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HomeAppBar(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    QuestionWidget(users: users),
                    GalleryWidget(
                      users: users,
                      selectedUser: selectedUser,
                      selectUser: _selectUser,
                      chosenUser: chosenUser,
                      chooseUser: _chooseUser,
                      chosenController: chosenController,
                    ),
                    GalleryControls(shuffleUsers: _shuffleUsers),
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

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
          padding: const EdgeInsets.only(right: pagePaddingSize / 2),
          child: Ring(
            percent: 20.0,
            color: RingColorScheme(
                ringColor: const Color(appPrimaryColor),
                backgroundColor: appLoadingBackgroundColor),
            radius: 25.0,
            width: borderWidth,
            child: const Center(
              child: Text('1/5'),
            ),
          ),
        )
      ],
    );
  }
}
