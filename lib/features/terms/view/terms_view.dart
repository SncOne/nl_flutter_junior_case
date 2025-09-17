import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/widgets/buttons/custom_primary_button.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';

@RoutePage(name: 'TermsRoute')
class TermsView extends StatelessWidget {
  const TermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.t.terms.title, style: AppTextStyles.h4()),
            SizedBox(height: 12),
            Text(context.t.terms.intro),
            SizedBox(height: 8),
            Text(context.t.terms.item1),
            SizedBox(height: 8),
            Text(context.t.terms.item2),
            SizedBox(height: 8),
            Text(context.t.terms.item3),
            SizedBox(height: 16),
            Text(
              context.t.terms.note,
              style: AppTextStyles.bodyNormal(italic: true),
            ),
            SizedBox(height: 80),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: AppButton(
                onPressed: () {
                  context.router.pop();
                },
                label: context.t.terms.accept,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
