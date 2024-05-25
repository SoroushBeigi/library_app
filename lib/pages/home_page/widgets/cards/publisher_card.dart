import 'package:flutter/material.dart';
import 'package:library_app/models/publisher_model.dart';

class PublisherCard extends StatelessWidget {
  final PublisherModel model;
  const PublisherCard({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12)),
          color: Theme.of(context).colorScheme.primaryContainer,
          border: Border(
            bottom: BorderSide(color: primary, width: 10),
            left: BorderSide(color: primary, width: 10),
            top: BorderSide(color: primary, width: 10),
          )),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Column(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: ${model.name ?? ''}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Address: ${model.address ?? ''}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
