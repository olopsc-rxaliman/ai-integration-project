import "package:flutter/material.dart";

class DeveloperDialog extends StatelessWidget {
  const DeveloperDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Developers",
                    style: TextStyle(fontSize: 20),
                  ),
                ),  
              ],
            ),
            const Divider(),
            const ListTile(
              trailing: Icon(Icons.person),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rovic Xavier Aliman"),
                  Text("Lead Developer", style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            const ListTile(
              trailing: Icon(Icons.person),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("June Jelo Alcantara"),
                  Text("Associate Developer", style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            const ListTile(
              trailing: Icon(Icons.person),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Arianne Cielo"),
                  Text("Associate Developer", style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            const ListTile(
              trailing: Icon(Icons.person),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Terd Inocentes"),
                  Text("Associate Developer", style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            const ListTile(
              trailing: Icon(Icons.person),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Maverick Malala"),
                  Text("Associate Developer", style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}