import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/models/employee_model.dart';
import 'package:library_app/models/member_model.dart';

class MemberDialog extends StatelessWidget {
  final bool isEditing;
  final MemberModel? memberModel;
  final Function(MemberModel?) onPressed;
  MemberDialog({
    required this.isEditing,
    required this.onPressed,
    this.memberModel,
    super.key,
  });

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dateJoinedController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (memberModel != null) {
      firstNameController.text = memberModel!.firstName ?? '';
      lastNameController.text = memberModel!.lastName ?? '';
      dateJoinedController.text = memberModel!.dateJoined ?? '';
      addressController.text = memberModel!.address ?? '';
      phoneController.text = memberModel!.phoneNumber ?? '';
      emailController.text = memberModel!.email ?? '';
    }
    return AlertDialog(
      title: Text('${isEditing ? 'Edit' : 'Add'} a member'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(
                hintText: 'Enter the member\'s first name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(
                hintText: 'Enter the member\'s last name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: dateJoinedController,
              decoration: const InputDecoration(
                hintText: 'Enter the member\'s join date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                hintText: 'Enter the member\'s address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                hintText: 'Enter the members\'s phone number',
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Enter the members\'s email address',
                border: OutlineInputBorder(),
              ),
            ),
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
              MemberModel(
                id: memberModel?.id,
                firstName: firstNameController.text,
                lastName: lastNameController.text,
                dateJoined: dateJoinedController.text,
                address: addressController.text,
                phoneNumber: phoneController.text,
                email: emailController.text,
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
