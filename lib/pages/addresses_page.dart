import 'package:flutter/material.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/models/address.dart';
import 'package:wooow_supermarket/pages/new_address_page.dart';
import 'package:wooow_supermarket/utils/alert.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/global.dart';
import 'package:wooow_supermarket/utils/route_generator.dart';

class AddressesPage extends StatefulWidget {
  bool fromCheckout = false;

  AddressesPage({Key? key, required this.fromCheckout}) : super(key: key);

  @override
  _AddressesPageState createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isHome: false),
      body: FutureBuilder(
        future: getAddresses(),
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildAddresses(snapshot.data as List<dynamic>);
          }
          return Container();
        },
      ),
      bottomNavigationBar: const CustomNavigator(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {
                if (!RouteGenerator.checkIfSameRoute(context, 'new-address')) {Navigator.of(context).pushNamed('new-address', arguments: NewAddressArguments())}
              },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 35.0,
          )),
    );
  }

  Future<List<dynamic>> getAddresses() async {
    List<dynamic> addresses = [];
    var response = await ApiBaseHelper().get('addresses');
    if ((response['addresses'] as List<dynamic>).isNotEmpty) {
      addresses = response['addresses'];
    }
    return addresses;
  }

  Widget buildAddresses(List<dynamic> data) {
    if (data.isNotEmpty) {
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          Address address = Address(
              id: data[index]['id'],
              address: data[index]['address'],
              building: data[index]['building'],
              city: data[index]['city'],
              mobile: data[index]['mobile'],
              phone: data[index]['phone'],
              village: data[index]['village'],
              userId: data[index]['user_id'],
              isDefault: data[index]['is_default'] == 1,
              deletable: data[index]['deletable']);
          if (address.isDefault) {
            auth.address = address;
          }

          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  trailing: getDeleteIcon(address),
                  title: Text((address.city ?? '') + ' - ' + (address.village ?? '')),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text((address.address ?? '') + ' - ' + (address.building ?? '')), Text((address.phone ?? '') + ' - ' + (address.mobile ?? ''))],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const SizedBox(width: 8),
                    _getDefaultWidget(context, address),
                    const Spacer(),
                    ElevatedButton(
                      style: getAddressActionButtonStyle(),
                      child: Row(
                        children: const [Text('تعديل العنوان'), Icon(Icons.edit_location_alt_outlined, size: 14)],
                      ),
                      onPressed: () {
                        NewAddressArguments newAddressArguments = NewAddressArguments();
                        newAddressArguments.fromCheckout = false;
                        newAddressArguments.addressObj = address;
                        if (!RouteGenerator.checkIfSameRoute(context, 'new-address')) {
                          Navigator.of(context).pushNamed('new-address', arguments: newAddressArguments);
                        }
                      },
                    ),
                    const SizedBox(width: 8)
                  ],
                ),
              ],
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }

  Widget _getDefaultWidget(context, Address address) {
    if (address.isDefault) {
      return const Text('افتراضي', textAlign: TextAlign.center);
    } else {
      return ElevatedButton(
        style: getAddressActionButtonStyle(),
        child: Row(children: const [Text(' تعيين كافتراضي'), Icon(Icons.location_pin, size: 14)]),
        onPressed: () {
          if (address.isDefault == false) {
            setDefaultAddress(context, address, fromCheckout: widget.fromCheckout);
          }
        },
      );
    }
  }

  deleteAddress(int id) {
    showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("حذف عنوان", textDirection: TextDirection.rtl),
            content: const Text("هل انت متاكد من حذف هذا العنوان ؟", textDirection: TextDirection.rtl),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              ElevatedButton(
                child: const Text("اغلاق"),
                style: getDefaultAddressButtonStyle(),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                style: getDangerButtonStyle(),
                child: const Text("حذف", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  ApiBaseHelper().delete('remove-address', {'id': id}).then((response) {
                    if (response['message'] == 'deleted') {
                      setState(() {});
                    }
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
        context: context);
  }

  Widget? getDeleteIcon(address) {
    if (address.deletable) {
      return GestureDetector(
        onTap: () => deleteAddress(address.id),
        child: const Icon(Icons.remove_circle, size: 18, color: Colors.red),
      );
    }
  }
}

void setDefaultAddress(BuildContext context, Address address, {fromCheckout = false}) {
  ApiBaseHelper().put('set-default-address', {'id': address.id}).then((result) {
    if (result['message'] == 'updated') {
      auth.address = address;
      address.isDefault = true;
      showSuccessDialog(context, 'نجاح', 'تم وضع العنوان كافتراضي');
      if (fromCheckout) {
        if (!RouteGenerator.checkIfSameRoute(context, 'checkout')) {
          Navigator.of(context).pushReplacementNamed('checkout');
        }
      } else {
        if (!RouteGenerator.checkIfSameRoute(context, 'account')) {
          Navigator.of(context).pushReplacementNamed('account');
        }
      }
    } else {
      showErrorDialog(context, 'خطأ', 'حدث خطأ اثناء العملية.');
    }
  });
}
