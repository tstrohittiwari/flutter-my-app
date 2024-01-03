import 'package:flutter/material.dart';


class CustomTapHandler {
  final Function(BuildContext) onTap;

  CustomTapHandler(this.onTap);

  void handleTap(BuildContext context) {
    onTap(context);
  }
}


class ExtraServices extends StatelessWidget {
  const ExtraServices({
    super.key,
    required this.serviceName,
    required this.serviceIcon,
    required this.onTapHandler,
  });

  final String serviceName;
  final IconData serviceIcon;
  final CustomTapHandler onTapHandler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapHandler.handleTap(context);
      },
      child: Card(
        color: Color.fromARGB(255, 52, 23, 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(
                serviceIcon,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Text(serviceName, style: TextStyle(fontSize: 16,color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
