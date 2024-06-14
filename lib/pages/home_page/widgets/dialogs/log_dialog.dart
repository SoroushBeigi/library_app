import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/models/member_model.dart';

class LogDialog extends StatelessWidget {
  final int selectedTab;
  LogDialog({
    required this.selectedTab,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final title = selectedTab == 0
        ? 'Books'
        : selectedTab == 1
            ? 'Members'
            : selectedTab == 2
                ? 'Publishers'
                : 'Employees';
    return AlertDialog(
      title: Text('$title Log'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          child: const Text('Okay'),
        ),
      
      ],
    );
  }
}
