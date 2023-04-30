import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {}

class InternetConnectState extends AppState {
  final bool isOnline;
  final int updatedOn;

  @override
  List<Object> get props => [isOnline, updatedOn];

  InternetConnectState(this.isOnline, this.updatedOn);
}

class PhoneDeviceAvailbilityState extends AppState {
  final bool isAvailable;

  @override
  List<Object> get props => [isAvailable];

  PhoneDeviceAvailbilityState(this.isAvailable);
}

class CheckingInitAppDataState extends AppState {
  @override
  List<Object?> get props => [];
}
