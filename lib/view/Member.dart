import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:halloween/utils/Stack.dart';
import 'package:http/http.dart' as http;

class Member extends StatefulWidget {
  const Member({super.key});

  @override
  State<Member> createState() => _MemberState();
}

class _MemberState extends State<Member> {
  final TextEditingController memberController = TextEditingController();

  Timer? _debounce;
  bool _loading = false;
  String? _error;

  List<dynamic> _members = [];

  // TODO: set your token
  final String token = StackMemory.getToken();

  @override
  void initState() {
    super.initState();
    _fetchMembers("");
    memberController.addListener(() {
      final q = memberController.text.trim();
      _onSearchChanged(q);
    });
  }

  void _onSearchChanged(String query) {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 350), () {
      _fetchMembers(query);
    });
  }

  Future<void> _fetchMembers(String search) async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final base = Uri.parse('http://192.168.6.144:8000/api/list/');

      final uri = search.isEmpty ? base : base.replace(queryParameters: {"search": search});

      final response = await http.get(
        uri,
        headers: {
          "Accept": "application/json",
          "Authorization": "Token $token",
        },
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(utf8.decode(response.bodyBytes));

        final List<dynamic> items = decoded is List ? decoded : (decoded["results"] ?? []);

        if (mounted) {
          setState(() => _members = items);
        }
      } else {
        if (mounted) {
          setState(() => _error = "HTTP ${response.statusCode}: ${response.body}");
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _error = e.toString());
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    memberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: memberController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Search member",
            suffixIcon: Icon(Icons.search),
          ),
        ),
        const SizedBox(height: 12),

        if (_loading) const LinearProgressIndicator(),

        if (_error != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_error!, style: const TextStyle(color: Colors.red)),
          ),

        Expanded(
          child: ListView.builder(
            itemCount: _members.length,
            itemBuilder: (context, i) {
              final m = _members[i];

              final name = m['username'].toString();

              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(name),
              );
            },
          ),
        ),
      ],
    );
  }
}
