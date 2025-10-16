import 'package:flutter/material.dart';

class BusinessCardAppScreen extends StatelessWidget {
  const BusinessCardAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2b455f),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(400),
          //   child: Image.asset(
          //     "assets/images/free_p.jpg",
          //     height: 200,
          //     width: 200,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          const CircleAvatar(
            radius: 102,
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/images/free_p.jpg"),
            ),
          ),
          const Text(
            "Mohamed Gomaa",
            style: TextStyle(
              fontFamily: "Pacifico",
              fontSize: 32,
              color: Colors.white,
            ),
          ),
          const Text(
            "Flutter Developer",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff6c8090),
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(
            color: Color(0xff6c8090),
            indent: 30,
            endIndent: 30,
            height: 10,
            thickness: 1.2,
          ),

          Card(
            color: Colors.white,

            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: const ListTile(
              leading: Icon(Icons.call, size: 30, color: Color(0xFF2b455f)),
              title: Text("(+20) 1002418816", style: TextStyle(fontSize: 22)),
            ),
          ),

          Card(
            color: Colors.white,

            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: const ListTile(
              leading: Icon(Icons.mail, size: 30, color: Color(0xFF2b455f)),
              title: Text("20monagy@gmail.com", style: TextStyle(fontSize: 22)),
            ),
          ),
          // Container(
          //   padding: EdgeInsets.all(16),
          //   margin: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(8),
          //     color: Colors.white,
          //   ),
          //   child: Row(
          //     children: [
          //       Icon(Icons.call, size: 30, color: Color(0xFF2b455f)),
          //       SizedBox(width: 20),
          //       Text("(+20) 1002418816", style: TextStyle(fontSize: 22)),
          //     ],
          //   ),
          // ),
          // Container(
          //   padding: EdgeInsets.all(16),
          //   margin: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(8),
          //     color: Colors.white,
          //   ),
          //   child: Row(
          //     children: [
          //       Icon(Icons.mail, size: 30, color: Color(0xFF2b455f)),
          //       SizedBox(width: 20),
          //       Text("20monagy@gmail.com", style: TextStyle(fontSize: 22)),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
