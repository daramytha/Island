import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'iPhone Style App',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        barBackgroundColor: Color(0xFFF9F9F9), // Warna bar terang khas iOS
        scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // State untuk melacak tab yang aktif
  int _selectedTabIndex = 0;

  // Daftar halaman untuk setiap tab
  final List<Widget> _tabs = [
    const SettingsTab(),
    const Center(child: Text('Halaman Profil')),
    const Center(child: Text('Halaman Notifikasi')),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      // Tab Bar di bagian bawah
      tabBar: CupertinoTabBar(
        currentIndex: _selectedTabIndex,
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Pengaturan',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell),
            label: 'Notifikasi',
          ),
        ],
      ),
      // Konten untuk setiap tab
      tabBuilder: (context, index) {
        return _tabs[index];
      },
    );
  }
}

// Halaman Pengaturan bergaya iOS
class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // Navigation Bar dengan judul besar
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Pengaturan'),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            // Bagian pertama: Akun
            CupertinoListSection.insetGrouped(
              header: const Text('AKUN'),
              children: [
                CupertinoListTile(
                  leading: const Icon(CupertinoIcons.person_circle),
                  title: const Text('Profil Saya'),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () {
                    // Navigasi ke halaman detail
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const DetailPage(),
                      ),
                    );
                  },
                ),
                CupertinoListTile(
                  leading: const Icon(CupertinoIcons.lock),
                  title: const Text('Keamanan'),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () {},
                ),
              ],
            ),
            // Bagian kedua: Umum
            CupertinoListSection.insetGrouped(
              header: const Text('UMUM'),
              children: [
                CupertinoListTile(
                  leading: const Icon(CupertinoIcons.bell),
                  title: const Text('Notifikasi'),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () {},
                ),
                CupertinoListTile(
                  leading: const Icon(CupertinoIcons.globe),
                  title: const Text('Bahasa'),
                  trailing: const Text(
                    'Indonesia',
                    style: TextStyle(color: CupertinoColors.systemGrey),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Detail sederhana untuk demonstrasi navigasi
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Detail'),
      ),
      child: Center(
        child: CupertinoButton.filled(
          child: const Text('Kembali'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
