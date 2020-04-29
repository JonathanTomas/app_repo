import 'package:cursos/constants/appColors.dart';
import 'package:cursos/constants/fontStyles.dart';
import 'package:cursos/services/fetchUserData.dart';
import 'package:cursos/widgets/sideDrawer/sideDrawerItem.dart';
import 'package:cursos/widgets/uiElements/darkModeSwitch.dart';
import 'package:cursos/widgets/userWidgets/userProfileImg.dart';
import 'package:flutter/material.dart';

class SideDrawer extends Drawer {
  const SideDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.25,
      height: MediaQuery.of(context).size.height,
      color: primaryColor,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 40, right: 30, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/profile'),
                  child: UserProfileImg(
                    radius: 40.0,
                  ),
                ),
                Container(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Hello, ',
                        style: authorUserName,
                      ),
                      FetchUserData(
                        field: 'displayName',
                        style: authorUserName,
                      ),
                      Text('  '),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: secondaryColor,
                        size: 17,
                      ),
                    ],
                  ),
                ),
                Divider(),
                SideDrawerItem(
                    icon: Icons.settings,
                    text: 'Settings',
                    action: () {
                      Navigator.pushNamed(context, '/settings');
                    }),
                Divider(),
                SideDrawerItem(
                  icon: Icons.stars,
                  text: 'Rate us',
                ),
                Divider(),
                SideDrawerItem(
                  icon: Icons.shopping_cart,
                  text: 'Premium',
                ),
              ],
            ),
          ),
          Positioned(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Switch brightness ',
                      style: drawerItem,
                    ),
                    DarkModeSwitch(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
