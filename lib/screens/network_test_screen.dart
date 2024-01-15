import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/apis/apis.dart';
import 'package:vpn_basic_project/models/ip_details.dart';
import 'package:vpn_basic_project/widgets/developer_card.dart';

import '../main.dart';
import '../models/network_data.dart';
import '../widgets/home_card.dart';
import '../widgets/network.dart';

class NetworkTestScreen extends StatelessWidget {
  const NetworkTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ipData = IPDetails.fromJson({}).obs;
    APIs.getIPDetails(ipData: ipData);

    return Scaffold(
      appBar: AppBar(title: Text('VPN Profile'),),
      //refresh button
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 1, right: 1),
            child: FloatingActionButton(
              onPressed: () {
                ipData.value = IPDetails.fromJson({});
                APIs.getIPDetails(ipData: ipData);
              },
            child: Icon(CupertinoIcons.refresh),),
          ),
      body: Obx(
        () => ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            left: mq.width * .04, 
            right: mq.width * .04, 
            top: mq.height * .01, 
            bottom: mq.height * .1),
          children: [
                //ip
                NetworkCard(
                    data: NetworkData(
                        title: 'IP Address',
                        subtitle: ipData.value.query,
                        icon: Icon(CupertinoIcons.location_solid,
                            color: Colors.blue))),
      
                //pin code
                NetworkCard(
                    data: NetworkData(
                        title: 'Pin-code',
                        subtitle: ipData.value.zip,
                        icon: Icon(CupertinoIcons.compass,
                            color: Colors.green))),
      
                //location
                NetworkCard(
                    data: NetworkData(
                        title: 'Location',
                        subtitle: ipData.value.country.isEmpty ? 'Fetching...' : '${ipData.value.city}, ${ipData.value.regionName}, ${ipData.value.country}',
                        icon: Icon(CupertinoIcons.location, color: Colors.redAccent))),
               
                //isp
                NetworkCard(
                    data: NetworkData(
                        title: 'Internet Provider',
                        subtitle: ipData.value.isp,
                        icon: Icon(Icons.business, color: Colors.orange))),
      
      
                //timezone
                NetworkCard(
                    data: NetworkData(
                        title: 'Timezone',
                        subtitle: ipData.value.timezone,
                        icon: Icon(CupertinoIcons.time, color: Colors.blueGrey))),

                //developers text 
                Padding(
                  padding: const EdgeInsets.only(
                      top: 25,
                      bottom: 20
                  ),
                  child: Center(
                    child: Text(
                      'MORE FROM TEAM 🤝 BUDDY',
                      style: TextStyle(
                        color: Theme.of(context).lightText, 
                        fontSize: 16, 
                        fontWeight: FontWeight.w500, 
                        
                      ),
                      
                      ),
                  ),
                ),

                //developers

                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DeveloperCard(title: 'Sneak 2.O'),
                    DeveloperCard(title: 'Sneak Node',)
                  ],
                ), 
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     DeveloperCard(title: 'Sneak Web',)
                  ],
                ),

                //developers text 
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 15
                  ),
                  child: Center(
                    child: Text(
                      'DEVELOPERS 🧑🏻‍💻',
                      style: TextStyle(
                        color: Theme.of(context).lightText, 
                        fontSize: 16, 
                        fontWeight: FontWeight.w500, 
                        
                      ),
                      
                      ),
                  ),
                ),

                //developers text 
                Padding(
                  padding: const EdgeInsets.only(
                      top: .005,
                      bottom: .05
                  ),
                  child: Center(
                    child: Text(
                      'Chirag Ferwani | Yash Chavan |',
                      style: TextStyle(
                        color: Theme.of(context).lightText, 
                        fontSize: 16, 
                        fontWeight: FontWeight.w500, 
                        
                      ),
                      
                      ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      top: .05,
                      bottom: .05
                  ),
                  child: Center(
                    child: Text(
                      'Nitanshu Bhor | Atharva Kakade ',
                      style: TextStyle(
                        color: Theme.of(context).lightText, 
                        fontSize: 16, 
                        fontWeight: FontWeight.w500, 
                        
                      ),
                      
                      ),
                  ),
                )

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     DeveloperCard(
                //     title: 'Chirag Ferwani', 
                //     icon: ClipOval( 
                //       child: SizedBox.fromSize( 
                //           size: Size.fromRadius(30), // Image radius 
                //           child: Image.asset('assets/images/chirag.png', fit: BoxFit.cover), 
                //       ), 
                //   ),
                //     ),
                //     DeveloperCard(
                //     title: 'Nitanshu Bhor', 
                //     icon: ClipOval( 
                //       child: SizedBox.fromSize( 
                //           size: Size.fromRadius(30), // Image radius 
                //           child: Image.asset('assets/images/nitanshu.png', fit: BoxFit.cover), 
                //       ), 
                //   ),
                //     ),
                    
                //   ],
                // ),
                // SizedBox(height: 10),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     DeveloperCard(
                //     title: 'Yash Chavan', 
                //     icon: ClipOval( 
                //       child: SizedBox.fromSize( 
                //           size: Size.fromRadius(30), // Image radius 
                //           child: Image.asset('assets/images/yash.png', fit: BoxFit.cover), 
                //       ), 
                //   ),
                //     ),
                //     DeveloperCard(
                //     title: 'Atharva Kakade', 
                //     icon: ClipOval( 
                //       child: SizedBox.fromSize( 
                //           size: Size.fromRadius(30), // Image radius 
                //           child: Image.asset('assets/images/atharva.png', fit: BoxFit.cover), 
                //       ), 
                //   ),
                //     ),
                    
                //   ],
                // ),

              ],
        ),
      ),
    );
  }
}