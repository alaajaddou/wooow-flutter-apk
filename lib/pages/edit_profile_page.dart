import 'package:flutter/material.dart';
import 'package:wooow_supermarket/utils/custom_colors.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Edit Profile",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 24,
            ),
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          CustomColors.EDIT_PROFILE_PIC_FIRST_GRADIENT,
                          CustomColors.EDIT_PROFILE_PIC_SECOND_GRADIENT
                        ])),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 120,
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                            icon: const Icon(
                              Icons.image,
                              color: Colors.white,
                            ),
                            onPressed: () {}),
                        const Text(
                          "Choose Image",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  border: border,
                  hintText: "Name",
                  focusedBorder: border.copyWith(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              margin: EdgeInsets.only(left: 12, right: 12, top: 24),
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    border: border,
                    hintText: "Email",
                    focusedBorder: border.copyWith(
                        borderSide: BorderSide(color: Colors.blue))),
              ),
              margin: EdgeInsets.only(left: 12, right: 12, top: 12),
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    border: border,
                    hintText: "Mobile Number",
                    focusedBorder: border.copyWith(
                        borderSide: BorderSide(color: Colors.blue))),
              ),
              margin: EdgeInsets.only(left: 12, right: 12, top: 12),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 48, right: 48),
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {},
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, color: Colors.grey));
}