import 'package:flutter/material.dart';
import 'package:wooow_supermarket/models/address.dart';
import 'package:wooow_supermarket/utils/alert.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/global.dart';

class AddressesPage extends StatefulWidget {
  const AddressesPage({Key? key}) : super(key: key);

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
          onPressed: () => {Navigator.of(context).pushNamed('new-address')},
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
      print(data.length);
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {

          print('address');
          print(data[index]['is_default']);
          Address address = Address(
              id: data[index]['id'],
              address: data[index]['address'],
              building: data[index]['building'],
              city: data[index]['city'],
              mobile: data[index]['mobile'],
              phone: data[index]['phone'],
              village: data[index]['village'],
              userId: data[index]['user_id'],
              isDefault: data[index]['is_default'] == 1
          );

          print(address);
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.location_pin),
                  title: Text((address.city ?? '') + ' - ' + (address.village ?? '')),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text((address.address ?? '') + ' - ' + (address.building ?? '')),
                      Text((address.phone ?? '') + ' - ' + (address.mobile ?? ''))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: Text(address.isDefault == true ? 'افتراضي' : 'تعيين كافتراضي'),
                      onPressed: () {
                        if (address.isDefault == false) {
                          _setDefaultAddress(address);
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

  void _setDefaultAddress(Address address) {
    print(address.id);
    ApiBaseHelper().put('set-default-address', {
      'id': address.id
    }).then((result) {
      print(result);
      if (result['message'] == 'updated') {
        address.isDefault = true;
        showSuccessDialog(context, 'نجاح', 'تم وضع العنوان كافتراضي');
        Navigator.of(context).pushReplacementNamed('account');
      } else {
        showErrorDialog(context, 'خطأ', 'حدث خطأ اثناء العملية.');
      }
    });
  }
}
