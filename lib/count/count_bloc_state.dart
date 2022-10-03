

part of 'count_bloc_cubit.dart';


class CountState{
  int counter;
  CountState({required this.counter});
}

class AddState extends CountState{
  AddState({required super.counter});
}

class RemoveState extends CountState{
  RemoveState({required super.counter});

}
