import 'package:flutter/material.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homescreen(),
    );
  }
}

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0; // Tracks the active tab

  final List<Widget> _pages = [
    HomePage(),      // Home
    MoviesPage(),    // Movies
    TicketScreen(),   // Tickets
    TicketsListPage() // My Tickets
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TIX ID', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: Colors.black),
          ),
        ],
      ),
      body: _pages[_currentIndex], // Display the active page based on the index
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            label: "Movies",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'My Tickets',
          ),
        ],
        selectedItemColor: const Color(0xFF09303F), // Dark Blue color
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the active tab index
          });
        },
      ),
    );
  }
}

// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Jakarta",
                prefixIcon: const Icon(Icons.location_on, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Banner Slider (Example)
          SizedBox(
            height: 150,
            child: PageView(
              children: [
                _buildBanner('assets/slider1.jpg'),
                _buildBanner('assets/slider2.webp'),
                _buildBanner('assets/slider3.jpg'),
                _buildBanner('assets/slider5.jpg'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Now Playing Movies Section
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Now Playing",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildMovieCard('assets/film1.jpg', 'Kuasa Gelap'),
                _buildMovieCard('assets/film 4.jpg', 'Joker'),
                _buildMovieCard('assets/film2.jpg', 'Harry Potter'),
                _buildMovieCard('assets/film 9.jpg', 'Sekawan Limo'),
                _buildMovieCard('assets/film3.jpg', 'Spiderman'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Spotlight Section
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Spotlight",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildSpotlightItem(
                  'assets/gambar1.jpg',
                  "TIX ID Box Office (11-17 November)",
                  "Film terlaris di bioskop Indonesia",
                  57,
                  0,
                ),
                _buildSpotlightItem(
                  'assets/gambar2.jpg',
                  "Film Marvel Terbaru",
                  "Tayang di bioskop minggu ini",
                  120,
                  5,
                ),
                _buildSpotlightItem(
                  'assets/gambar 3.jpg',
                  "Marvel's Latest Hits",
                  "Hot releases this week",
                  150,
                  10,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // TIX Now Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "TIX Now",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                final newsItems = [
                  {
                    'title': "'We Live in Time' Drama Romansa Terbaru Dari Andrew Garfield dan Florence...",
                    'time': '2 jam lalu',
                    'image': 'assets/tix12.jpg',
                  },
                  {
                    'title': "Tom Cruise Rilis Trailer 'Mission: Impossible 8 The Final Reckoning'",
                    'time': '3 hari lalu',
                    'image': 'assets/tix5.jpg',
                  },
                  {
                    'title': "Siap-siap Bernyanyi Bersama Ariana Grande dan Cynthia Erivo di Film 'WICKED'",
                    'time': '4 hari lalu',
                    'image': 'assets/tix3.webp',
                  },
                  {
                    'title': "Sedang Tayang, Intip Dulu Sinopsis Film Betting With Ghost Asal Vietnam",
                    'time': '5 hari lalu',
                    'image': 'assets/tix4.png',
                  },
                ];
                return _buildTixNowItem(
                  newsItems[index]['image']!,
                  newsItems[index]['title']!,
                  newsItems[index]['time']!,
                );
              },
            ),
          ],
        ),
      );
    }
  // Banner Widget
  Widget _buildBanner(String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Movie Card Widget
  Widget _buildMovieCard(String imagePath, String title) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 200,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Spotlight Item Widget
  Widget _buildSpotlightItem(
    String imagePath,
    String title,
    String subtitle,
    int views,
    int likes,
  ) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.remove_red_eye, size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text("$views"),
                    const SizedBox(width: 10),
                    Icon(Icons.thumb_up, size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text("$likes"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
// TIX Now Item Widget
  Widget _buildTixNowItem(String imagePath, String title, String time) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(time),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16.0),
        onTap: () {
          // Tambahkan aksi saat item ditekan
        },
      ),
    );
  }
}
//Halaman Film
  class MoviesPage extends StatelessWidget {
  final List<String> cinemas = [
    "AEON MALL JGC CGV",
    "AEON MALL TANJUNG BARAT XXI",
    "AGORA MALL IMAX",
    "AGORA MALL PREMIERE",
    "AGORA MALL XXI",
    "ARION XXI",
    "ARTHA GADING XXI",
    "BASSURA XXI", 
  ];  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Bioskop"),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: ListView.builder(
        itemCount: cinemas.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.movie),
            title: Text(cinemas[index]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Tambahkan navigasi atau aksi di sini
              print('Anda memilih ${cinemas[index]}');
            },
          );
        },
      ),
    );
  }
}
class TicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Dua tab: Sedang Tayang dan Akan Datang
      child: Scaffold(
        appBar: AppBar(
          title: Text('Film Bioskop'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: 'SEDANG TAYANG'),
              Tab(text: 'AKAN DATANG'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab Sedang Tayang
            FilmGrid(films: [
              Film(
                title: 'BILA ESOK IBU TIADA',
                genre: 'Drama, Keluarga',
                rating: '9.2',
                imageUrl: 'assets/movie1.jpg',
              ),
              Film(
                title: 'SANTET SEGORO PITU',
                genre: 'Horror',
                rating: '9.0',
                imageUrl: 'assets/movie2.jpg',
              ),
              Film(
                title: 'GLADIATOR II',
                genre: 'Action, Adventure',
                rating: '9.5',
                imageUrl: 'assets/movie3.jpeg',
              ),
              Film(
                title: 'RED ONE',
                genre: 'Action, Adventure',
                rating: '9.3',
                imageUrl: 'assets/movie 4.png',
              ),
            ]),
            // Tab Akan Datang
            FilmGrid(films: [
              Film(
                title: 'AVATAR: THE NEXT CHAPTER',
                genre: 'Sci-Fi, Adventure',
                rating: '9.0',
                imageUrl: 'assets/movie5.jpg',
              ),
              Film(
                title: 'MISSION: IMPOSSIBLE - DEAD RECKONING PART TWO',
                genre: 'Action, Thriller',
                rating: '8.9',
                imageUrl: 'assets/movie6.jpg',
              ),
              Film(
                title: 'THE MARVELS',
                genre: 'Action, Fantasy',
                rating: '8.8',
                imageUrl: 'assets/movie7.jpeg',
              ),
              Film(
                title: 'TRANSFORMERS: RISE OF UNICRON',
                genre: 'Action, Sci-Fi',
                rating: '8.7',
                imageUrl: 'assets/movie8.jpg',
              ),
            ]),
          ],
        ),
        
      ),
    );
  }
}

class FilmGrid extends StatelessWidget {
  final List<Film> films;

  const FilmGrid({required this.films});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(16.0),
      children: films
          .map(
            (film) => FilmCard(
              title: film.title,
              genre: film.genre,
              rating: film.rating,
              imageUrl: film.imageUrl,
            ),
          )
          .toList(),
    );
  }
}

class FilmCard extends StatelessWidget {
  final String title;
  final String genre;
  final String rating;
  final String imageUrl;

  const FilmCard({
    required this.title,
    required this.genre,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              genre,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 16),
                SizedBox(width: 4),
                Text(
                  rating,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Film {
  final String title;
  final String genre;
  final String rating;
  final String imageUrl;

  Film({
    required this.title,
    required this.genre,
    required this.rating,
    required this.imageUrl,
  });
}

class TicketsListPage extends StatelessWidget {
  const TicketsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghapus ikon default back
        title: const Text(
          'Daftar Film',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Color.fromRGBO(244, 67, 54, 1),
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  "Jakarta",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Film Card 1
            MovieCard(
              movieTitle: "GLADIATOR 2",
              genre: "Action, Adventure",
              ageRating: "D 18+",
              rating: "9.5",
              imageUrl: "assets/movie3.jpeg", // Ganti dengan gambar yang valid
            ),
            const SizedBox(height: 16),
            // Film Card 2
            MovieCard(
              movieTitle: "RED ONE",
              genre: "Action, Adventure",
              ageRating: "R 13+",
              rating: "9.3",
              imageUrl: "assets/movie 4.png", // Ganti dengan gambar yang valid
            ),
          ],
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String movieTitle;
  final String genre;
  final String ageRating;
  final String rating;
  final String imageUrl;

  const MovieCard({
    required this.movieTitle,
    required this.genre,
    required this.ageRating,
    required this.rating,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            // Movie Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imageUrl,
                height: 100,
                width: 75,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            // Movie Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieTitle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    genre,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Age Rating: $ageRating',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.yellow),
                      const SizedBox(width: 5),
                      Text(
                        rating,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class TicketsListPage extends StatelessWidget {
//   const TicketsListPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false, // Menghapus ikon default back
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Film Card 1
//             MovieCard(
//               movieTitle: "GLADIATOR 2",
//               genre: "Action, Adventure",
//               ageRating: "D 18+",
//               rating: "9.5",
//               imageUrl: "assets/movie3.jpeg", // Ganti dengan gambar yang valid
//             ),
//             const SizedBox(height: 16),
//             // Film Card 2
//             MovieCard(
//               movieTitle: "RED ONE",
//               genre: "Action, Adventure",
//               ageRating: "R 13+",
//               rating: "9.3",
//               imageUrl: "assets/movie 4.png", // Ganti dengan gambar yang valid
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MovieCard extends StatelessWidget {
//   final String movieTitle;
//   final String genre;
//   final String ageRating;
//   final String rating;
//   final String imageUrl;

//   const MovieCard({
//     required this.movieTitle,
//     required this.genre,
//     required this.ageRating,
//     required this.rating,
//     required this.imageUrl,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         child: Row(
//           children: [
//             // Movie Image
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.asset(
//                 imageUrl,
//                 height: 100,
//                 width: 75,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(width: 10),
//             // Movie Details
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     movieTitle,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     genre,
//                     style: const TextStyle(fontSize: 12, color: Colors.grey),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     'Age Rating: $ageRating',
//                     style: const TextStyle(fontSize: 12, color: Colors.grey),
//                   ),
//                   const SizedBox(height: 5),
//                   Row(
//                     children: [
//                       const Icon(Icons.star, size: 16, color: Colors.yellow),
//                       const SizedBox(width: 5),
//                       Text(
//                         rating,
//                         style: const TextStyle(fontSize: 14),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

