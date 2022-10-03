import 'package:bloc_example/count/count_bloc_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CountCubit, CountState>(
        buildWhen: (previous, current){
          if(current.counter  % 5 == 0) {
            return true;
          } else{
            return false;
          }
        },
        builder: (context, state){

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Count : ',
                      ),
                      Text(
                        state.counter.toString(),
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline4,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: () {
                        context.read<CountCubit>().increment();
                      },
                          child: const Text("Qoshish")),
                      ElevatedButton(onPressed: () {
                        context.read<CountCubit>().decrement();
                      },
                          child: const Text("Ayirish")),
                    ],
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}