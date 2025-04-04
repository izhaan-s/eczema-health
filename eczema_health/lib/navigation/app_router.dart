import 'package:flutter/material.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/signup_screen.dart';
import '../features/auth/screens/verification_screen.dart';
import '../features/dashboard/screens/dashboard_screen.dart';
import '../features/profile/screens/profile_screen.dart';
import '../features/reminders/screens/reminders_screen.dart';
import '../features/reminders/screens/add_reminder_screen.dart';
import '../features/photo_tracking/screens/photo_upload_screen.dart';

// Class for passing email to verification screen
class VerificationScreenArguments {
  final String email;
  
  VerificationScreenArguments(this.email);
}

class AppRouter {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String verification = '/verification';
  static const String dashboard = '/dashboard';
  static const String profile = '/profile';
  static const String reminder = '/reminder';
  static const String addReminder = '/addReminder';
  static const String photoUpload = '/photoUpload';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          maintainState: false,
        );
      case signup:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case verification:
        final args = settings.arguments as VerificationScreenArguments;
        return MaterialPageRoute(
          builder: (_) => VerificationScreen(email: args.email),
          maintainState: false,
        );
      case profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case dashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );
      case reminder:
        return MaterialPageRoute(
          builder: (_) => const RemindersScreen(),
        );
      case addReminder:
        return MaterialPageRoute(
          builder: (_) => const AddReminderScreen(),
        );
      case photoUpload:
        return MaterialPageRoute(
          builder: (_) => const PhotoUploadScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
    }
  }

  // Navigation methods that prevent going back
  static void navigateToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, login);
  }

  // Allow back navigation only for signup (from login)
  static void navigateToSignup(BuildContext context) {
    Navigator.pushNamed(context, signup);
  }

  static void navigateToVerification(BuildContext context, String email) {
    Navigator.pushReplacementNamed(
      context, 
      verification,
      arguments: VerificationScreenArguments(email),
    );
  }

  // Use this for logout or session expiration
  static void resetToLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context, 
      login,
      (route) => false, // Remove all previous routes
    );
  }
}