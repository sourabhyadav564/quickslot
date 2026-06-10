import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/api_client.dart';

// Singleton API client
final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());

// Currently logged-in user
final authProvider = StateProvider<String?>((ref) => null);
