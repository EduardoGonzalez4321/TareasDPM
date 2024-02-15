import 'dart:convert';

import 'package:crypto_look/crypto_list.dart';
import 'package:crypto_look/data/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> criptos = [];

  @override
  void initState() {
    criptos = jsonDecode(CRYPTO_EXCHANGES);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto look'),
      ),
      body: CryptoList(criptos: criptos),
    );
  }
}
