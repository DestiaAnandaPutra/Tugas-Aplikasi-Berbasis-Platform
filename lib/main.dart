import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> films = [
    {
      'title': 'Ghost in the Cell',
      'description': 'Film detektif penuh misteri.',
      'image': 'assets/Ghost_in_The_cell.jpg',
      'status': 'Now Showing',
    },
    {
      'title': 'Mortal Kombat',
      'description': 'Film pertarungan epik.',
      'image': 'assets/Mortal_Kombat.jpg',
      'status': 'Now Showing',
    },
    {
      'title': 'Shaka OH Shaka',
      'description': 'Kisah cinta remaja.',
      'image': 'assets/SHAKA_OH_SHAKA.jpg',
      'status': 'Coming Soon',
    },
    {
      'title': 'Tumbal Proyek',
      'description': 'Film proyek pembangunan yang penuh kejadian mistis.',
      'image': 'assets/TUMBAL_PROYEK.jpg',
      'status': 'Now Showing',
    },
    {
      'title': 'Dilan ITB 1997',
      'description': 'Film kisah cinta remaja era 90an.',
      'image': 'assets/DILAN.jpg',
      'status': 'Now Showing',
    },
    {
      'title': 'Spiderman Brand New Day',
      'description':
          'Film mengisahkan Peter Parker menghapus dirinya dari ingatan orang-orang tercinta.',
      'image': 'assets/Spiderman.jpg',
      'status': 'Coming Soon',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Layar Cinema DAP"),
        backgroundColor: Colors.yellow,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.movie))],
      ),
      body: Column(
        children: [
          // SEARCH BAR
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari Film...",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),

          // LIST FILM
          Expanded(
            child: ListView.builder(
              itemCount: films.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (films[index]['status'] == 'Coming Soon') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Film belum tayang")),
                      );
                    } else {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  DetailPage(
                                    title: films[index]['title']!,
                                    image: films[index]['image']!,
                                    description: films[index]['description']!,
                                  ),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                    begin: Offset(1.0, 0.0),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                );
                              },
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 8,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // GAMBAR FILM
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          child: Image.asset(
                            films[index]['image']!,
                            width: 120,
                            height: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // JUDUL
                                Text(
                                  films[index]['title']!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                // DESKRIPSI
                                Text(
                                  films[index]['description']!,
                                  style: TextStyle(color: Colors.white70),
                                ),
                                SizedBox(height: 15),
                                // STATUS
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        films[index]['status'] == 'Now Showing'
                                        ? Colors.green
                                        : Colors.orange,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    films[index]['status']!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  final String title;
  final String image;
  final String description;

  DetailPage({
    required this.title,
    required this.image,
    required this.description,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final TextEditingController namaController = TextEditingController();

  // DAFTAR KURSI
  List<String> seats = [
    "A1",
    "A2",
    "A3",
    "A4",
    "B1",
    "B2",
    "B3",
    "B4",
    "C1",
    "C2",
    "C3",
    "C4",
    "D1",
    "D2",
    "D3",
    "D4",
    "E1",
    "E2",
    "E3",
    "E4",
    "F1",
    "F2",
    "F3",
    "F4",
    "G1",
    "G2",
    "G3",
    "G4",
    "H1",
    "H2",
    "H3",
    "H4",
    "H5",
    "H6",
    "I1",
    "I2",
    "I3",
    "I4",
    "I5",
  ];

  String selectedSeat = "";
  String selectedTime = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.yellow),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // POSTER
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(widget.image, height: 300),
              ),
              SizedBox(height: 20),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 15),
              Text(
                widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 30),
              Text(
                "Pilih Jam",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children: ["13:00", "16:00", "19:00", "20:00", "21:00"].map((
                  jam,
                ) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedTime == jam
                          ? Colors.yellow
                          : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedTime = jam;
                      });
                    },
                    child: Text(jam),
                  );
                }).toList(),
              ),
              SizedBox(height: 30),
              // LAYAR
              Text(
                "LAYAR",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(color: Colors.white),
              SizedBox(height: 20),
              // PILIH KURSI
              Text(
                "Pilih Kursi",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: seats.map((seat) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedSeat == seat
                          ? Colors.yellow
                          : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedSeat = seat;
                      });
                    },
                    child: Text(seat),
                  );
                }).toList(),
              ),
              SizedBox(height: 30),
              // FORM NAMA
              TextField(
                controller: namaController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Nama Pemesan",
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // TOMBOL CETAK
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Tiket Berhasil Dicetak"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Nama: ${namaController.text}"),
                              SizedBox(height: 10),
                              Text("Film: ${widget.title}"),
                              SizedBox(height: 10),
                              Text("Jam: $selectedTime"),
                              SizedBox(height: 10),
                              Text("Kursi: $selectedSeat"),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    "Cetak Tiket",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
