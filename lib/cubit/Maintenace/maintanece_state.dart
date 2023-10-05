part of 'maintanece_cubit.dart';

sealed class MaintenaceState {}

final class MaintaneceInitial extends MaintenaceState {}

final class Maintaneceloading extends MaintenaceState {}

final class AddMaintanecesuccess extends MaintenaceState {}

final class LoadMaintanecesuccess extends MaintenaceState {
  final List<Maintenacemodel> maintenacelist;

  LoadMaintanecesuccess({required this.maintenacelist});
}

final class UpdateMaintanecesuccess extends MaintenaceState {}
