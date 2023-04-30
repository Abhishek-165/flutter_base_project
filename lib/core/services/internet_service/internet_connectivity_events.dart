import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

// This event is used to check connectivity status.
class ConnectivityStatus extends AppEvent {
  final bool isConnected;

  @override
  List<Object> get props => [isConnected];

  const ConnectivityStatus(this.isConnected);
}

class InternetConnectEvent extends AppEvent {
  final bool isOnline;
  final int updatedOn;

  @override
  List<Object> get props => [isOnline, updatedOn];

  const InternetConnectEvent(this.isOnline, this.updatedOn);
}

class PhoneDeviceAvailbilityEvent extends AppEvent {
  final bool isAvailable;

  @override
  List<Object> get props => [isAvailable];

  const PhoneDeviceAvailbilityEvent(this.isAvailable);
}
