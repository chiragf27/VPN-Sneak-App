import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vpn_basic_project/controllers/location_controller.dart';
import 'package:vpn_basic_project/main.dart';
import 'package:vpn_basic_project/widgets/vpn_card.dart';

class LocationScreen extends StatelessWidget {
LocationScreen({super.key});
final _controller = LocationController();
  @override
  Widget build(BuildContext context) {
    if(_controller.vpnList.isEmpty) _controller.getVpnData();

    return Obx( 
      () => 
      Scaffold(
        //appbar
        appBar: AppBar(
          title: Text('VPN Locations (${_controller.vpnList.length})'), 
          actions: [],
          ),

          //refresh button
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10),
            child: FloatingActionButton(onPressed: () =>
              _controller.getVpnData(),
            child: Icon(CupertinoIcons.refresh),),
          ),
    
          body: _controller.isLoading.value 
          ? _loadingWidget(context)
          : _controller.vpnList.isEmpty 
          ? _noVPNFound() 
          : _vpnData()
          ),
    );

  }

  _vpnData() => ListView.builder(
    itemCount: _controller.vpnList.length,
    physics: BouncingScrollPhysics(),
    padding: EdgeInsets.only(top: mq.height * .015, 
    bottom: mq.height * .1, 
    left: mq.width * .04, 
    right: mq.width * .04),
    itemBuilder: (ctx, i) => VpnCard(vpn: _controller.vpnList[i]));

  //Lottie Animation Widget
  _loadingWidget(context) => 
  SizedBox(
    width: double.infinity, 
    height: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      //Lottie Animation 
      LottieBuilder.asset('assets/lottie/loading.json', 
      width: mq.width * .7,),
      //Text 
      Text('Loading VPNs 🌏', 
      style: TextStyle(fontSize: 18, 
      color: Theme.of(context).lightText, 
      fontWeight: FontWeight.bold
      ),
      )
    ],
    ),
    );

    _noVPNFound() => Center(
      child: Text('VPNs Not Found! 🌐', 
        style: TextStyle(fontSize: 18, 
        color: Colors.black54, 
        fontWeight: FontWeight.bold
        ),
        ),
    );
}