import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/models/log_model.dart';

class LogDialog extends StatelessWidget {
  final int selectedTab;
  final List<LogModel> logs;
  const LogDialog({
    required this.selectedTab,
    required this.logs,
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
      content: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children:logs.isEmpty?[ const Center(child:Text('No logs found!'),)]:logs
                .map(
                  (e) => Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(4),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(e.eventType ?? '',style: const TextStyle(color: Colors.white),),
                            Text(e.tableName ?? '',style: const TextStyle(color: Colors.white),),
                            Text(e.eventTime ?? '',style: const TextStyle(color: Colors.white),),
                          ],
                        ),
                        Text(e.eventData ?? '',style: const TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
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
