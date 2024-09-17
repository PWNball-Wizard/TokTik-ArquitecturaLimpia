import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik/config/app_theme.dart';
import 'package:tok_tik/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tok_tik/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:tok_tik/presentation/providers/discover_provider.dart';
import 'package:tok_tik/presentation/screens/discover/discover_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostRepositoryImpl(
      videoPostDataSource: LocalVideoDatasourceImpl(),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return DiscoverProvider(videoPostRepository: videoPostRepository)
              ..loadNextPage();
          },
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme().theme,
        debugShowCheckedModeBanner: false,
        home: const DiscoverScreen(),
      ),
    );
  }
}
