import 'package:flutter/material.dart';
import 'package:tok_tik/config/helpers/human_formats.dart';
//import 'package:tok_tik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  /* final VideoPost video; */
  final int value;
  final IconData iconData;
  final Color color;

  const VideoButtons(
      {super.key,
      //required this.video,
      required this.iconData,
      required this.color,
      this.value = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          value: value,
          iconData: iconData,
          color: color,
        )
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color color;

  const _CustomIconButton(
      {super.key,
      required this.value,
      required this.iconData,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconData,
              color: color,
            )),
        value > 0
            ? Text(HumanFormats.humanReadableNumber(value.toDouble()))
            : const Text(''),
      ],
    );
  }
}
