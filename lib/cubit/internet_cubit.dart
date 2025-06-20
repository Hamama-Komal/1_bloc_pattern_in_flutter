
// internet_state class
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState{Initial, Lost, Connected }

class InternetCubit extends Cubit<InternetState>{

  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetCubit(): super(InternetState.Initial){
    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result){
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi){
        emit(InternetState.Connected);
      } else {
        emit(InternetState.Lost);
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }

}
