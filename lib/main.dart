
import 'dart:io';

import 'doctor.dart';
import 'patient.dart';
import 'hospital.dart';

void main() {
  Hospital hospital = Hospital();

  bool running = true;

  while (running) {
    print("\n===== Hospital Management System =====");
    print("1. Add Doctor");
    print("2. Add Patient");
    print("3. Display Doctors");
    print("4. Display Patients");
    print("5. Book Appointment");
    print("6. Exit");

    stdout.write("\nChoose an option: ");

    int? choice = int.tryParse(stdin.readLineSync() ?? "");

    switch (choice) {

    // Add Doctor
      case 1:
        stdout.write("Enter doctor name: ");
        String name = stdin.readLineSync() ?? "";

        stdout.write("Enter doctor age: ");
        int? age = int.tryParse(stdin.readLineSync() ?? "");

        stdout.write("Enter specialization: ");
        String specialization = stdin.readLineSync() ?? "";

        if (name.trim().isEmpty ||
            specialization.trim().isEmpty ||
            age == null ||
            age < 0) {
          print("Invalid doctor information!");
          break;
        }

        Doctor doctor = Doctor(name, age, specialization);

        hospital.addDoctor(doctor);
        break;

    // Add Patient
      case 2:
        stdout.write("Enter patient name: ");
        String name = stdin.readLineSync() ?? "";

        stdout.write("Enter patient age: ");
        int? age = int.tryParse(stdin.readLineSync() ?? "");

        stdout.write("Enter patient ID: ");
        String id = stdin.readLineSync() ?? "";

        if (name.trim().isEmpty ||
            age == null ||
            age < 0 ||
            id.trim().isEmpty) {
          print("Invalid patient information!");
          break;
        }

        Patient patient = Patient(name, age, id);

        hospital.addPatient(patient);
        break;

    // Display Doctors
      case 3:
        hospital.displayDoctors();
        break;

    // Display Patients
      case 4:
        hospital.displayPatients();
        break;

    // Book Appointment
      case 5:
        if (hospital.patients.isEmpty ||
            hospital.doctors.isEmpty) {
          print("You need at least one patient and one doctor.");
          break;
        }

        stdout.write("Enter patient ID: ");
        String patientId = stdin.readLineSync() ?? "";

        stdout.write("Enter doctor name: ");
        String doctorName = stdin.readLineSync() ?? "";

        hospital.bookAppointment(patientId, doctorName);
        break;

    // Exit
      case 6:
        running = false;
        print("Thank you for using Hospital Management System!");
        break;

      default:
        print("Invalid choice! Please choose from 1 to 6.");
    }
  }
}
