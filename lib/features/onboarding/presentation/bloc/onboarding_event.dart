part of 'onboarding_bloc.dart';

abstract class OnBoardingEvent extends Equatable {
  final int currentIndex;
  const OnBoardingEvent({required this.currentIndex});

  @override
  List<Object> get props => [];
}

class OnBoardingInitial extends OnBoardingEvent {
  const OnBoardingInitial() : super(currentIndex: 0);
}

class OnBoardingGoNext extends OnBoardingEvent {
  const OnBoardingGoNext({required super.currentIndex});
}

class OnBoardingGoPrevious extends OnBoardingEvent {
  const OnBoardingGoPrevious({required super.currentIndex});
}

class OnBoardingPageChanged extends OnBoardingEvent {
  const OnBoardingPageChanged({required super.currentIndex});
}
