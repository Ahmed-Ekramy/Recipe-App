import 'package:equatable/equatable.dart';

class RandomEntity  extends Equatable{

  final String? image;
  final String? title;
  final int? readyInMinutes;

  const RandomEntity({
  this.image,
  this.title,
  this.readyInMinutes,
  });




  @override
  List<Object?> get props => [image, title, readyInMinutes];
}
