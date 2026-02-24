import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

@Riverpod(keepAlive: true)
bool onboarded(Ref ref) => true;

@Riverpod(keepAlive: true)
Future<String?> currentUser(Ref ref) async => 'dummy_uid';
