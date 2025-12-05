import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/ai_service.dart'; // For clipboard


class CityInfoScreen extends StatefulWidget {
  const CityInfoScreen({super.key});

  @override
  _CityInfoScreenState createState() => _CityInfoScreenState();
}

class _CityInfoScreenState extends State<CityInfoScreen> {
  final TextEditingController _cityController = TextEditingController();
  String _generatedText = "";
  bool _isCopied = false; // Track if text is copied

  void _generateContent() async {
    if (_cityController.text.isNotEmpty) {
      setState(() {
        _isCopied = false; // Reset copy status when generating new text
      });
      String response = await AIService.generateContent(_cityController.text);
      setState(() {
        _generatedText = response;
      });
    }
  }

  void _copyToClipboard() {
    if (_generatedText.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: _generatedText)).then((_) {
        setState(() {
          _isCopied = true;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Copied to clipboard!"),
            duration: Duration(seconds: 2),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Romania City Info')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(labelText: "Enter a city in Romania"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _generateContent,
              child: const Text("Generate Info"),
            ),
            const SizedBox(height: 10),
            _generatedText.isNotEmpty
                ? ElevatedButton(
                    onPressed: _copyToClipboard,
                    child: Text(_isCopied ? "Copied!" : "Copy Text"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isCopied ? Colors.green : Colors.blue,
                    ),
                  )
                : Container(),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_generatedText, style: const TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
