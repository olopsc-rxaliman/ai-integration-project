import "package:flutter/material.dart";

class DeveloperTile extends StatelessWidget {
  final String name;
  final String role;

  const DeveloperTile(
    this.name,
    this.role,
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          role,
          style: const TextStyle(
            color: Colors.black54,
          )
        ),
      ],
    );
  }
}

class DeveloperDialog extends StatelessWidget {
  const DeveloperDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Opacity(
              opacity: 0.15,
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                child: Image.asset(
                  'lib/resources/images/main-app-logo-transparent.png',
                  scale: 4,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: IntrinsicHeight(
              child: Column(
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
                  const Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          DeveloperTile("Rovic Xavier Aliman", "Lead Developer"),
                          SizedBox(height: 5),
                          DeveloperTile("June Jelo Alcantara", "Associate Developer"),
                          SizedBox(height: 5),
                          DeveloperTile("Arianne Cielo", "Associate Developer"),
                          SizedBox(height: 5),
                          DeveloperTile("Terd Inocentes", "Associate Developer"),
                          SizedBox(height: 5),
                          DeveloperTile("Maverick Malala", "Associate Developer"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
