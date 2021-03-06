import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fragment_bloc/fragment_bloc/bloc.dart';
import 'package:fragment_bloc/fragment_bloc/fragment.dart';
import 'package:fragment_bloc/fragment_routes.dart';

class Fragment4 extends StatefulWidget implements Fragment {
  @override
  State<Fragment4> createState() => _Fragment4();

  @override
  String getRouteName() {
    return FRAGMENT_4;
  }

  @override
  String getTitle() {
    return 'Fragment 4 Title';
  }

  dynamic data;
  @override
  getData() {
    return data;
  }

  @override
  setData(dynamic data) {
    this.data = data;
  }
}

class _Fragment4 extends State<Fragment4> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text("_Fragment4"),
          Text("Data id passed:${widget.data}"),
          RaisedButton(
            child: Text('Navigate to fragment 1'),
            onPressed: () => BlocProvider.of<FragmentBloc>(context)
                .dispatch(FragmentNavigateEvent(FRAGMENT_1)),
          )
        ],
      ),
    );
  }
}
