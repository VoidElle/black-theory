import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/global_neon_button.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
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

              Expanded(child: _buildBody()),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [

        // Todo
        ListView.builder(
          shrinkWrap: true,
          itemCount: 100,
          itemBuilder: (BuildContext _, int index) {
            return SizedBox();
          },
        ),

        Column(
          children: [

            Spacer(),

            Center(
              child: GlobalNeonButton(
                text: 'Avvia ricerca',
                onPressed: () {
                  // Todo
                },
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                ),
              ),
            ),
          ],
        )

      ],
    );
  }

}
