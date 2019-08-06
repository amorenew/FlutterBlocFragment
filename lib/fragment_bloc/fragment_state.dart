import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FragmentState extends Equatable {
  FragmentState([List props = const <dynamic>[]]) : super(props);
}

class FragmentInitialState extends FragmentState {}

class FragmentCurrentState extends FragmentState {
  FragmentCurrentState(this.index) : super(<dynamic>[index]);

  final int index;
}

class FragmentBackState extends FragmentState {
  FragmentBackState(this.index) : super(<dynamic>[index]);

  final int index;
}

class FragmentNoBackState extends FragmentState {
  FragmentNoBackState() : super(<dynamic>[]);
}
