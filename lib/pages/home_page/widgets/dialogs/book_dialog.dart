import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/models/book_model.dart';
import 'package:library_app/models/publisher_model.dart';

class BookDialog extends StatelessWidget {
  final bool isEditing;
  final BookModel? bookModel;
  final List<PublisherModel> publishers;
  final Function(BookModel?) onPressed;
  BookDialog({
    required this.isEditing,
    required this.onPressed,
    required this.publishers,
    this.bookModel,
    super.key,
  });

  final nameController = TextEditingController();
  final genreController = TextEditingController();
  final priceController = TextEditingController();

  int? selectedPublisherId;

  @override
  Widget build(BuildContext context) {
    if (bookModel != null) {
      nameController.text = bookModel!.name ?? '';
      genreController.text = bookModel!.genre ?? '';
      priceController.text = bookModel!.price.toString();
      selectedPublisherId = bookModel!.publisherId;
    }
    return AlertDialog(
      title: Text('${isEditing ? 'Edit' : 'Add'} a book'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter the book\'s name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: genreController,
              decoration: const InputDecoration(
                hintText: 'Enter the book\'s genre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                hintText: 'Enter the book\'s price',
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(),
            ),
            const SizedBox(height: 8),
            DropdownMenu(
              initialSelection: isEditing? publishers.firstWhere((element) => element.id==selectedPublisherId) : null,
                onSelected: (value) {
                  selectedPublisherId = value?.id;
                },
                dropdownMenuEntries: publishers
                    .map((e) => DropdownMenuEntry(value: e, label: e.name ?? ''))
                    .toList()),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            onPressed(
              BookModel(
                id: bookModel?.id,
                name: nameController.text,
                genre: genreController.text,
                price: double.parse(priceController.text),
                publisherId: selectedPublisherId,
              ),
            );
            context.pop(true);
          },
          child: Text(isEditing ? 'Edit' : 'Add'),
        ),
      ],
    );
  }
}
