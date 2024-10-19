import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Center',
            style: GoogleFonts.lato(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            ProfileCard(),
            SizedBox(height: 20),
            IconMenu(),
            SizedBox(height: 20),
            SettingsMenu(),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/qais.jpg'),
                  radius: 30,
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Qais Amro',
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'A trendsetter',
                      style:
                          GoogleFonts.lato(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.edit, color: Colors.white),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoColumn(label: 'Collect', value: '846'),
                InfoColumn(label: 'Attention', value: '51'),
                InfoColumn(label: 'Track', value: '267'),
                InfoColumn(label: 'Coupons', value: '39'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoColumn extends StatelessWidget {
  final String label;
  final String value;

  InfoColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.lato(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class IconMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButtonWidget(icon: FontAwesomeIcons.wallet, label: 'Wallet'),
        IconButtonWidget(icon: FontAwesomeIcons.truck, label: 'Delivery'),
        IconButtonWidget(
            icon: FontAwesomeIcons.solidEnvelope,
            label: 'Message',
            notificationCount: 2),
        IconButtonWidget(
            icon: FontAwesomeIcons.conciergeBell, label: 'Service'),
      ],
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final int? notificationCount;

  IconButtonWidget(
      {required this.icon, required this.label, this.notificationCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(icon, size: 30, color: Colors.black),
              ),
            ),
            if (notificationCount != null && notificationCount! > 0)
              Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Text(
                    '$notificationCount',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 5),
        Text(label, style: GoogleFonts.lato(fontSize: 12)),
      ],
    );
  }
}

class SettingsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsMenuItem(
            icon: FontAwesomeIcons.mapMarkerAlt,
            label: 'Address',
            subtitle: 'Ensure your harvesting address',
            iconColor: Colors.green),
        SettingsMenuItem(
            icon: FontAwesomeIcons.lock,
            label: 'Privacy',
            subtitle: 'System permission change',
            iconColor: Colors.blue),
        SettingsMenuItem(
            icon: FontAwesomeIcons.cogs,
            label: 'General',
            subtitle: 'Basic functional settings',
            iconColor: Colors.orange),
        SettingsMenuItem(
            icon: FontAwesomeIcons.bell,
            label: 'Notification',
            subtitle: 'Take over the news in time',
            iconColor: Colors.red),
      ],
    );
  }
}

class SettingsMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final Color iconColor;

  SettingsMenuItem(
      {required this.icon,
      required this.label,
      required this.subtitle,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 30, color: iconColor),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: GoogleFonts.lato(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Text(subtitle,
                    style:
                        GoogleFonts.lato(fontSize: 12, color: Colors.black54)),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
