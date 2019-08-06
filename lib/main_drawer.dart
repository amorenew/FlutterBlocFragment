import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fragment_bloc/fragment_bloc/bloc.dart';
import 'package:fragment_bloc/fragment_routes.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Stack(
                children: <Widget>[
                  Center(
                    child: Text(
                      'Fragment Demo',
                      style: TextStyle(color: Color(0xFF4b4b4b), fontSize: 18),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.close,
                          size: 24,
                        ),
                      ))
                ],
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            const Divider(
              height: 0,
            ),
            ListTile(
              title: Text(
                'Fragment 1',
                style: TextStyle(color: Color(0xFF4b4b4b), fontSize: 16),
              ),
              onTap: () {
                BlocProvider.of<FragmentBloc>(context)
                    .dispatch(FragmentNavigateEvent(FRAGMENT_1));
                Navigator.of(context).pop();
              },
            ),
            const Divider(
              height: 0,
            ),
            ListTile(
              title: Text(
                'Fragment 3',
                style: TextStyle(color: Color(0xFF4b4b4b), fontSize: 16),
              ),
              onTap: () {
                BlocProvider.of<FragmentBloc>(context)
                    .dispatch(FragmentNavigateEvent(FRAGMENT_3));
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
