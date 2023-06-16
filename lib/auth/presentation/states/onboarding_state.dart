import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingProvider = StateNotifierProvider<OnboardingNotifier, int>((ref) => OnboardingNotifier());

class OnboardingNotifier extends StateNotifier<int> {
  OnboardingNotifier() : super(0);

  void changeIndex(int index) => state = index;
}