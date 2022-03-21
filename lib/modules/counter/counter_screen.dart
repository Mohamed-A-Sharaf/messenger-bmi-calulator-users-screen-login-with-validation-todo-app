import 'package:app/modules/counter/cubit/cubit.dart';
import 'package:app/modules/counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var s =CounterCubit.get(context);
    // CounterCubit cubit = BlocProvider.of(context);

    return BlocProvider<CounterCubit>(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Counter',
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // counter--;
                    },
                    child: const Text(
                      'MINUS',
                      style: TextStyle(
                        fontSize: 30.0,
                        backgroundColor: Colors.pink,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    // ignore: prefer_const_constructors
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //counter++;
                    },
                    child: const Text(
                      'PLUS',
                      style: TextStyle(
                        fontSize: 30.0,
                        backgroundColor: Colors.pink,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
