import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../generated/l10n.dart';
import '../controllers/profile_controller.dart';
import '../repository/user_repository.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends StateMVC<DrawerWidget> {
  //ProfileController _con;

  _DrawerWidgetState() : super(ProfileController()) {
    //_con = controller;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/Pages', arguments: 0);
            },
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).hintColor.withOpacity(0.1),
//              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35)),
              ),
              accountName: Text(
                '${currentUser.value.name}',
                style: Theme.of(context).textTheme.headline6,
              ),
              accountEmail: Text(
                '${currentUser.value.email}',
                style: Theme.of(context).textTheme.caption,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                backgroundImage: NetworkImage(currentUser.value.image),
              ),
            ),
          ),

          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/OrderHistory');
            },
            leading: Icon(
              Icons.history,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              S.of(context).orders_history,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/wallet', arguments: 2);
            },
            leading: Icon(
              Icons.account_balance_wallet_rounded,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              'Wallet',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        /**  ListTile(
            onTap: () {
              if (Theme.of(context).brightness == Brightness.dark) {
               setBrightness(Brightness.light);
                setting.value.brightness.value = Brightness.light;
              } else {
                setting.value.brightness.value = Brightness.dark;
                setBrightness(Brightness.dark);
              }
              // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
              setting.notifyListeners();
            },
            leading: Icon(
              Icons.brightness_6,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              Theme.of(context).brightness == Brightness.dark ? S.of(context).light_mode : S.of(context).dark_mode,
              style: Theme.of(context).textTheme.headline1,
            ),
          ), */
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/Languages');
            },
            leading: Icon(
              Icons.translate,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              S.of(context).languages,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/Settings');
            },
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              S.of(context).settings,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          ListTile(
            onTap: () {


              logout().then((value) {
                Fluttertoast.showToast(
                  msg: "${S.of(context).logout} ${S.of(context).successfully}",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                );
                Navigator.of(context).pushNamedAndRemoveUntil('/Login', (Route<dynamic> route) => false);
              });
            },
            leading: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              S.of(context).logout,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ],
      ),
    );
  }
}
