import '../../../../components/custom_surfix_icon.dart';
import '../../../../constants.dart';
import 'package:flutter/material.dart';
import 'package:cardio_app/services/notification_service.dart';
import 'package:intl/intl.dart';

class MedicineForm extends StatefulWidget {
  const MedicineForm({Key? key});

  @override
  _MedicineFormState createState() => _MedicineFormState();
}

class _MedicineFormState extends State<MedicineForm> {
  final _formKey = GlobalKey<FormState>();
  String? medicineName;
  String? dosage;
  String? medicineType;
  TimeOfDay? selectedTime;
  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  void _confirmSchedule(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(selectedTime);
      NotificationService().createNotification( title: medicineName, content: "YOUR OWN FRIENDLY REMINDER", scheduleTime: selectedTime);
      // Add your logic here to schedule the medicine reminder
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Medicine reminder scheduled')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Center(
            child: TextFormField(
              keyboardType: TextInputType.text,
              onSaved: (newValue) => medicineName = newValue,
              decoration: const InputDecoration(
                labelText: "Medicine Name",
                hintText: "Enter Medicine Name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: TextFormField(
              keyboardType: TextInputType.text,
              onSaved: (newValue) => dosage = newValue,
              decoration: const InputDecoration(
                labelText: "Dosage",
                hintText: "Enter your Dosage",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Medicine Type",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (String value in ['Syrup', 'Pill', 'Syringe'])
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<String>(
                          value: value,
                          groupValue: medicineType,
                          onChanged: (String? newValue) {
                            setState(() {
                              medicineType = newValue;
                            });
                          },
                        ),
                        CustomSurffixIcon(
                          svgIcon: value == 'Syrup'
                              ? "assets/icons/medicine.svg"
                              : value == 'Pill'
                              ? "assets/icons/pill.svg"
                              : "assets/icons/syringe.svg",
                          width: 50,
                          height: 49,
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Set Time:",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _selectTime(context),
            child: const Text('Pick Time'),
          ),
          if (selectedTime != null)
            Text(
              'Selected Time: ${selectedTime!.format(context)}',
              style: const TextStyle(fontSize: 20),
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _confirmSchedule(context),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}