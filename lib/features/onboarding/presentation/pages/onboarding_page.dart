import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm/core/utils/enums/request_state.dart';
import 'package:mvvm/features/onboarding/presentation/bloc/onboarding_bloc.dart';

import '../../../../core/presentation/resources/aseets_manager.dart';
import '../../../../core/presentation/resources/color_manager.dart';
import '../../../../core/presentation/resources/strings_manager.dart';
import '../../../../core/presentation/resources/values_manager.dart';
import '../../../../core/routes/routes_manager.dart';
import '../../domain/entities/slider_object.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  OnBoardingViewState createState() => OnBoardingViewState();
}

class OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingBloc()..add(const OnBoardingInitial()),
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: BlocBuilder<OnBoardingBloc, OnBoardingState>(
          builder: (context, state) {
            switch (state.state) {
              case RequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RequestState.loaded:
                return PageView.builder(
                    controller: _pageController,
                    itemCount: state.numSlides,
                    onPageChanged: (index) {
                      context
                          .read<OnBoardingBloc>()
                          .add(OnBoardingPageChanged(currentIndex: index));
                    },
                    itemBuilder: (context, index) {
                      return OnBoardingPage(state.sliderObject);
                    });
              case RequestState.error:
                return const Center(
                  child: Text("ERROR"),
                );
            }
          },
        ),
        bottomSheet: Container(
          color: ColorManager.white,
          height: AppSize.s100,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.loginRoute);
                    },
                    child: Text(
                      AppStrings.skip,
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.end,
                    ),
                  )),
              // add layout for indicator and arrows

              BlocBuilder<OnBoardingBloc, OnBoardingState>(
                builder: (context, state) {
                  return _getBottomSheetWidget(context, state);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget(BuildContext context, OnBoardingState state) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrow),
              ),
              onTap: () {
                // go to previous slide
                _pageController.animateToPage(_getPreviousIndex(state),
                    duration: const Duration(
                        milliseconds: DurationConstants.milli300),
                    curve: Curves.bounceInOut);
              },
            ),
          ),

          // circles indicator
          Row(
            children: [
              for (int i = 0; i < state.numSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i, state),
                )
            ],
          ),

          // right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrow),
              ),
              onTap: () {
                // go to next slide
                _pageController.animateToPage(_getNextIndex(state),
                    duration: const Duration(
                        milliseconds: DurationConstants.milli300),
                    curve: Curves.bounceInOut);
              },
            ),
          )
        ],
      ),
    );
  }

  int _getPreviousIndex(OnBoardingState state) {
    int previousIndex = state.currentIndex - 1; // -1
    if (previousIndex == -1) {
      previousIndex = state.numSlides -
          1; // infinite loop to go to the length of slider list
    }

    return previousIndex;
  }

  int _getNextIndex(OnBoardingState state) {
    int nextIndex = state.currentIndex + 1; // +1
    if (nextIndex >= state.numSlides) {
      nextIndex = 0; // infinite loop to go to first item inside the slider
    }
    return nextIndex;
  }

  Widget _getProperCircle(int index, OnBoardingState state) {
    if (index == state.currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircle); // selected slider
    } else {
      return SvgPicture.asset(ImageAssets.solidCircle); // unselected slider
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_sliderObject.image),
        // image widget
      ],
    );
  }
}
