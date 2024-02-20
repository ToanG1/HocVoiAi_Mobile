import 'package:flutter/material.dart';
import 'package:quick_social/widgets/widgets.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:quick_social/pages/pages.dart';

class SearchLogo extends StatelessWidget {
  const SearchLogo({super.key});

  @override
  Widget build(BuildContext context) {
    //super.build(context);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: ResponsivePadding(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Search', style: textTheme.headlineSmall),

                  // TextButton.icon(
                  //  // onPressed: readAll,
                  //   icon: const Icon(Icons.check),
                  //   label: const Text('Mark as read'),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
