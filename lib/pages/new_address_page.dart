import 'package:flutter/material.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';

class NewAddressPage extends StatelessWidget {
  NewAddressPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _city;
  String? _village;
  String? _phone;
  String? _mobile;
  String? _address;
  String? _building;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isHome: false),
      body: Container(
          margin: const EdgeInsets.all(24.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCityElement(),
                _buildVillageElement(),
                _buildPhoneElement(),
                _buildMobileElement(),
                _buildAddressElement(),
                _buildBuildingElement(),
              ],
            ),
          )),
      bottomNavigationBar: const CustomNavigator(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {_saveAddress()},
          child: const Icon(
            Icons.save,
            color: Colors.white,
            size: 35.0,
          )),
    );
  }

  _saveAddress() {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
  }

  _buildCityElement() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'المدينة', hintTextDirection: TextDirection.rtl),

      validator: (String? value) {
        if (value!.isEmpty) {
          return 'هذا الحقل مطلوب!';
        }
        return null;
      },
      onSaved: (String? value) {
        _city = value;
      },
    );
  }

  _buildVillageElement() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'القرية', hintTextDirection: TextDirection.rtl),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'هذا الحقل مطلوب!';
        }
        return null;
      },
      onSaved: (String? value) {
        _village = value;
      },
    );
  }

  _buildPhoneElement() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'الهاتف', hintTextDirection: TextDirection.rtl),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'هذا الحقل مطلوب!';
        }
        return null;
      },
      onSaved: (String? value) {
        _phone = value;
      },
    );
  }

  _buildMobileElement() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'رقم الجوال', hintTextDirection: TextDirection.rtl),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'هذا الحقل مطلوب!';
        }
        return null;
      },
      onSaved: (String? value) {
        _mobile = value;
      },
    );
  }

  _buildAddressElement() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'العنوان', hintTextDirection: TextDirection.rtl),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'هذا الحقل مطلوب!';
        }
        return null;
      },
      onSaved: (String? value) {
        _address = value;
      },
    );
  }

  _buildBuildingElement() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'العمارة', hintTextDirection: TextDirection.rtl),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'هذا الحقل مطلوب!';
        }
        return null;
      },
      onSaved: (String? value) {
        _building = value;
      },
    );
  }
}
