import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fragment_bloc/fragment_routes.dart';
import 'package:fragment_bloc/fragment_bloc/bloc.dart';
import 'package:fragment_bloc/fragment_bloc/fragment.dart';


class Fragment2 extends StatefulWidget implements Fragment {
  @override
  
  State<Fragment2> createState() => _Fragment2();

    @override
  String getName() {
    return FRAGMENT_2;
  }
}
class _Fragment2 extends State<Fragment2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text("_Fragment2"),
          RaisedButton(
            child: Text('Navigate to fragment 3'),
            onPressed: () => BlocProvider.of<FragmentBloc>(context)
                .dispatch(FragmentNavigateEvent(FRAGMENT_3)),
          )
        ],
      ),
    );
  }
}
