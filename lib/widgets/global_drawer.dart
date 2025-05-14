import 'package:flutter/material.dart';

class GlobalDrawer extends StatelessWidget {

  const GlobalDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(),
      child: ColoredBox(
        color: Color(0xFF000000),
        child: SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[

              _buildHeader(context),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

        IconButton(
          onPressed: () {
            Scaffold.of(context).closeDrawer();
          },
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),

      ],
    );
  }

}
