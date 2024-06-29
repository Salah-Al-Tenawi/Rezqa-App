// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SearchDropdown(),
//     );
//   }
// }

// class SearchDropdown extends StatefulWidget {
//   @override
//   _SearchDropdownState createState() => _SearchDropdownState();
// }

// class _SearchDropdownState extends State<SearchDropdown> {
//   List<String> _suggestions = [];
//   TextEditingController _controller = TextEditingController();
//   Timer? _debounce;

//   @override
//   void dispose() {
//     _controller.dispose();
//     _debounce?.cancel();
//     super.dispose();
//   }

//   void _onSearchChanged(String query) {
//     if (_debounce?.isActive ?? false) _debounce!.cancel();
//     _debounce = Timer(const Duration(milliseconds: 500), () {
//       if (query.isNotEmpty) {
//         _fetchSuggestions(query);
//       } else {
//         setState(() {
//           _suggestions = [];
//         });
//       }
//     });
//   }

//   Future<void> _fetchSuggestions(String query) async {
//     final response = await http.get(Uri.parse('https://example.com/api/search?query=$query'));
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       setState(() {
//         _suggestions = List<String>.from(data['results']);
//       });
//     } else {
//       // Handle the error
//       throw Exception('Failed to load suggestions');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search Dropdown'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _controller,
//               onChanged: _onSearchChanged,
//               decoration: InputDecoration(
//                 labelText: 'Search',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _suggestions.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(_suggestions[index]),
//                     onTap: () {
//                       // Handle the selection
//                       print('Selected: ${_suggestions[index]}');
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }










// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final ImagePicker _picker = ImagePicker();

//   Future<void> _pickImage() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

//     if (image != null) {
//       final File file = File(image.path);
//       final int sizeInBytes = await file.length();
//       final double sizeInMB = sizeInBytes / (1024 * 1024);

//       if (sizeInMB > 2) {
//         _showSizeWarning();
//       } else {
//         // تابع العملية (مثل عرض الصورة أو رفعها إلى السيرفر)
//       }
//     }
//   }

//   void _showSizeWarning() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('حجم الصورة كبير'),
//           content: Text('يجب أن يكون حجم الصورة أقل من 2 ميجابايت.'),
//           actions: <Widget>[
//             TextButton(
//               child: Text('موافق'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('اختيار صورة'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _pickImage,
//           child: Text('اختيار صورة من المعرض'),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: MyHomePage(),
//   ));
// }
