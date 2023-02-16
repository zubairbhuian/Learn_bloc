import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_block/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncriment == true) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                duration: Duration(milliseconds: 5),
                content: Text('Incriment')));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                duration: Duration(milliseconds: 5),
                content: Text('Decriment')));
          }
          // TODO: implement listener
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                    "The number is :${state.value}",
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.red,
                        fontWeight: FontWeight.w600),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).incriment();
                      },
                      child: const Icon(Icons.add)),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decriment();
                      },
                      child: const Icon(Icons.remove)),
                ],
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
