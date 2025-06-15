import 'dart:async';

import 'package:bloc_cubit_example2/bloc/internet_bloc/internet_event.dart';
import 'package:bloc_cubit_example2/bloc/internet_bloc/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivityConnection;

  InternetBloc() : super(InternetInitializeState()) {
    on<InternetLost>((event, emit) => emit(InternetLossState()));
    on<InternetConnect>((event, emit) => emit(InternetConnectedState()));

    connectivityConnection =
        _connectivity.onConnectivityChanged.listen((result) {

          if (result == ConnectivityResult.mobile ||
              result == ConnectivityResult.wifi) {
            add(InternetConnect());
          } else {
            add(InternetLost());
          }
        });
  }

  @override
  Future<void> close() {
    connectivityConnection?.cancel();
    return super.close();
  }
}
