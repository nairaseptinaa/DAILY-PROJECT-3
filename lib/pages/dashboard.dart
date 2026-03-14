import 'package:flutter/material.dart';
import '../models/alumni.dart';
import 'alumni_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {

    int totalAlumni = alumniDatabase.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Sistem Alumni"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [

            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.people, size: 40),
                title: const Text("Total Alumni"),
                subtitle: Text("$totalAlumni Alumni"),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              child: const Text("Kelola Data Alumni"),
              onPressed: () async {

                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AlumniPage(),
                  ),
                );

                setState(() {}); // refresh dashboard
              },
            )

          ],
        ),
      ),
    );
  }
}