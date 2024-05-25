import 'package:flutter/material.dart';
import 'package:library_app/models/book_model.dart';

class BookCard extends StatelessWidget {
  final BookModel model;
  const BookCard({required this.model,super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Column(
              children: [
                Text('ID: ${model.id?.toString()??''}' ),
                Text('Name: ${model.name?.toString()??''}' )
              ],
            ),
            Column(
              children: [
                Text('Genre: ${model.genre?.toString()??''}' ),
                Text('${model.price?.toString()??''}T' )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
