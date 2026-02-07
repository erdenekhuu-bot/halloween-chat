import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:halloween/utils/Stack.dart';

class Media extends StatefulWidget {
  const Media({super.key});

  @override
  State<Media> createState() => _MediaState();
}

class _MediaState extends State<Media> {
  Timer? _debounce;
  List<dynamic> _mediaList = [];

  Future<void> _images() async {
    final response = await http.get(
      Uri.parse('http://192.168.6.144:8000/api/media/'),
      headers: {
        "Accept": "application/json",
        "Authorization": "Token ${StackMemory.getToken()}",
      },
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(utf8.decode(response.bodyBytes));
      final List<dynamic> items = decoded is List
          ? decoded
          : (decoded["results"] ?? []);
      if (mounted) {
        setState(() => _mediaList = items);
      }

    }
  }

  @override
  void initState() {
    super.initState();
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      _images();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) =>
            Image.network(_mediaList[index]['caption'], fit: BoxFit.cover),
        itemCount: _mediaList.length,
    );
  }
}
