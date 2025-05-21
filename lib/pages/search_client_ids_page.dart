import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchClientIdsPage extends StatelessWidget {

  const SearchClientIdsPage({super.key});

  static const String route = '/search-client-ids-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [

              GestureDetector(
                onTapUp: (TapUpDetails _) {
                  context.pop();
                },
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 35,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
