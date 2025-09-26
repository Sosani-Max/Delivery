import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<Map<String, String>> orderList = [
    {"item": "อาหารกล่อง", "recipient": "คุณสมชาย", "status": "รอรับพัสดุ"},
    {"item": "พัสดุแฟชั่น", "recipient": "คุณสายฝน", "status": "กำลังส่ง"},
    {"item": "หนังสือ", "recipient": "คุณจันทร์", "status": "ส่งเสร็จ"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User"),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade100,
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: orderList.length,
        itemBuilder: (context, index) {
          final item = orderList[index];
          return UserOrderCard(
            itemName: item["item"]!,
            recipient: item["recipient"]!,
            status: item["status"]!,
          );
        },
      ),
    );
  }
}

class UserOrderCard extends StatelessWidget {
  final String itemName;
  final String recipient;
  final String status;

  const UserOrderCard({
    super.key,
    required this.itemName,
    required this.recipient,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;

    switch (status) {
      case "รอรับพัสดุ":
        statusColor = Colors.orange;
        break;
      case "กำลังส่ง":
        statusColor = Colors.blue;
        break;
      case "ส่งเสร็จ":
        statusColor = Colors.green;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text("ผู้รับ: $recipient"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
