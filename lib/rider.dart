import 'package:flutter/material.dart';

class RiderPage extends StatefulWidget {
  const RiderPage({super.key});

  @override
  State<RiderPage> createState() => _RiderPageState();
}

class _RiderPageState extends State<RiderPage> {
  List<Map<String, String>> deliveryList = [
    {
      "recipient": "คุณสมชาย",
      "address": "123 ถนนสุขุมวิท",
      "phone": "0812345678",
      "status": "รอรับพัสดุ",
    },
    {
      "recipient": "คุณสมศรี",
      "address": "456 ถนนรัชดา",
      "phone": "0898765432",
      "status": "กำลังส่ง",
    },
    {
      "recipient": "คุณจันทร์",
      "address": "789 ถนนพระราม 9",
      "phone": "0861122334",
      "status": "ส่งเสร็จ",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rider"),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade100,
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: deliveryList.length,
        itemBuilder: (context, index) {
          final item = deliveryList[index];
          return DeliveryCard(
            recipient: item["recipient"]!,
            address: item["address"]!,
            phone: item["phone"]!,
            status: item["status"]!,
            onActionPressed: () {
              setState(() {
                if (item["status"] == "รอรับพัสดุ") {
                  item["status"] = "กำลังส่ง";
                } else if (item["status"] == "กำลังส่ง") {
                  item["status"] = "ส่งเสร็จ";
                }
              });
            },
          );
        },
      ),
    );
  }
}

class DeliveryCard extends StatelessWidget {
  final String recipient;
  final String address;
  final String phone;
  final String status;
  final VoidCallback onActionPressed;

  const DeliveryCard({
    super.key,
    required this.recipient,
    required this.address,
    required this.phone,
    required this.status,
    required this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String buttonText;

    switch (status) {
      case "รอรับพัสดุ":
        statusColor = Colors.orange;
        buttonText = "รับพัสดุ";
        break;
      case "กำลังส่ง":
        statusColor = Colors.blue;
        buttonText = "ส่งแล้ว";
        break;
      case "ส่งเสร็จ":
        statusColor = Colors.green;
        buttonText = "เสร็จแล้ว";
        break;
      default:
        statusColor = Colors.grey;
        buttonText = "ดำเนินการ";
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
              recipient,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(address),
            const SizedBox(height: 5),
            Text("เบอร์: $phone"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
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
                ElevatedButton(
                  onPressed: status == "ส่งเสร็จ" ? null : onActionPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: statusColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(buttonText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
