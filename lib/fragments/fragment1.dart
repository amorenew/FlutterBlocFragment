import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fragment_bloc/fragment_bloc/bloc.dart';
import 'package:fragment_bloc/fragment_bloc/fragment.dart';
import 'package:fragment_bloc/fragment_routes.dart';


class Fragment1 extends StatefulWidget implements Fragment {
  @override
  State<Fragment1> createState() => _Fragment1();

  @override
  String getName() {
    return FRAGMENT_1;
  }
}

class _Fragment1 extends State<Fragment1> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text("_Fragment1"),
          RaisedButton(
            child: Text('Navigate to fragment 2'),
            onPressed: () => BlocProvider.of<FragmentBloc>(context)
                .dispatch(FragmentNavigateEvent(FRAGMENT_2)),
          )
        ],
      ),
    );
  }
}

// BlocProvider.of<FragmentBloc>(context).dispatch(FragmentNavigateEvent(index))
