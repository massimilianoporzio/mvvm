import 'package:equatable/equatable.dart';

class SliderObject implements Equatable {
  final String title;
  final String subTitle;
  final String image;

  const SliderObject({this.title = '', this.subTitle = '', this.image = ''});

  @override
  List<Object?> get props => [
        title,
        subTitle,
        image,
      ];

  @override
  bool? get stringify => true;
}
