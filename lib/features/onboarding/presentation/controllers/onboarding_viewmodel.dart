import 'package:mvvm/core/presentation/controllers/base_viewmodel.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }
}

abstract class OnBoardingViewModelInputs {
  void goNext(); //*user clicked on right arrow or swiped
  void goPrevious(); //*user clicked on left arrow or swiped
  void onPageChanged(int index); //*cosa fare al cambio pagina
}

abstract class OnBoardingViewModelOutputs {
  //*later
}
