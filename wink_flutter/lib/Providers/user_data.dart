import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_data.g.dart';

@Riverpod(keepAlive: true)
Future<String?> currentUserData(Ref ref) async => 'dummy_user_data_uid';
