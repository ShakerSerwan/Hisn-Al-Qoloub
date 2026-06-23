import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/dhikr.dart';
import '../cubit/home_cubit.dart';
import '../../data/repositories/dhikr_repository_impl.dart';

import 'morning_dhikr_page.dart';
import 'evening_dhikr_page.dart';
import 'sleep_dhikr_page.dart';
import 'tab_bar.dart';
import 'quran_page.dart';
import '../../qcf_quran_plus/screens/quran_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final HomeCubit cubit = HomeCubit(DhikrRepositoryImpl());

  @override
  void initState() {
    super.initState();
    cubit.loadDhikr();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "الصفحة الرئيسية",
          style: TextStyle(color: theme.colorScheme.primary),
        ),
        actions: [
          IconButton(
            color: theme.colorScheme.primary,
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PremiumHomePage()),
              );
            },
          ),
        ],
      ),

      // ================= NAV BAR =================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });

          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PremiumHomePage()),
            );
          }

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const QuranPage(

                ),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "القرآن"),
          BottomNavigationBarItem(icon: Icon(Icons.headphones), label: "الاستماع"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "المفضلة"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "الإعدادات"),
        ],
      ),

      // ================= BODY =================
      body: SafeArea(
        child: currentIndex == 0
            ? BlocBuilder<HomeCubit, List<Dhikr>>(
          bloc: cubit,
          builder: (context, dhikrList) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    theme.scaffoldBackgroundColor,
                    theme.colorScheme.background,
                  ],
                  radius: 1.2,
                  center: const Alignment(0, -0.3),
                ),
              ),
              child: ListView(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "./Assets/HomePage/home.png",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 25),

                  Text(
                    "الأذكار",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  ...dhikrList
                      .map((dhikr) => premiumCard(dhikr, context)),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      smallPremiumCard("المفضلة", Icons.favorite, context),
                      smallPremiumCard("الاستماع", Icons.headphones, context),
                      smallPremiumCard("القرآن", Icons.menu_book, context),
                    ],
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        )
            : Center(
          child: Text(
            "قريباً...",
            style: theme.textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }

  // ================= CARD =================
  Widget premiumCard(Dhikr dhikr, BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        if (dhikr.title == "أذكار الصباح") {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => MorningDhikrPage()));
        } else if (dhikr.title == "أذكار المساء") {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => EveningDhikrPage()));
        } else if (dhikr.title == "أذكار النوم") {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => SleepDhikrPage()));
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: theme.cardColor,
          border: Border.all(color: theme.dividerColor),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withAlpha(40),
              blurRadius: 15,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(dhikr.icon, color: theme.colorScheme.primary, size: 28),
            const SizedBox(width: 15),
            Text(
              dhikr.title,
              style: theme.textTheme.bodyLarge?.copyWith(fontSize: 18),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios,
                color: theme.textTheme.bodyMedium?.color, size: 16),
          ],
        ),
      ),
    );
  }

  // ================= SMALL CARD =================
  Widget smallPremiumCard(String title, IconData icon, BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (title == "القرآن") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const QuranScreen(

                ),
              ),
            );
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: theme.cardColor,
            border: Border.all(color: theme.dividerColor),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.primary.withAlpha(30),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            children: [
              Icon(icon, color: theme.colorScheme.primary, size: 28),
              const SizedBox(height: 10),
              Text(title, style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}