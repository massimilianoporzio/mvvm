import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm/core/utils/enums/request_state.dart';
import 'package:mvvm/features/onboarding/domain/entities/slider_object.dart';

import '../../../../core/presentation/resources/aseets_manager.dart';
import '../../../../core/presentation/resources/strings_manager.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  //*hard-coded ma potrei chiedere al caso d'uso ogni volta che ricevo un evento
  static const List<SliderObject> _list = [
    SliderObject(
      title: AppStrings.onboardingTitle1,
      subTitle: AppStrings.onboardingSubTitle1,
      image: ImageAssets.onboarding1,
    ),
    SliderObject(
      title: AppStrings.onboardingTitle1,
      subTitle: AppStrings.onboardingSubTitle2,
      image: ImageAssets.onboarding2,
    ),
    SliderObject(
      title: AppStrings.onboardingTitle3,
      subTitle: AppStrings.onboardingSubTitle3,
      image: ImageAssets.onboarding3,
    ),
    SliderObject(
      title: AppStrings.onboardingTitle4,
      subTitle: AppStrings.onboardingSubTitle4,
      image: ImageAssets.onboarding4,
    )
  ];

  OnBoardingBloc() : super(const OnBoardingState()) {
    on<OnBoardingEvent>((event, emit) {
      if (event is OnBoardingInitial) {
        // emit(const OnBoardingState());
        //*recupero i dati e restituisco la pagina iniziale
        const listOfPages = _list;
        final SliderObject sliderObject = listOfPages[0];
        emit(OnBoardingState(
            sliderObject: sliderObject,
            state: RequestState.loaded,
            currentIndex: 0,
            numSlides: _list.length));
      } else if (event is OnBoardingPageChanged) {
        //*cambiato pagina
        //*recupero le pagine
        const listOfPages = _list;
        //*emetto stato con lo slider object corrisp
        emit(
          OnBoardingState(
              sliderObject: listOfPages[event.currentIndex],
              state: RequestState.loaded,
              currentIndex: event.currentIndex,
              numSlides: listOfPages.length),
        );
      } else if (event is OnBoardingGoNext) {
        //*va a pagina succesiva
        int currentIndex = event.currentIndex;
        int nextIndex = currentIndex + 1;
        //*leggo le pagine
        const listOfPages = _list;
        if (nextIndex >= listOfPages.length) {
          nextIndex = 0;
        }
        emit(OnBoardingState(
            sliderObject: listOfPages[nextIndex],
            state: RequestState.loaded,
            currentIndex: nextIndex,
            numSlides: listOfPages.length));
      } else if (event is OnBoardingGoPrevious) {
        //*va a pagina succesiva
        int currentIndex = event.currentIndex;
        int previousIndex = currentIndex - 1;
        //*leggo le pagine
        const listOfPages = _list;
        if (previousIndex == -1) {
          previousIndex = listOfPages.length - 1;
        }
        emit(OnBoardingState(
            sliderObject: listOfPages[previousIndex],
            state: RequestState.loaded,
            currentIndex: previousIndex,
            numSlides: listOfPages.length));
      }
    });
  }
}
