import "package:ai_integration_project/components/developer_dialog.dart";
import "package:flutter/material.dart";

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/resources/images/gemini.png',
                    scale: 8,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "AI Learn",
                        style: TextStyle(
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF00adff),
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Powered by: ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          const Text(
                            "Google Gemini ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.asset(
                            'lib/resources/images/gemini.png',
                            scale: 17,
                            isAntiAlias: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.developer_mode,
                color: Colors.black87,
              ),
              title: const Text(
                "Developers",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const DeveloperDialog(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}