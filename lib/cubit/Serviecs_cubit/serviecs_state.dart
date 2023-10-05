part of 'serviecs_cubit.dart';

sealed class ServiecsState {}

final class ServiecsInitial extends ServiecsState {}

final class Addproudctloading extends ServiecsState {}

final class Addproudctsucess extends ServiecsState {}

final class Getproudctsuccess extends ServiecsState {
  final List<productmodel> listproduct;
  Getproudctsuccess(this.listproduct);
}

final class ImageCubitSuccess extends ServiecsState {
  final String url;

  ImageCubitSuccess({required this.url});
}

final class Updatesuccess extends ServiecsState {}
