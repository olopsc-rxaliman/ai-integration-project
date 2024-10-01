import "package:flutter/material.dart";

class AppButtonWidget extends StatelessWidget {
  final String title;
  final Widget icon;
  final Widget nextPage;

  const AppButtonWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          splashFactory: InkRipple.splashFactory,
          borderRadius: BorderRadius.circular(10),
          highlightColor: Colors.black.withOpacity(0.05),
          splashColor: Colors.black.withOpacity(0.1),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => nextPage));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 12.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    color: Color(0xFF00adff),
                    fontFamily: "LeagueSpartan",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}