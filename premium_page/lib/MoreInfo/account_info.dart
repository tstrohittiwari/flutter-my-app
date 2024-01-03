import 'package:flutter/material.dart';
import 'package:premium_page/MoreInfo/extra_services.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ExtraServices(
      serviceName: "Account Info",
      serviceIcon: Icons.account_circle,
      onTapHandler: CustomTapHandler(
            (BuildContext context) async {
          // Handle onTap logic here
          await showModalBottomSheet<void>(
            elevation: 10,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 18,
            ),
            context: context,
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 229, 107),
                ),
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
