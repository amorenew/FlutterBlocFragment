import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fragment_bloc/fragment_bloc/fragment_manager.dart';
import 'package:fragment_bloc/fragments/fragment1.dart';
import 'package:fragment_bloc/fragments/fragment2.dart';
import 'package:fragment_bloc/fragments/fragment3.dart';
import 'package:fragment_bloc/fragments/fragment4.dart';

import 'fragment_bloc/bloc.dart';

void main() {
  runApp(MaterialApp(
    title: 'Fragments Bloc',

    home: Scaffold(
      appBar: AppBar(
        title: Text('Fragments Bloc'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: BlocProvider(
          builder: (BuildContext context) => FragmentBloc(), child: Home()),
    ),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FragmentManager()
      ..setFragments([Fragment1(), Fragment2(), Fragment3(), Fragment4()]);

    return WillPopScope(
      onWillPop: () {
        BlocProvider.of<FragmentBloc>(context).dispatch(FragmentBackEvent());
        return FragmentManager().backPop();
      },
      child: BlocBuilder<FragmentBloc, FragmentState>(
          builder: (BuildContext context, FragmentState state) {
        if (state is FragmentCurrentState)
          return FragmentManager().getCurrentFragment(state.index);
        else if (state is FragmentBackState)
          return FragmentManager().getCurrentFragment(state.index);
        else
          return FragmentManager().getCurrentFragment(0);
      }),
    );
  }
}
