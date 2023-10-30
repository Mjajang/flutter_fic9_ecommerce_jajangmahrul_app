import 'package:flutter/material.dart';
import 'package:flutter_fic9_ecommerce_jajangmahrul_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_fic9_ecommerce_jajangmahrul_app/persentation/auth/login_page.dart';

import '../../common/components/button.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Button.filled(
          onPressed: () async {
            await AuthLocalDatasource().removeAuthData();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const LoginPage();
                },
              ),
            );
          },
          label: 'Logout',
        ),
      ),
    );
  }
}
