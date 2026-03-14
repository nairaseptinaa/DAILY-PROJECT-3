import 'package:flutter/material.dart';
import '../models/alumni.dart';

class AlumniPage extends StatefulWidget {
  const AlumniPage({super.key});

  @override
  State<AlumniPage> createState() => _AlumniPageState();
}

class _AlumniPageState extends State<AlumniPage> {

  List<Alumni> alumniList = alumniDatabase;
  List<Alumni> filteredList = alumniDatabase;

  final TextEditingController searchController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController tahunController = TextEditingController();
  final TextEditingController pekerjaanController = TextEditingController();
  final TextEditingController perusahaanController = TextEditingController();

  void tambahAlumni() {

    Alumni alumniBaru = Alumni(
      nama: namaController.text,
      tahunLulus: tahunController.text,
      pekerjaan: pekerjaanController.text,
      perusahaan: perusahaanController.text,
    );

    setState(() {
      alumniDatabase.add(alumniBaru);
      filteredList = alumniDatabase;
    });

    namaController.clear();
    tahunController.clear();
    pekerjaanController.clear();
    perusahaanController.clear();
  }

  void hapusAlumni(int index) {
    setState(() {
      alumniDatabase.removeAt(index);
      filteredList = alumniDatabase;
    });
  }

  void searchAlumni(String keyword) {

    setState(() {
      filteredList = alumniDatabase
          .where((alumni) =>
              alumni.nama.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }

  void editAlumni(int index) {

    Alumni data = filteredList[index];

    namaController.text = data.nama;
    tahunController.text = data.tahunLulus;
    pekerjaanController.text = data.pekerjaan;
    perusahaanController.text = data.perusahaan;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Alumni"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              TextField(
                controller: namaController,
                decoration: const InputDecoration(labelText: "Nama"),
              ),

              TextField(
                controller: tahunController,
                decoration: const InputDecoration(labelText: "Tahun Lulus"),
              ),

              TextField(
                controller: pekerjaanController,
                decoration: const InputDecoration(labelText: "Pekerjaan"),
              ),

              TextField(
                controller: perusahaanController,
                decoration: const InputDecoration(labelText: "Perusahaan"),
              ),

            ],
          ),
          actions: [

            ElevatedButton(
              child: const Text("Update"),
              onPressed: () {
                setState(() {

                  data.nama = namaController.text;
                  data.tahunLulus = tahunController.text;
                  data.pekerjaan = pekerjaanController.text;
                  data.perusahaan = perusahaanController.text;

                });

                Navigator.pop(context);
              },
            )

          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sistem Tracker Alumni"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: "Search Alumni",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: searchAlumni,
            ),

            const SizedBox(height: 20),

            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: "Nama Alumni",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: tahunController,
              decoration: const InputDecoration(
                labelText: "Tahun Lulus",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: pekerjaanController,
              decoration: const InputDecoration(
                labelText: "Pekerjaan",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: perusahaanController,
              decoration: const InputDecoration(
                labelText: "Perusahaan",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: tambahAlumni,
              child: const Text("Tambah Alumni"),
            ),

            const SizedBox(height: 20),

            Text(
              "Total Alumni: ${alumniDatabase.length}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {

                  final alumni = filteredList[index];

                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(alumni.nama),
                      subtitle: Text(
                        "Lulus: ${alumni.tahunLulus}\n"
                        "Pekerjaan: ${alumni.pekerjaan}\n"
                        "Perusahaan: ${alumni.perusahaan}",
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => editAlumni(index),
                          ),

                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => hapusAlumni(index),
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}