import 'package:flutter/material.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Softer, nature-inspired colors matching green background
    final List<Map<String, dynamic>> doctors = [
      {
        'name': 'Dr. Bharat Zhandu',
        'speciality': 'Cardiologist',
        'color': const Color(0xFFDCE8D5), // Light sage green
      },
      {
        'name': 'Dr. Sakshay Nodu',
        'speciality': 'ENT Specialist',
        'color': const Color(0xFFF5EEDC), // Soft beige
      },
      {
        'name': 'Dr. Chandan Zhabe',
        'speciality': 'Child Specialist',
        'color': const Color(0xFFE7F3EC), // Pale mint
      },
      {
        'name': 'Dr. Tenzin Dhotii',
        'speciality': 'Kidney Specialist',
        'color': const Color(0xFFF3E6C9), // Warm cream-gold
      },
      {
        'name': 'Dr. Bharat Zhandu',
        'speciality': 'Cardiologist',
        'color': const Color(0xFFDCE8D5), // Light sage green
      },
      {
        'name': 'Dr. Sakshay Nodu',
        'speciality': 'ENT Specialist',
        'color': const Color(0xFFF5EEDC), // Soft beige
      },
      {
        'name': 'Dr. Chandan Zhabe',
        'speciality': 'Child Specialist',
        'color': const Color(0xFFE7F3EC), // Pale mint
      },
      {
        'name': 'Dr. Tenzin Dhotii',
        'speciality': 'Kidney Specialist',
        'color': const Color(0xFFF3E6C9), // Warm cream-gold
      },
      {
        'name': 'Dr. Bharat Zhandu',
        'speciality': 'Cardiologist',
        'color': const Color(0xFFDCE8D5), // Light sage green
      },
      {
        'name': 'Dr. Sakshay Nodu',
        'speciality': 'ENT Specialist',
        'color': const Color(0xFFF5EEDC), // Soft beige
      },
      {
        'name': 'Dr. Chandan Zhabe',
        'speciality': 'Child Specialist',
        'color': const Color(0xFFE7F3EC), // Pale mint
      },
      {
        'name': 'Dr. Tenzin Dhotii',
        'speciality': 'Kidney Specialist',
        'color': const Color(0xFFF3E6C9), // Warm cream-gold
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF4B6C68), // Deep green-teal
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Top Doctors in Our Hospital",
              style: TextStyle(
                fontSize: 30,
                color: Colors.amber.shade100, // warm highlight on green
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Loop through doctors list
            for (var doctor in doctors) ...[
              SizedBox(
                width: 600,
                height: 85,
                child: Card(
                  elevation: 12,
                  color: doctor['color'] as Color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage('https://picsum.photos/200'),
                    ),
                    title: Text(
                      doctor['name'] as String,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2F4F4F), // Deep greenish text
                      ),
                    ),
                    subtitle: Text(
                      doctor['speciality'] as String,
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ],
        ),
      ),
    );
  }
}
