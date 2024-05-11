import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freelanc/features/company/profiles/ui/widget/style_profile.dart';

class TopChoseUser extends StatelessWidget {
  const TopChoseUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      StyleInfoProfile(
        alignment: Alignment.topRight,
        cricularbottmleft: true,
      ),
    ]);
  }
}
