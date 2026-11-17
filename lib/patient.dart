
import 'person.dart';
import 'doctor.dart';

class Patient extends Person {
  String _patientId;
  Doctor? _doctor;

  Patient(String name, int age, String patientId)
      : _patientId = patientId,
        _doctor = null,
        super(name, age);

  Patient.guest()
      : _patientId = "GUEST",
        _doctor = null,
        super("Guest Patient", 0);

  String get patientId => _patientId;

  set patientId(String id) {
    if (id.trim().isEmpty) {
      print("Patient ID cannot be empty!");
    } else {
      _patientId = id;
    }
  }

  void bookAppointment(Doctor doctor) {
    _doctor = doctor;
    print("Appointment booked successfully!");
  }

  @override
  void displayInfo() {
    print("Patient Name: $name");
    print("Age: $age");
    print("Patient ID: $_patientId");

    if (_doctor != null) {
      print("Assigned Doctor: ${_doctor!.name}");
    } else {
      print("Assigned Doctor: No doctor assigned");
    }
  }
}
