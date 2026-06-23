import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/morning_dhikr_repository_impl.dart';
import '../cubit/detailed_dhikr_cubit.dart';

class MorningDhikrPage extends StatelessWidget {
  MorningDhikrPage({super.key});

  final cubit = DetailedDhikrCubit(MorningDhikrRepositoryImpl());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "أذكار الصباح",
          style: TextStyle(color: theme.colorScheme.primary),
        ),
        iconTheme: IconThemeData(
          color: theme.colorScheme.primary,
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              theme.scaffoldBackgroundColor,
              theme.colorScheme.surface,
            ],
            radius: 1.2,
            center: const Alignment(0, -0.3),
          ),
        ),
        child: BlocBuilder<DetailedDhikrCubit, DetailedDhikrState>(
          bloc: cubit,
          builder: (context, state) {
            final dhikr = state.dhikrList[state.currentIndex];
            final progress =
                (state.currentIndex + 1) / state.dhikrList.length;

            return Column(
              children: [
                const SizedBox(height: 30),

                // 🔥 Progress
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor:
                    theme.colorScheme.onSurface.withOpacity(0.1),
                    valueColor: AlwaysStoppedAnimation(
                      theme.colorScheme.primary,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // 🔢 الرقم
                Text(
                  "${state.currentIndex + 1}/${state.dhikrList.length}",
                  style: TextStyle(
                    color:
                    theme.colorScheme.onSurface.withOpacity(0.6),
                    letterSpacing: 1.5,
                  ),
                ),

                const Spacer(),

                // 🔥 المحتوى
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: Column(
                      key: ValueKey(dhikr.text),
                      children: [
                        // ✅ البسملة
                        if (dhikr.hasBasmala)
                          Padding(
                            padding:
                            const EdgeInsets.only(bottom: 20),
                            child: Text(
                              "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color:
                                theme.colorScheme.primary,
                                fontWeight: FontWeight.w600,
                                shadows: [
                                  Shadow(
                                    color: theme.colorScheme.primary
                                        .withOpacity(0.5),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),

                        // ✨ نص الذكر
                        Text(
                          dhikr.text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            height: 1.9,
                            color:
                            theme.colorScheme.onSurface,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // 🟢 المصدر
                Text(
                  dhikr.source,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 14,
                  ),
                ),

                const Spacer(),

                // 🔘 زر العد
                GestureDetector(
                  onTap: cubit.incrementCounter,
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.secondary,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary
                              .withOpacity(0.4),
                          blurRadius: 25,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "${state.counter + 1}",
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 50),
              ],
            );
          },
        ),
      ),
    );
  }
}