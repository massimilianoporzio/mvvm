part of 'onboarding_bloc.dart';

class OnBoardingState extends Equatable {
  final SliderObject sliderObject;
  final String message;
  final RequestState state;
  final int currentIndex;
  final int numSlides;

  const OnBoardingState({
    this.sliderObject = const SliderObject(), //*vuoto
    this.message = '',
    this.state = RequestState.loading,
    this.currentIndex = 0,
    this.numSlides = 0,
  });

  OnBoardingState copyWith({
    SliderObject? sliderObject,
    String? message,
    RequestState? state,
    int? currentIndex,
    int? numSlides,
  }) {
    return OnBoardingState(
        sliderObject: sliderObject ?? this.sliderObject,
        message: message ?? this.message,
        state: state ?? this.state,
        currentIndex: currentIndex ?? this.currentIndex,
        numSlides: numSlides ?? this.numSlides);
  }

  @override
  List<Object> get props => [
        sliderObject,
        message,
        state,
        currentIndex,
        numSlides,
      ];
}
