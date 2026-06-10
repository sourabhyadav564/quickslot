import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../core/constants.dart';
import '../providers/auth_provider.dart';

class UserSelectScreen extends ConsumerWidget {
  const UserSelectScreen({super.key});

  static const _users = [
    {'id': 'user_1', 'name': 'Arjun Mehta', 'avatar': 'AM'},
    {'id': 'user_2', 'name': 'Priya Sharma', 'avatar': 'PS'},
    {'id': 'user_3', 'name': 'Rohan Das', 'avatar': 'RD'},
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Logo / brand
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.secondary],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.sports_tennis, color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    AppStrings.appName,
                    style: TextStyle(
                      color: AppColors.onBackground,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Book sports slots instantly.\nNo waiting, no double-booking.',
                style: TextStyle(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 56),
              const Text(
                'Select your profile',
                style: TextStyle(
                  color: AppColors.onBackground,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              ..._users.map((user) => _UserTile(
                    userId: user['id']!,
                    name: user['name']!,
                    avatar: user['avatar']!,
                    onTap: () {
                      final client = ref.read(apiClientProvider);
                      client.setUser(user['id']!);
                      ref.read(authProvider.notifier).state = user['id'];
                      context.go('/venues');
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserTile extends StatelessWidget {
  final String userId;
  final String name;
  final String avatar;
  final VoidCallback onTap;

  const _UserTile({
    required this.userId,
    required this.name,
    required this.avatar,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primary.withOpacity(0.2),
              radius: 24,
              child: Text(
                avatar,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  color: AppColors.onBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: AppColors.onSurfaceVariant, size: 16),
          ],
        ),
      ),
    );
  }
}
