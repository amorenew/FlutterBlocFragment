import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fragment_bloc/fragment_bloc/fragment_manager.dart';
import './bloc.dart';

class FragmentBloc extends Bloc<FragmentEvent, FragmentState> {
  @override
  FragmentState get initialState => FragmentInitialState();
  @override
  Stream<FragmentState> mapEventToState(
    FragmentEvent event,
  ) async* {
    if (event is FragmentNavigateEvent) {
      if (!FragmentManager().isExist(event.routeName)) {
        FragmentManager().addFragment(event.routeName);
      }
      final int currentIndex =
          FragmentManager().navigateToName(event.routeName);
      print('bloc currentIndex:$currentIndex');
      yield FragmentCurrentState(currentIndex);
    } else if (event is FragmentBackEvent) {
      final int currentIndex = FragmentManager().navigateBack();
      if (currentIndex < 0) {
        yield FragmentNoBackState();
      } else {
        yield FragmentBackState(currentIndex);
      }
    }
  }
}
