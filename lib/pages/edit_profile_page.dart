import 'package:flutter/material.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_border.dart';
import 'package:wooow_supermarket/utils/custom_colors.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/custom_text_style.dart';
import 'package:wooow_supermarket/utils/custom_utils.dart';
import 'package:wooow_supermarket/utils/global.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  // late PickedFile imageFile;

  // void _onImageButtonPressed(BuildContext context) async {
  //   final pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.gallery ,
  //   );
  //   setState(() {
  //     print(pickedFile!.path);
  //     imageFile = pickedFile;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isHome: false),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 24,
              ),
              Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: NetworkImage(Global.storagePath + (auth.user.imagePath != null ? auth.user.imagePath : 'users/default.png'))),
                          gradient: LinearGradient(colors: [CustomColors.editProfilePicFirstGradient, CustomColors.editProfilePicSecondGradient])),
                    ),
                  ),
                ],
              ),
              Utils.getSizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                    child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                      border: CustomBorder.enabledBorder,
                      labelText: "الاسم",
                      focusedBorder: CustomBorder.focusBorder,
                      errorBorder: CustomBorder.errorBorder,
                      enabledBorder: CustomBorder.enabledBorder,
                      labelStyle: CustomTextStyle.textFormFieldMedium.copyWith(fontSize: MediaQuery.of(context).textScaleFactor * 16, color: Colors.black),
                      floatingLabelBehavior: FloatingLabelBehavior.auto),
                )),
              ),
              Utils.getSizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                      border: CustomBorder.enabledBorder,
                      labelText: "البريد الالكتروني",
                      focusedBorder: CustomBorder.focusBorder,
                      errorBorder: CustomBorder.errorBorder,
                      enabledBorder: CustomBorder.enabledBorder,
                      labelStyle: CustomTextStyle.textFormFieldMedium.copyWith(fontSize: MediaQuery.of(context).textScaleFactor * 16, color: Colors.black),
                      floatingLabelBehavior: FloatingLabelBehavior.auto),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 48, right: 48),
                child: ElevatedButton(
                  style: getButtonStyle(),
                  onPressed: () {
                    // _saveAction();
                  },
                  child: const Text(
                    "تعديل",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              )
            ],
          )),
      bottomNavigationBar: const CustomNavigator(),
    );
  }

  var border = const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4)), borderSide: BorderSide(width: 1, color: Colors.grey));

  // void _saveAction() {
  //   String name = nameController.text;
  //   String email = emailController.text;
  //   dynamic body = {'name': name, 'email': email};
  //   ApiBaseHelper().put('edit-user', body).then((result) {
  //     if (result['statusCode'] == 223) {
  //       auth.prepareUser(result['user'], 'email').then((user) => auth.user = user);
  //     }
  //   });
  // }
}
