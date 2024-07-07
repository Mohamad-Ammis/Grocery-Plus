import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'home_products_lit.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: CustomAppBar(),
      body: Column(
        children: [
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFF87DD39),
              child: Icon(
                Icons.location_on,
                color: Colors.white,
              ),
            ),
            title: Text(
              'Your Location',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 11,
                  fontWeight: FontWeight.normal),
            ),
            subtitle: Text(
              '32 Llanberis Close, Tonteg, CF38 1HR',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          Expanded(child: HomeProductsList()),
        ],
      ),
    );
  }
}
