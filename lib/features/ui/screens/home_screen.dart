import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String name = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedDateIndex = 0;
  late YoutubePlayerController _youtubeController;
  late List<DateTime> next7Days;

  @override
  void initState() {
    super.initState();

    // Initialize YouTube Player
    _youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=dQw4w9WgXcQ")!,
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );

    // Generate list of next 7 days from today
    final today = DateTime.now();
    next7Days = List.generate(7, (index) => today.add(Duration(days: index)));
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final selectedDate = next7Days[selectedDateIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF5A55CA),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back!",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text("Let’s take it one step at a time.",
                  style: TextStyle(color: Colors.grey, fontSize: 14)),
              const SizedBox(height: 24),

              // Real-time Date Selector
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: next7Days.length,
                  itemBuilder: (context, index) {
                    final date = next7Days[index];
                    final isSelected = index == selectedDateIndex;
                    final day = DateFormat.E().format(date);
                    final dayNum = DateFormat.d().format(date);
                    return GestureDetector(
                      onTap: () => setState(() => selectedDateIndex = index),
                      child: Container(
                        width: 60,
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.green : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: isSelected
                              ? [const BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))]
                              : [],
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              day,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              dayNum,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),
              const Text(
                "Time-based Routine Example:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),

              // Routine Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Time & Notes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Row(
                          children: [
                            Icon(Icons.access_time, size: 16, color: Colors.grey),
                            SizedBox(width: 6),
                            Text("9:00 AM", style: TextStyle(fontSize: 14)),
                          ],
                        ),
                        Text("Notes", style: TextStyle(fontSize: 14, color: Colors.blue)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text("Watch:", style: TextStyle(color: Colors.black54)),
                    const SizedBox(height: 6),
                    const Text(
                      "How to Calm Your Morning",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),

                    // Embedded YouTube Player
                    YoutubePlayer(
                      controller: _youtubeController,
                      showVideoProgressIndicator: false,
                      progressIndicatorColor: Colors.deepPurple,
                    ),

                    const SizedBox(height: 12),
                    const Text(
                      "Once the task is complete, kindly submit your notes.",
                      style: TextStyle(color: Colors.redAccent, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}