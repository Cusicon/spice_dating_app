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

    Color _color = paletteColor.color;

    _getPaletteColors(widget.user.photos.first);

    return Scaffold(
      body: ListView(
        controller: widget.scrollController,
        children: [
          ProfileHeadPhotos(
            height: headHeight,
            user: widget.user,
            paletteColor: _color,
          ),
          const ProfileMainActions(),
        ],
      ),
    );
  }
}
