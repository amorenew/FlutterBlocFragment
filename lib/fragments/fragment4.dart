import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fragment_bloc/fragment_bloc/bloc.dart';
import 'package:fragment_bloc/fragment_bloc/fragment.dart';
import 'package:fragment_bloc/fragment_routes.dart';

class Fragment4 extends StatefulWidget implements Fragment {
  @override
  
  State<Fragment4> createState() => _Fragment4();

    @override
  String getName() {
    return FRAGMENT_4;
  }
}
class _Fragment4 extends State<Fragment4> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text("_Fragment4"),
          RaisedButton(
            child: Text('Navigate to fragment 1'),
            onPressed: () => BlocProvider.of<FragmentBloc>(context)
                .dispatch(FragmentNavigateEvent(FRAGMENT_1)),
          )
        ],
      ),
    );
  }}
