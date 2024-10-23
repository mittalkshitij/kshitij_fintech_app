import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kshitij_fintech_app/providers/go_router_provider.dart';
import 'package:kshitij_fintech_app/providers/theme_provider.dart';
import 'package:kshitij_fintech_app/repo/hive_repo.dart';
import 'package:kshitij_fintech_app/theme/styles.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  HiveRepo().registerAdapter();
  runApp(const ProviderScope(child: FintechApp()));
}

class FintechApp extends ConsumerWidget {
  const FintechApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(themeProvider);
    final goRouterConfig = ref.watch(goRouterProvider);
    return MaterialApp.router(
      theme: Styles.themeData(isDarkTheme: isDarkTheme),
      routerConfig: goRouterConfig,
    );
  }
}
