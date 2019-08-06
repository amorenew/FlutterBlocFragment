import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fragment_bloc/fragment_bloc/bloc.dart';
import 'package:fragment_bloc/fragment_bloc/fragment.dart';
import 'package:fragment_bloc/fragment_routes.dart';

class Fragment3 extends StatefulWidget implements Fragment {
  @override
  State<Fragment3> createState() => _Fragment3();

   @override
  String getRouteName() {
    return FRAGMENT_3;
  }

  @override
  String getTitle() {
    return 'Fragment 3 Title';
  }

}

class _Fragment3 extends State<Fragment3> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text("_Fragment3"),
          RaisedButton(
            child: Text('Navigate to fragment 4'),
            onPressed: () => BlocProvider.of<FragmentBloc>(context)
                .dispatch(FragmentNavigateEvent(FRAGMENT_4)),
          ),
          RaisedButton(
            child: Text('Back to fragment 2'),
            onPressed: () => BlocProvider.of<FragmentBloc>(context)
                .dispatch(FragmentBackEvent()),
          )
        ],
      ),
    );
  }
}
