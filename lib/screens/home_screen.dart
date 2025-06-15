import 'package:bloc_cubit_example2/cubit/internet_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(

          // 1) Bloc Consumer: Bloc Builder + Bloc Listener
          // Now use Cubit instead of Bloc
          // 2) Internet Bloc -> Internet Cubit
          child: BlocConsumer<InternetCubit, InternetState>(
            builder: (context, state) {
              if (state == InternetState.Connected) { // enum class give us variable compare it by values
                return Text('Connected');
              } else if (state == InternetState.Lost) {
                return Text('No Internet');
              } else {
                return Text('Loading...');
              }
            },
            listener: (context, state) {
              if (state == InternetState.Connected) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Connected!"),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state == InternetState.Lost) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("No Internet"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),

          // Bloc Listener: Callback but no UI update
          // Bloc Builder: Update UI, No callback
          /*child: BlocBuilder<InternetBloc, InternetState>(
            builder: (context, state) {
              if (state is InternetConnectedState) {
                return Text('Connected');
              } else if (state is InternetLossState) {
                return Text('No Internet');
              } else {
                return Text('Loading...');
              }
            },
          ),*/
        ),
      ),
    );
  }
}
