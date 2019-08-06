import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fragment_bloc/fragment_routes.dart';

import 'fragment_bloc/bloc.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  MainAppBar({Key key, this.title = '', this.isHomeButtonShow = false})
      : preferredSize = Size.fromHeight(56.0),
        super(key: key);
  final String title; // default is 56.0
  bool isHomeButtonShow = false;
  bool isWarningClicked = false;
  bool isMessagesClicked = false;
  @override
  final Size preferredSize; // default is 56.0

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return _buildAppbar();
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildAppbar() {
    return AppBar(
      titleSpacing: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.isHomeButtonShow)
            IconButton(
              icon: Icon(
                Icons.home,size:24
              ),
              onPressed: () {},
            ),
          Text(
            widget.title,
            style: TextStyle(color: Color(0xFF4b4b4b)),
          ),
        ],
      ),
      elevation: 0,
      leading: Builder(
        builder: (BuildContext context) => IconButton(
          icon: Icon(
            Icons.menu,
          ),
          color: Color(0xFF4b4b4b),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            widget.isWarningClicked ?Icons.error_outline :Icons.error,size: 24,
          ),
          onPressed: () {
            setState(() {
              widget.isWarningClicked = !widget.isWarningClicked;
            });
          },
        ),
        IconButton(
          icon: Icon(
            widget.isMessagesClicked ? Icons.mode_comment :Icons.comment,size: 24,
          ),
          onPressed: () {
            setState(() {
              widget.isMessagesClicked = !widget.isMessagesClicked;
              BlocProvider.of<FragmentBloc>(context)
                  .dispatch(FragmentNavigateEvent(FRAGMENT_4));
            });
          },
        )
      ],
      backgroundColor: Color(0xFFF5C837),
    );
  }

}
