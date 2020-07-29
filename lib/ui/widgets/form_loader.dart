import 'package:flutter/material.dart';

class FormLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.3,
          child: ModalBarrier(
            dismissible: false,
            color: Colors.black,
          ),
        ),
        AlertDialog(
          backgroundColor: Colors.white,
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(
                width: 20,
              ),
              Text('Loading...'),
            ],
          ),
        ),
      ],
    );
  }
}
