abstract class BaseViewModel {
  //*shared variables and methods used by any view model
  //HA UN INPUT E UN OUPUT
}

abstract class BaseViewModelInput {
  //*input from the view
  void start(); //*init of the viewmodel
  void dispose(); //*when viewmodel dies (es: navigo su altra view)
}

abstract class BaseViewModelOutput {
  //*output FOR the view
}
