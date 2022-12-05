import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../models/user_model.dart';
import '../utils/constants.dart';
import '../widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
    required this.scrollController,
    required this.user,
  }) : super(key: key);

  static const String routeName = '/profile';

  final User user;
  final ScrollController scrollController;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late PaletteColor paletteColor;

  @override
  void initState() {
    super.initState();
    paletteColor = PaletteColor(Colors.transparent, 20);
  }

  Future<void> _getPaletteColors(String imagePath) async {
    final PaletteColor palette = await generatePalette(imagePath);

    setState(() {
      paletteColor = palette;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double headHeight = MediaQuery.of(context).size.height * 0.7;
    User currentUser = widget.user;

    _getPaletteColors(currentUser.photos.first);

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        controller: widget.scrollController,
        children: [
          ProfileHeadPhotos(
            height: headHeight,
            user: currentUser,
            paletteColor: paletteColor.color,
          ),
          const ProfileMainActions(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: minPaddingSize * 2),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${currentUser.name}, ${currentUser.age}',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(width: minSizedBox),
                          const Image(
                            height: maxSizedBox,
                            image: AssetImage(
                              'assets/icons/verified-badge.png',
                            ),
                          ),
                        ],
                      ),
                      Text(currentUser.city),
                    ],
                  ),
                ),
                const SizedBox(height: maxSizedBox * 3),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bio',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      const SizedBox(height: maxSizedBox),
                      Text(
                        currentUser.bio * 10,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
