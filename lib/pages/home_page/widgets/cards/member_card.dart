import 'package:flutter/material.dart';
import 'package:library_app/models/member_model.dart';

class MemberCard extends StatelessWidget {
  final MemberModel model;
  const MemberCard({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: const Radius.circular(12),
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
                  'First Name: ${model.firstName ?? ''}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Last Name: ${model.lastName ?? ''}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Address: ${model.address ?? ''}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Email: ${model.email ?? ''}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Phone: ${model.phoneNumber ?? ''}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Date Joined: ${model.dateJoined ?? ''}',
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
