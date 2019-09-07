import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fragment_bloc/fragment_bloc/fragment.dart';

class FragmentManager {
  factory FragmentManager() {
    return _singleton;
  }
  FragmentManager._internal();

  static final FragmentManager _singleton = FragmentManager._internal();

  int _currentIndex = 0;
  final List<int> _backstack = [0];

  Map<String, Widget> _fragmentsMap = <String, Widget>{};

  List<Widget> _fragments = [];

  void setRoutes(Map<String, Widget> fragmentsMap) {
    _fragmentsMap = fragmentsMap;
  }

  Map<String, Widget> getRoutes() {
    return _fragmentsMap;
  }

  void addFragment(String routeName) {
    _fragments.add(getRoutes()[routeName]);
  }

  void navigateTo(int index) {
    _backstack.add(index);
  }

  bool isExist(String fragmentName) {
    bool exist = false;
    _fragments.asMap().forEach((int index, Widget value) {
      if (value is Fragment && value.getRouteName() == fragmentName) {
        exist = true;
      } else if (value is BlocProvider &&
          value.child is Fragment &&
          (value.child as Fragment).getRouteName() == fragmentName) {
        exist = true;
      } else if (value is MultiBlocProvider &&
          value.child is Fragment &&
          (value.child as Fragment).getRouteName() == fragmentName) {
        exist = true;
      }
    });
    return exist;
  }

  int navigateToName(String fragmentName, {dynamic data}) {
    int fragmentIndex = -1;
    print('manager navigateToName:$fragmentIndex');

    _fragments.asMap().forEach((int index, Widget value) {
      if (value is Fragment && value.getRouteName() == fragmentName) {
        fragmentIndex = index;
        if (data != null) value.setData(data);
      } else if (value is BlocProvider &&
          value.child is Fragment &&
          (value.child as Fragment).getRouteName() == fragmentName) {
        fragmentIndex = index;
        if (data != null) (value.child as Fragment).setData(data);
      } else if (value is MultiBlocProvider &&
          value.child is Fragment &&
          (value.child as Fragment).getRouteName() == fragmentName) {
        fragmentIndex = index;
        if (data != null) (value.child as Fragment).setData(data);
      }
    });
    print('manager navigateToName:$fragmentIndex');
    _backstack.add(fragmentIndex);
    _currentIndex = fragmentIndex;
    return fragmentIndex;
  }

  int navigateBack() {
    return --_currentIndex;
  }

  Future<bool> backPop() {
    if (_currentIndex > 0) {
      return Future<bool>.value(false);
    } else {
      return Future<bool>.value(true);
    }
  }

  void setFragments(List<Widget> fragments) {
    _fragments = fragments;
  }

  Widget getCurrentFragment(int index) {
    if (_fragments.isEmpty) addFragment(getRoutes().entries.first.key);
    return _fragments[index];
  }
}
