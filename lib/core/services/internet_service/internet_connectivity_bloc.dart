import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flavour_clean_bloc/core/services/internet_service/internet_connectivity_events.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../config/app_logger.dart';
import 'internet_connectivity_states.dart';

class InternetConnectivity extends Bloc<AppEvent, AppState> {
  InternetConnectivity() : super(CheckingInitAppDataState()) {
    _init();
    on<InternetConnectEvent>(_internetConnectivityEvent);
    on<PhoneDeviceAvailbilityEvent>(_phoneDeviceAvailbilityEvent);
  }
  StreamController<bool> manualSearchOverlayVisible =
      StreamController<bool>.broadcast();

  final performBackButtonOperation = PublishSubject<bool>();
  final Connectivity _connectivity = Connectivity();
  bool isOnline = true;

  Future<void> _internetConnectivityEvent(
    InternetConnectEvent event,
    Emitter<AppState> emit,
  ) async {
    emit(InternetConnectState((event).isOnline, event.updatedOn));
  }

  Future<void> _phoneDeviceAvailbilityEvent(
    PhoneDeviceAvailbilityEvent event,
    Emitter<AppState> emit,
  ) async {
    emit(PhoneDeviceAvailbilityState((event).isAvailable));
  }

  void _init() async {
    // Initialize the variables
    await initConnectivity();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult? result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      // print(e.toString());
    }
    return _updateConnectionStatus(result);
  }

  Future<bool> isConnectionOnline() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }

  Future<void> _updateConnectionStatus(ConnectivityResult? result) async {
    var isConnectionOn = await isConnectionOnline();
    AppLogger().printLog(
        tag: 'Connectivity',
        message: '_updateConnectionStatus: $isConnectionOn');
    if (isConnectionOn != isOnline) {
      isOnline = isConnectionOn;
      add(InternetConnectEvent(
          isOnline, DateTime.now().millisecondsSinceEpoch));
    }
  }
}
