import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// --- DATA MODELS ---
// Keep these definitions once
class Doctor {
  final String id;
  final String name;
  final String specialty;
  const Doctor({required this.id, required this.name, required this.specialty});
}

class Appointment {
  final String id;
  final Doctor doctor;
  final DateTime dateTime;
  final String patientName;
  final String patientPhone;
  Appointment({
    required this.id,
    required this.doctor,
    required this.dateTime,
    required this.patientName,
    required this.patientPhone,
  });
}

enum TimeSlotStatus {
  available,
  booked,
  selected,
}

// --- APPOINTMENTS PAGE (Main Stateful Widget - Keep this one) ---
class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  // All your state variables and methods
  final Color _primaryColor = const Color(0xFF4B6C68);
  final Color _accentColor = Colors.orange;
  final Color _textColor = Colors.white;
  final Color _cardColor = Colors.white.withOpacity(0.1);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  Doctor? _selectedDoctor;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay? _selectedTime;
  final List<Doctor> _availableDoctors = [
    const Doctor(id: 'doc1', name: 'Dr. Aliyah Khan', specialty: 'Physiotherapy'),
    const Doctor(id: 'doc2', name: 'Dr. Rohan Verma', specialty: 'Cardiology'),
    const Doctor(id: 'doc3', name: 'Dr. Priya Singh', specialty: 'Dentistry'),
  ];
  Map<String, TimeSlotStatus> _mockDoctorAvailability = {
    '09:00': TimeSlotStatus.available, '09:30': TimeSlotStatus.booked,
    '10:00': TimeSlotStatus.available, '10:30': TimeSlotStatus.available,
    '11:00': TimeSlotStatus.booked, '11:30': TimeSlotStatus.available,
    '13:00': TimeSlotStatus.available, '13:30': TimeSlotStatus.available,
    '14:00': TimeSlotStatus.booked, '14:30': TimeSlotStatus.available,
  };
  final List<Appointment> _bookedAppointments = [];

  @override
  void initState() {
    super.initState();
    if (_availableDoctors.isNotEmpty) {
      _selectedDoctor = _availableDoctors.first;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  // --- METHODS ---
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 90)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: _accentColor,
              onPrimary: Colors.white,
              onSurface: _textColor,
              surface: _primaryColor,
            ),
            dialogBackgroundColor: _primaryColor,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _selectedTime = null;
      });
    }
  }

  void _selectTime(String time) {
    setState(() {
      final now = DateTime.now();
      _selectedTime = TimeOfDay(
        hour: int.parse(time.split(':')[0]),
        minute: int.parse(time.split(':')[1]),
      );
      if (_selectedDate.day == now.day && _selectedDate.month == now.month && _selectedDate.year == now.year) {
        if (_selectedTime!.hour < now.hour || (_selectedTime!.hour == now.hour && _selectedTime!.minute < now.minute)) {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text("Cannot select a past time slot for today."), backgroundColor: Colors.red),
           );
           _selectedTime = null;
           return;
        }
      }
      _mockDoctorAvailability.forEach((key, value) {
        if (value == TimeSlotStatus.selected) {
          _mockDoctorAvailability[key] = TimeSlotStatus.available;
        }
      });
      if (_mockDoctorAvailability[time] == TimeSlotStatus.available) {
        _mockDoctorAvailability[time] = TimeSlotStatus.selected;
      }
    });
  }

  void _bookAppointment() {
    if (_selectedDoctor == null || _selectedTime == null || _nameController.text.isEmpty || _phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all details and select a time slot."), backgroundColor: Colors.red),
      );
      return;
    }

    final DateTime appointmentDateTime = DateTime(
      _selectedDate.year, _selectedDate.month, _selectedDate.day,
      _selectedTime!.hour, _selectedTime!.minute,
    );

    final newAppointment = Appointment(
      id: UniqueKey().toString(),
      doctor: _selectedDoctor!,
      dateTime: appointmentDateTime,
      patientName: _nameController.text,
      patientPhone: _phoneController.text,
    );

    setState(() {
      _bookedAppointments.add(newAppointment);
      final String timeKey = DateFormat('HH:mm').format(appointmentDateTime);
      _mockDoctorAvailability[timeKey] = TimeSlotStatus.booked;

      _nameController.clear();
      _phoneController.clear();
      _selectedTime = null;
      _mockDoctorAvailability.forEach((key, value) {
        if (value == TimeSlotStatus.selected) {
          _mockDoctorAvailability[key] = TimeSlotStatus.available;
        }
      });
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Appointment booked successfully!"), backgroundColor: Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material( // This is the Material widget that was added
      color: Colors.transparent,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Book an Appointment", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: _textColor)),
            const SizedBox(height: 25),

            Text("Select Doctor", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _textColor)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: _cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _accentColor.withOpacity(0.5)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Doctor>(
                  value: _selectedDoctor,
                  isExpanded: true,
                  dropdownColor: _primaryColor,
                  icon: Icon(Icons.arrow_drop_down, color: _accentColor),
                  style: TextStyle(color: _textColor, fontSize: 16),
                  onChanged: (Doctor? newValue) {
                    setState(() {
                      _selectedDoctor = newValue;
                      _selectedTime = null;
                    });
                  },
                  items: _availableDoctors.map<DropdownMenuItem<Doctor>>((Doctor doctor) {
                    return DropdownMenuItem<Doctor>(
                      value: doctor,
                      child: Text("${doctor.name} (${doctor.specialty})"),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Text("Select Date", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _textColor)),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: _cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: _accentColor.withOpacity(0.5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DateFormat('EEEE, MMM d, yyyy').format(_selectedDate), style: TextStyle(color: _textColor, fontSize: 16)),
                    Icon(Icons.calendar_today, color: _accentColor),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            Text("Available Time Slots", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _textColor)),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 2.5,
              ),
              itemCount: _mockDoctorAvailability.keys.length,
              itemBuilder: (context, index) {
                String time = _mockDoctorAvailability.keys.elementAt(index);
                TimeSlotStatus status = _mockDoctorAvailability[time]!;
                bool isSelected = status == TimeSlotStatus.selected;
                bool isBooked = status == TimeSlotStatus.booked;

                return GestureDetector(
                  onTap: isBooked ? null : () => _selectTime(time),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isBooked ? Colors.red.withOpacity(0.3) : isSelected ? _accentColor.withOpacity(0.8) : _cardColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected ? _accentColor : _textColor.withOpacity(0.3),
                      ),
                    ),
                    child: Text(time, style: TextStyle(color: isBooked ? _textColor.withOpacity(0.5) : _textColor, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
                  ),
                );
              },
            ),
            const SizedBox(height: 25),

            Text("Your Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _textColor)),
            const SizedBox(height: 10),
            TextField(
              controller: _nameController, style: TextStyle(color: _textColor),
              decoration: InputDecoration(
                hintText: "Your Full Name", hintStyle: TextStyle(color: _textColor.withOpacity(0.7)),
                filled: true, fillColor: _cardColor,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: _accentColor)),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _phoneController, style: TextStyle(color: _textColor), keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Your Phone Number", hintStyle: TextStyle(color: _textColor.withOpacity(0.7)),
                filled: true, fillColor: _cardColor,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: _accentColor)),
              ),
            ),
            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity, height: 55,
              child: ElevatedButton(
                onPressed: _bookAppointment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _accentColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text("Confirm Appointment", style: TextStyle(fontSize: 18, color: _textColor, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 30),

            Text("Upcoming Appointments", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: _textColor)),
            const SizedBox(height: 15),
            _bookedAppointments.isEmpty
                ? Text("No appointments booked yet.", style: TextStyle(color: _textColor.withOpacity(0.7), fontSize: 16))
                : Column(
                    children: _bookedAppointments.map((appointment) {
                      return AppointmentQueueCard(
                        appointment: appointment,
                        primaryColor: _primaryColor, accentColor: _accentColor,
                        textColor: _textColor, cardColor: _cardColor,
                      );
                    }).toList(),
                  ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

// --- Helper Widget for the Appointment Queue Card ---
class AppointmentQueueCard extends StatelessWidget {
  final Appointment appointment;
  final Color primaryColor;
  final Color accentColor;
  final Color textColor;
  final Color cardColor;

  const AppointmentQueueCard({
    super.key,
    required this.appointment,
    required this.primaryColor,
    required this.accentColor,
    required this.textColor,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: accentColor.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Dr. ${appointment.doctor.name}",
            style: TextStyle(
              color: accentColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.person, color: textColor.withOpacity(0.8), size: 18),
              const SizedBox(width: 8),
              Text(
                appointment.patientName,
                style: TextStyle(color: textColor, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.phone, color: textColor.withOpacity(0.8), size: 18),
              const SizedBox(width: 8),
              Text(
                appointment.patientPhone,
                style: TextStyle(color: textColor, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.calendar_today, color: textColor.withOpacity(0.8), size: 18),
              const SizedBox(width: 8),
              Text(
                DateFormat('MMM d, yyyy - hh:mm a').format(appointment.dateTime),
                style: TextStyle(color: textColor, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}