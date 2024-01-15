import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:url_launcher/link.dart';
import 'package:vpn_basic_project/main.dart';
import 'package:url_launcher/url_launcher.dart';

//card to represent status in home screen
class DeveloperCard extends StatelessWidget {

  _launchurl() async{
    const url = 'youtube.com/@vpnsneak';
    if (await canLaunchUrl(url as Uri)){
      await launchUrl(url as Uri);
    }
    else{
      throw 'could not launch $url';
    }
  }

  final String title;

  const DeveloperCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mq.width * .37,

      child: Center(
        child: Link(
        target: LinkTarget.blank,
        uri: Uri.parse('youtube.com/@vpnsneak'),
        builder: (BuildContext context, followLink) { 
          return ElevatedButton(
          onPressed: () async {
            final url = Uri.parse('youtube.com/@vpnsneak');
            if (await canLaunchUrl(url)){
              launchUrl(url);
            }
          },
          style: ElevatedButton.styleFrom(
              fixedSize: Size(130, 57),
              backgroundColor: Theme.of(context).lightColor, //background color of button
              side: BorderSide(
                width:3, 
                color:Theme.of(context).lightColor), //border width and color
              elevation: 0, //elevation of button
              shape: RoundedRectangleBorder( //to set border radius to button
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(20) //content padding inside button
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.w500
              ),) 
          );
        }
        ),
      )
      );
  }
}