import 'package:flutter/material.dart';
import 'controller.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});
  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  var controller = JournalController();
  String keyword = '';

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    await controller.load();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFFF1F4FA),
    appBar: AppBar(
      centerTitle: true,
      backgroundColor: const Color(0xFF1B2A49),
      foregroundColor: Colors.white,
      title: const Text('🧱 テトリス 役立ちそうで役に立たない豆知識'),
    ),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            decoration: const InputDecoration(
              hintText: '検索（例: ソ連、T-Spin、7-bag）',
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
            ),
            onChanged: (s) => setState(() => keyword = s),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              for (var p in controller.search(keyword))
                ListTile(
                  leading: Text(p['emoji'], style: const TextStyle(fontSize: 36)),
                  title: Text(p['user'],
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(p['text'], style: const TextStyle(fontSize: 15)),
                ),
            ],
          ),
        ),
      ],
    ),
  );
}
