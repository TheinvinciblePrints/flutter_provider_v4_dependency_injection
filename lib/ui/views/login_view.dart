import 'package:flutter/material.dart';
import 'package:flutterprovidersample/core/constants/app_contstants.dart';
import 'package:flutterprovidersample/core/viewmodels/login_view_model.dart';
import 'package:flutterprovidersample/ui/shared/app_colors.dart';
import 'package:flutterprovidersample/ui/views/base_widget.dart';
import 'package:flutterprovidersample/ui/widgets/form_loader.dart';
import 'package:flutterprovidersample/ui/widgets/login_header.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(authenticationService: Provider.of(context)),
      child: LoginHeader(controller: _controller),
      builder: (context, model, child) => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(),
        backgroundColor: backgroundColor,
        body: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                child,
                FlatButton(
                  color: Colors.white,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () async {
                    var loginSuccess = await model.login(_controller.text);
                    if (loginSuccess) {
                      Navigator.pushNamed(context, RoutePaths.Home);
                    }
                  },
                ),
              ],
            ),
            model.busy ? FormLoader() : Container(),
          ],
        ),
      ),
    );
  }

  _showDialog() {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Builder(builder: (BuildContext context) {
          return MaterialApp(
            home: AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Hello from flutter'),
              content: Text('That is the transparent dialog'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
      },
    );
  }

  void _displaySnackBar() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Logging In...'),
            CircularProgressIndicator(),
          ],
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
