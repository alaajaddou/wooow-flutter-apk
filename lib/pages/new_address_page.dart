import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/models/address.dart';
import 'package:wooow_supermarket/pages/addresses_page.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/global.dart';
import 'package:wooow_supermarket/utils/route_generator.dart';

class NewAddressPage extends StatefulWidget {
  late NewAddressArguments args;

  NewAddressPage({Key? key, required this.args}) : super(key: key);

  @override
  State<NewAddressPage> createState() => _NewAddressPageState();
}

class _NewAddressPageState extends State<NewAddressPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _city;

  String? _village;

  String? _phone;

  String? _mobile;

  String? _address;

  String? _building;

  bool _isSelected = false;

  bool get isSelected => _isSelected;

  set isSelected(bool isSelected) {
    _isSelected = isSelected;
  }

  BuildContext? _context;

  @override
  void initState() {
    isSelected = widget.args.addressObj?.isDefault == true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: CustomAppBar(isHome: false),
      body: ListView(padding: const EdgeInsets.all(24), children: [
        Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildCityElement(),
              _buildVillageElement(),
              _buildPhoneElement(),
              _buildMobileElement(),
              _buildAddressElement(),
              _buildBuildingElement(),
              _buildIsDefaultElement(),
            ],
          ),
        )
      ]),
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
    _formKey.currentState?.save();

    dynamic newAddress = {'city': _city, 'village': _village, 'phone': _phone, 'mobile': _mobile, 'address': _address, 'building': _building, 'is_default': _isSelected};
    if (widget.args.addressObj != null) {
      newAddress['id'] = widget.args.addressObj?.id;
    }

    ApiBaseHelper().post('update-create-address', newAddress).then((response) {
      if (response['message'] == 'Created' || response['message'] == 'Updated') {
        dynamic addressObj = response['address'];
        Alert(
            context: _context!,
            title: 'نجاح',
            desc: 'تم انشاء / تعديل العنوان',
            image: const Image(
              height: 50,
              image: AssetImage("assets/images/success.png"),
            ),
            buttons: [
              DialogButton(
                child: const Text(
                  "حسناً",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  if (widget.args.fromCheckout) {
                    Address address = Address(
                        id: addressObj['id'],
                        userId: auth.user.id,
                        isDefault: true,
                        address: addressObj['address'],
                        building: addressObj['building'],
                        city: addressObj['city'],
                        mobile: addressObj['mobile'],
                        phone: addressObj['phone'],
                        village: addressObj['village'],
                        deletable: addressObj['deletable']);
                    setDefaultAddress(_context!, address);
                    setDefaultAddress(_context!, address);
                    if (!RouteGenerator.checkIfSameRoute(_context!, 'checkout')) {
                      Navigator.of(_context!).pushReplacementNamed('checkout');
                    }
                    // Navigator.of(_context!).pushReplacementNamed('checkout');
                  } else {
                    if (!RouteGenerator.checkIfSameRoute(_context!, 'account')) {
                      Navigator.of(_context!).pushReplacementNamed('account');
                    }
                    // Navigator.of(_context!).pushReplacementNamed('account');
                  }
                },
                color: getPrimaryColor(),
              ),
            ]).show();
        // showSuccessDialog(_context!, , );
      } else {
        Alert(
            context: _context!,
            title: 'خطأ',
            desc: 'حصل خطأ اثناء انشاء / تعديل العنوان',
            image: const Image(
              height: 50,
              image: AssetImage("assets/images/error.png"),
            ),
            buttons: [
              DialogButton(
                child: const Text(
                  "حسناً",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () => Navigator.pop(_context!, false),
                color: getPrimaryColor(),
              ),
            ]).show();
      }
    });
  }

  _buildCityElement() {
    return TextFormField(
      initialValue: widget.args.addressObj?.city,
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
      initialValue: widget.args.addressObj?.village,
      decoration: const InputDecoration(labelText: 'القرية', hintTextDirection: TextDirection.rtl),
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
      initialValue: widget.args.addressObj?.phone,
      decoration: const InputDecoration(labelText: 'الهاتف', hintTextDirection: TextDirection.rtl),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'هذا الحقل مطلوب!';
        }

        if (double.tryParse(value) == null || value.length != 9) {
          return 'هذا الحقل لابد من ان يكون 9 ارقام';
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
      initialValue: widget.args.addressObj?.mobile,
      decoration: const InputDecoration(labelText: 'رقم الجوال', hintTextDirection: TextDirection.rtl),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'هذا الحقل مطلوب!';
        }

        if (double.tryParse(value) == null || value.length != 10) {
          return 'هذا الحقل لابد من ان يكون 10 ارقام';
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
      initialValue: widget.args.addressObj?.address,
      decoration: const InputDecoration(labelText: 'العنوان', hintTextDirection: TextDirection.rtl),
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
      initialValue: widget.args.addressObj?.building,
      decoration: const InputDecoration(labelText: 'العمارة', hintTextDirection: TextDirection.rtl),
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

  Widget _buildHeader() {
    return const Center(
      child: Icon(
        Icons.map_outlined,
        color: Colors.grey,
        size: 150,
      ),
    );
  }

  Widget _buildIsDefaultElement() {
    return InputChip(
      selected: isSelected,
      selectedColor: Colors.lightGreen.shade300,
      label: const Text('تعيين كافتراضي'),
      labelStyle: const TextStyle(color: Colors.white),
      backgroundColor: Colors.red,
      onSelected: (value) {
        setState(() {
          isSelected = value;
        });
      },
    );
  }
}

class NewAddressArguments {
  bool fromCheckout = false;
  Address? addressObj;

  NewAddressArguments();
}
