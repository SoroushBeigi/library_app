import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/models/employee_model.dart';

class EmployeeDialog extends StatelessWidget {
  final bool isEditing;
  final EmployeeModel? employeeModel;
  final Function(EmployeeModel?) onPressed;
  EmployeeDialog({
    required this.isEditing,
    required this.onPressed,
    this.employeeModel,
    super.key,
  });

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dateJoinedController = TextEditingController();
  final salaryController = TextEditingController();
  final positionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (employeeModel != null) {
      firstNameController.text = employeeModel!.firstName ?? '';
      lastNameController.text = employeeModel!.lastName ?? '';
      dateJoinedController.text = employeeModel!.dateJoined ?? '';
      salaryController.text = employeeModel!.salary.toString();
      positionController.text = employeeModel!.position ?? '';
    }
    return AlertDialog(
      title: Text('${isEditing ? 'Edit' : 'Add'} an employee'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(
                hintText: 'Enter the employee\'s first name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(
                hintText: 'Enter the employee\'s last name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: dateJoinedController,
              decoration: const InputDecoration(
                hintText: 'Enter the employee\'s join date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
           TextField(
              controller: salaryController,
              decoration: const InputDecoration(
                hintText: 'Enter the employee\'s salary',
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(),
            ),
            const SizedBox(height: 8),
             TextField(
              controller: positionController,
              decoration: const InputDecoration(
                hintText: 'Enter the employee\'s position',
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
              EmployeeModel(
              id:  employeeModel?.id,
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              dateJoined: dateJoinedController.text,
              position: positionController.text,
              salary: double.parse(salaryController.text),
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
