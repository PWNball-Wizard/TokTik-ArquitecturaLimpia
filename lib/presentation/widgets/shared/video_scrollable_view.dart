import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/presentation/widgets/shared/video_buttons.dart';
import 'package:tok_tik/presentation/widgets/video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost video = videos[index];
        return Stack(
          children: [
            SizedBox.expand(
                child: FullScreenPlayer(
              caption: video.caption,
              videoUrl: video.videoURL,
            )
                /* Container(
                color: Colors.red,
              ), */
                ),
            Positioned(
                bottom: 120,
                right: 10,
                child: VideoButtons(
                    value: video.likes,
                    color: Colors.red,
                    iconData: Icons.favorite)),
            Positioned(
                bottom: 200,
                right: 10,
                child: VideoButtons(
                    value: video.views,
                    color: Colors.white,
                    iconData: Icons.remove_red_eye_outlined)),
            Positioned(
                bottom: 40,
                right: 10,
                child: SpinPerfect(
                  infinite: true,
                  duration: const Duration(seconds: 5),
                  child: const VideoButtons(
                      color: Colors.white, iconData: Icons.play_circle_outline),
                )),
          ],
        );
        /* Container(
          color: Colors.red,
          child: Center(
            child: Text(video.caption),
          ),
        ); */
      },
      //! PageView sin usar el builder para cargar los widgets
      /* children: [
        Container(
          color: Colors.red,
          child: Center(
            child: Text(videos[0].caption),
          ),
        ),
        Container(
          color: Colors.blue,
          child: Center(
            child: Text(videos[0].caption),
          ),
        ),
        Container(
          color: Colors.green,
          child: Center(
            child: Text(videos[0].caption),
          ),
        ),
        Container(
          color: Colors.deepPurple,
          child: Center(
            child: Text(videos[0].caption),
          ),
        ),
      ], */
    );
  }
}
