import 'package:equatable/equatable.dart';

class RandomEntity  extends Equatable{

  final int? id;
  final String? image;
  final String? title;
  final int? readyInMinutes;

  const RandomEntity({
    this.id,
  this.image,
  this.title,
  this.readyInMinutes,
  });




  @override
  List<Object?> get props => [id, image, title, readyInMinutes];
}
