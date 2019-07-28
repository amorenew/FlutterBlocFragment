import 'package:flutter/widgets.dart';
import 'package:fragment_bloc/fragment_bloc/fragment.dart';
import 'package:fragment_bloc/fragment_bloc/fragment_state.dart';

class FragmentManager {
  int _currentIndex = 0;
  List<int> _backstack = [0];

  static final FragmentManager _singleton = new FragmentManager._internal();

  factory FragmentManager() {
    return _singleton;
  }

  FragmentManager._internal();

  List<Widget> _fragments = [];

  void navigateTo(int index) {
    _backstack.add(index);
    // setState(() {
    //   _currentIndex = index;
    // });
  }

  int navigateToName(String fragmentName) {
    int fragmentIndex = 0;
    print('manager navigateToName:$fragmentIndex');

    _fragments.asMap().forEach((int index, Widget value) {
      if ((value as Fragment).getName() == fragmentName) {
        fragmentIndex = index;
      }
    });
    print('manager navigateToName:$fragmentIndex');
    _backstack.add(fragmentIndex);
    _currentIndex = fragmentIndex;
    return fragmentIndex;
    // setState(() {
    //   _currentIndex = index;
    // });
  }

  int navigateBack() {
    // setState(() {
    return --_currentIndex;
    // });
  }
  // void navigateBack(int index) {
  //   // setState(() {
  //     _currentIndex = index;
  //   // });
  // }

  Future<bool> backPop() {
    if(_currentIndex>0){
      return Future.value(false);
    } else  {
      return Future.value(true);
    }
  }

  // Future<bool> customPop(BuildContext context) {
  //   print("CustomPop is called");
  //   print("_backstack = $_backstack");
  //   if (_backstack.length > 1) {
  //     _backstack.removeAt(_backstack.length - 1);
  //     navigateBack(_backstack[_backstack.length - 1]);
  //     return Future.value(false);
  //   } else {
  //     return Future.value(true);
  //   }
  // }

  void setFragments(List<Widget> fragments) {
    _fragments = fragments;
  }

  Fragment getCurrentFragment(int index) {
    return _fragments[index];
  }
}
