import 'package:bloc_example/validate/validate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidatePage extends StatefulWidget {
  const ValidatePage({Key? key}) : super(key: key);

  @override
  State<ValidatePage> createState() => _ValidatePageState();
}

class _ValidatePageState extends State<ValidatePage> {
  TextEditingController? _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Validate Page"),
      ),
      body: BlocListener<ValidateCubit, ValidateState>(
        listener: (context, state) async {
          if (state.isValid == false) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)));
          }
          if (state.isValid == true) {
            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: Text("success"),
              );
            });
          }
        },
        child: BlocBuilder<ValidateCubit, ValidateState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: TextFormField(
                  onChanged: (v)async{
                    await Future.delayed(const Duration(seconds: 2));
                    context.read<ValidateCubit>().isValid();
                  },
                  controller: context.read<ValidateCubit>().controller,
                  decoration: const InputDecoration(
                    label: Text("Username"),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //
      //   },
      //   child: const Icon(Icons.check),
      // ),
    );
  }
}
