
import 'doctor.dart';
import 'patient.dart';

class Hospital {
  List<Doctor> doctors = [];
  List<Patient> patients = [];

  void addDoctor(Doctor doctor) {
    doctors.add(doctor);
    print("Doctor added successfully!");
  }

  void addPatient(Patient patient) {
    if (patient.patientId.trim().isEmpty) {
      print("Error: Patient ID cannot be empty!");
      return;
    }

    bool exists = patients.any(
          (p) => p.patientId == patient.patientId,
    );

    if (exists) {
      print("Error: Patient ID already exists!");
    } else {
      patients.add(patient);
      print("Patient added successfully!");
    }
  }

  void displayDoctors() {
    if (doctors.isEmpty) {
      print("No doctors available.");
      return;
    }

    print("\n===== Doctors List =====");

    for (Doctor doctor in doctors) {
      print("--------------------");
      doctor.displayInfo();
    }
  }

  void displayPatients() {
    if (patients.isEmpty) {
      print("No patients available.");
      return;
    }

    print("\n===== Patients List =====");

    for (Patient patient in patients) {
      print("--------------------");
      patient.displayInfo();
    }
  }

  void bookAppointment(String patientId, String doctorName) {
    Patient? selectedPatient;
    Doctor? selectedDoctor;

    // Search for Patient
    for (Patient patient in patients) {
      if (patient.patientId == patientId) {
        selectedPatient = patient;
        break;
      }
    }

    for (Doctor doctor in doctors) {
      if (doctor.name.toLowerCase() ==
          doctorName.toLowerCase()) {
        selectedDoctor = doctor;
        break;
      }
    }

    if (selectedPatient == null) {
      print("Error: Patient ID not found!");
      return;
    }

    if (selectedDoctor == null) {
      print("Error: Doctor name not found!");
      return;
    }

    selectedPatient.bookAppointment(selectedDoctor);
  }
}
