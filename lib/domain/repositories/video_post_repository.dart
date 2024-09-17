import 'package:tok_tik/domain/entities/video_post.dart';

abstract class VideoPostRepository {
  Future<List<VideoPost>> getVideoPosts(int page);

  Future<List<VideoPost>> getFavoriteVideosByUser(String userId);
}