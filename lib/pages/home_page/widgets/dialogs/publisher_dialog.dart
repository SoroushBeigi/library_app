import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/models/book_model.dart';
import 'package:library_app/models/publisher_model.dart';

class PublisherDialog extends StatelessWidget {
  final bool isEditing;
  final PublisherModel? publisherModel;
  final Function(PublisherModel?) onPressed;
  PublisherDialog({
    required this.isEditing,
    required this.onPressed,
    this.publisherModel,
    super.key,
  });

  final nameController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (publisherModel != null) {
      nameController.text = publisherModel!.name ?? '';
      addressController.text = publisherModel!.address ?? '';
    }
    return AlertDialog(
      title: Text('${isEditing ? 'Edit' : 'Add'} a publisher'),
      content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter the publisher\'s name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                hintText: 'Enter the publisher\'s address',
                border: OutlineInputBorder(),
              ),
            ),
          ]),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => onPressed(
            PublisherModel(
              id: publisherModel?.id ?? 0,
              name: nameController.text,
              address: addressController.text,
            ),
          ),
          child: Text(isEditing ? 'Edit' : 'Add'),
        ),
      ],
    );
  }
}
