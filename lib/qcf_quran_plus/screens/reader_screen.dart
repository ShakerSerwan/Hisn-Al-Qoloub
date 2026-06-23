import 'package:flutter/material.dart';
import '../widgets/quran_page_widget.dart';
import '../services/storage_service.dart';
import 'package:qcf_quran/qcf_quran.dart';

class ReaderScreen extends StatefulWidget {
  const ReaderScreen({super.key});

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  int currentPage = 1;
  PageController? controller;

  @override
  void initState() {
    super.initState();
    loadPage();
  }

  void loadPage() async {
    int savedPage = await StorageService.getPage();
    controller = PageController(initialPage: savedPage - 1);
    setState(() {
      currentPage = savedPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: PageviewQuran(
        controller: controller!,
        initialPageNumber: currentPage,
        onPageChanged: (page) {
          StorageService.savePage(page);
          setState(() {
            currentPage = page;
          });
        },
      ),
    );
  }
}