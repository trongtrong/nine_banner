import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nine_banner/model/banner_model.dart';

class BannerView extends StatefulWidget {
  final String inventory;

  BannerView({this.inventory});

  @override
  _BannerViewState createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
  StreamController _userController;

  @override
  void initState() {
    _userController = StreamController();
    // nhận inventory và call api tại đây

    super.initState();
  }

  // loadDetails() async {
  //   Api().getUserInfo('horlaz229@gmail.com', '123456').then((res) async{
  //     print('LoadDetails of ${res.fname}');
  //     _userController.add(res);
  //     return res;
  //   });
  // }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userController.close();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _userController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error);
        }

        if (snapshot.hasData) {
          //xử lý view tại đây image ? json ? video
          return Container();
        }

        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return Text('No Posts');
        }

        return Container();
      },
    );
  }

  Widget buildHeaderBanner() => Container();

  Widget buildMediumBanner() => Container();

  Widget buildThinBanner() => Container();
}
