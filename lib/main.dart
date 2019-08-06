import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fragment_bloc/fragment_bloc/fragment.dart';
import 'package:fragment_bloc/fragment_bloc/fragment_manager.dart';
import 'package:fragment_bloc/fragment_routes.dart';
import 'package:fragment_bloc/fragments/fragment1.dart';
import 'package:fragment_bloc/fragments/fragment2.dart';
import 'package:fragment_bloc/fragments/fragment3.dart';
import 'package:fragment_bloc/fragments/fragment4.dart';
import 'package:fragment_bloc/main_app_bar.dart';
import 'package:fragment_bloc/main_drawer.dart';

import 'fragment_bloc/bloc.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: BlocProvider(
          builder: (BuildContext context) => FragmentBloc(),
          child: ContainerPage()),
    ),
  ));
}

class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FragmentManager().setRoutes(<String, Widget>{
      FRAGMENT_1: Fragment1(),
      FRAGMENT_2: Fragment2(),
      FRAGMENT_3: Fragment3(),
      FRAGMENT_4: Fragment4(),
    });

    return BlocProvider<FragmentBloc>(
      builder: (BuildContext context) => FragmentBloc(),
      child: BlocBuilder<FragmentBloc, FragmentState>(
          builder: (BuildContext context, FragmentState state) {
        final Fragment currentFragment = _buildCurrentFragment(state);

        return Scaffold(
          backgroundColor: const Color(0xFFF8F8F8),
          appBar: MainAppBar(
            title: currentFragment.getTitle(),
          ),
          drawer: MainDrawer(),
          body: SafeArea(
            child: WillPopScope(
              onWillPop: () {
                BlocProvider.of<FragmentBloc>(context)
                    .dispatch(FragmentBackEvent());
                return FragmentManager().backPop();
              },
              child: _buildCurrentFragment(state),
            ),
          ),
        );
      }),
    );
  }

  Fragment _buildCurrentFragment(FragmentState state) {
    if (state is FragmentCurrentState) {
      return FragmentManager().getCurrentFragment(state.index);
    } else if (state is FragmentBackState) {
      return FragmentManager().getCurrentFragment(state.index);
    } else {
      return FragmentManager().getCurrentFragment(0);
    }
  }
}
