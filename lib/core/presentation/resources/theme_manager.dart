import 'package:flutter/material.dart';
import 'package:mvvm/core/presentation/resources/values_manager.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //*main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),
    //*ripple color
    splashColor: ColorManager.primaryOpacity70,
    //*card view theme
    cardTheme: const CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),

    //*appBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle:
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
    ),
    //*Button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70,
    ),
    //*elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
    //*Text theme
    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s16,
        ), //*headline1
        titleMedium: getMediumStyle(
          color: ColorManager.lightGrey,
          fontSize: FontSize.s14,
        ), //*subtitle1
        titleSmall: getMediumStyle(
          color: ColorManager.primary,
          fontSize: FontSize.s14,
        ), //*subtitle1,
        bodySmall: getRegularStyle(
          color: ColorManager.grey1,
        ), //*caption
        bodyLarge: getRegularStyle(
          color: ColorManager.grey,
        ) //*bodyText1
        ),

    //*input decoration theme (text Form Field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      //*hint style
      hintStyle: getRegularStyle(color: ColorManager.grey1),
      //*label style
      labelStyle: getMediumStyle(color: ColorManager.darkGrey),
      //*error style
      errorStyle: getRegularStyle(color: ColorManager.error),
      //*enabled border
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      //*focused border
      focusedBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      //*error border
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      //*focused error border
      focusedErrorBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
    ),
  );
}
