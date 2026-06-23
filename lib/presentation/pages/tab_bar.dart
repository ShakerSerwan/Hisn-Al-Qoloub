import 'package:flutter/material.dart';

class PremiumHomePage extends StatelessWidget {
  const PremiumHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F1A),
      appBar: AppBar(
        title: const Text("الإعدادات المتقدمة"),
        backgroundColor: const Color(0xFF0F0F1A),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 🔹 تسجيل الدخول
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00FFD1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(vertical: 18),
              ),
              child: const Text(
                "تسجيل الدخول",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 🔹 النسخة الذهبية
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withAlpha(15),
                border: Border.all(color: Colors.white24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "النسخة الذهبية",
                    style: TextStyle(
                        color: Color(0xFF00FFD1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "اشترك لتفعيل مزايا خاصة وأدوات إضافية وبدون إعلانات",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ==========================
            // 🔹 قسم الأدوات والخصائص
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white.withAlpha(10),
                border: Border.all(color: Colors.white24),
              ),
              child: const Text(
                "قسم الأدوات والخصائص",
                style: TextStyle(
                  color: Color(0xFF00FFD1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),

            ...[
              "المصحف",
              "الفهرس",
              "علامات مرجعية",
              "أذكار الصباح",
              "أذكار المساء",
              "أذكار النوم"
            ].map((item) => sectionItem(item)),

            const SizedBox(height: 24),

            // ==========================
            // 🔹 قسم العرض والتخصيص
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white.withAlpha(10),
                border: Border.all(color: Colors.white24),
              ),
              child: const Text(
                "قسم العرض والتخصيص",
                style: TextStyle(
                  color: Color(0xFF00FFD1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),

            ...["تفعيل الوضع الليلي", "عدم اطفاء الشاشة"].map((item) => sectionItem(item)),

            const SizedBox(height: 24),

            // ==========================
            // 🔹 قسم أخرى
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white.withAlpha(10),
                border: Border.all(color: Colors.white24),
              ),
              child: const Text(
                "قسم أخرى",
                style: TextStyle(
                  color: Color(0xFF00FFD1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),

            ...[
              "الدعم الفني",
              "عن التطبيق",
              "الاسئلة الشائعة",
              "نشر التطبيق",
              "شروط الاستخدام",
              "سياسة الخصوصية"
            ].map((item) => sectionItem(item)),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  //
  Widget sectionItem(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withAlpha(15),
        border: Border.all(color: Colors.white24),
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}