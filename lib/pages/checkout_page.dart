import 'package:flutter/material.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/models/address.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/global.dart';
import 'package:wooow_supermarket/utils/route_generator.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(isHome: false),
      body: Builder(builder: (context) {
        return Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[selectedAddressSection(), standardDelivery(), priceSection()],
              ),
              flex: 90,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                // ignore: prefer_const_constructors
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: ElevatedButton(
                  onPressed: () {
                    /*Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => OrderPlacePage()));*/
                    showThankYouBottomSheet(context);
                  },
                  child: const Text(
                    "اطلب",
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(getPrimaryColor()),
                    textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              flex: 10,
            )
          ],
        );
      }),
      bottomNavigationBar: const CustomNavigator(),
    );
  }

  showThankYouBottomSheet(BuildContext context) async {
    dynamic order = {'address_id': auth.address.id, 'items': getItems()};

    ApiBaseHelper().post('order', order).then((result) {
      if (result['message'] == "success") {
        cart.deleteAllCart();
        cartClass.updateCounter();
        if (!RouteGenerator.checkIfSameRoute(context, 'thanks')) {
          Navigator.of(context).pushReplacementNamed('thanks');
        }
      }
    });
  }

  getEmptyAddressSection() {
    return ElevatedButton(
        onPressed: () {
          if (!RouteGenerator.checkIfSameRoute(context, 'addresses')) {
            Navigator.of(context).pushNamed('addresses', arguments: true);
          }
        },
        style: getDefaultAddressButtonStyle(),
        child: const Text("اختر العنوان")
    );
  }

  selectedAddressSection() {
    return Container(
        margin: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: getAddress()
    );
  }

  getAddress() {
    if (auth.address.id == 0) {
      return getEmptyAddressSection();
    } else {
      return Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(4)), border: Border.all(color: Colors.grey.shade200)),
          padding: const EdgeInsets.only(left: 12, top: 8, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: Text(
                        auth.user.name,
                        style: const TextStyle(fontSize: 14),
                      )),
                  Row(children: [
                    ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).pushNamed('addresses', arguments: true);
                          if (!RouteGenerator.checkIfSameRoute(context, 'addresses')) {
                            Navigator.of(context).pushNamed('addresses', arguments: true);
                          }
                        },
                        style: getDefaultAddressButtonStyle(),
                        child: const Text("الرئيسي")),
                    const Padding(padding: EdgeInsets.all(5)),
                    ElevatedButton(
                        onPressed: () =>
                        {
                          if (!RouteGenerator.checkIfSameRoute(context, 'new-address')) {
                            Navigator.of(context).pushNamed('new-address', arguments: {'fromCheckout': true})
                          }
                        },
                        style: getDefaultAddressButtonStyle(),
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                        ))
                  ])
                ],
              ),
              createAddressText('العنوان: ' + (auth.address.address ?? ''), 16),
              createAddressText('المدينة: ' + (auth.address.city ?? ''), 6),
              createAddressText('القرية: ' + (auth.address.village ?? ''), 6),
              createAddressText("رقم الهاتف: " + (auth.address.phone ?? ''), 6),
              createAddressText('رقم المحمول: ' + (auth.address.mobile ?? ''), 6),
              const SizedBox(
                height: 16,
              ),
              Container(
                color: Colors.grey.shade300,
                height: 1,
                width: double.infinity,
              ),
            ],
          ),
        ),
      );
    }
  }

  createAddressText(String strAddress, double topMargin) {
    return Row(children: [
      Expanded(
          child: Container(
            margin: EdgeInsets.only(top: topMargin),
            child: Text(
              strAddress,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
            ),
          ))
    ]);
  }

  addressAction() {
    List<Widget> widgets = [];
    if (auth.address.id != 0) {
      widgets.add(ElevatedButton(
        onPressed: () {},
        child: Text(
          "تعديل",
          style: TextStyle(fontSize: 12, color: Colors.indigo.shade700),
        ),
        style: getButtonStyle(),
      ));
    }
    widgets.add(ElevatedButton(
      onPressed: () {
        if (!RouteGenerator.checkIfSameRoute(context, 'new-address')) {
          Navigator.of(context).pushNamed('new-address', arguments: {'fromCheckout': true});
        }
      },
      child: Text("اضف عنوان جديد", style: TextStyle(fontSize: 12, color: Colors.indigo.shade700)),
      style: getButtonStyle(),
    ));
    return Row(mainAxisAlignment: widgets.length > 1 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: widgets);
  }

  standardDelivery() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: Colors.tealAccent.withOpacity(0.4), width: 1),
          color: Colors.tealAccent.withOpacity(0.2)),
      margin: const EdgeInsets.all(8),
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Radio(
            value: 1,
            groupValue: 1,
            onChanged: (isChecked) {},
            activeColor: Colors.tealAccent.shade400,
          ),
          Column(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "الدفع عند الاستلام",
                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
              ),
              Text(
                "توصيل سريع",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  priceSection() {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(4)), border: Border.all(color: Colors.grey.shade200)),
          padding: const EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 4,
              ),
              Row(children: const [
                Expanded(
                    child: Text(
                      "تفاصيل الطلب",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w600),
                    ))
              ]),
              const SizedBox(
                height: 4,
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: const EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 8,
              ),
              createPriceItem("المجموع", getFormattedCurrency(cart.getTotalAmount()), Colors.grey.shade700),
              // createPriceItem("Bag discount", getFormattedCurrency(3280), Colors.teal.shade300),
              // createPriceItem("Tax", getFormattedCurrency(96), Colors.grey.shade700),
              // createPriceItem("Order Total", getFormattedCurrency(2013), Colors.grey.shade700),
              createPriceItem("التوصيل", "مجاناً", Colors.teal.shade300),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: const EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  const Text(
                    "صافي المجموع",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Text(
                    getFormattedCurrency(cart.getTotalAmount()),
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  createPriceItem(String key, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            key,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
          ),
          Text(
            value,
            style: TextStyle(color: color, fontSize: 12),
          )
        ],
      ),
    );
  }

  List<dynamic> getItems() {
    List<dynamic> items = [];

    for (int index = 0; index < cart.getCartItemCount(); index++) {
      if (cart.cartItem[index] != null) {
        items.add({
          'id': cart.cartItem[index].productId,
          'quantity': cart.cartItem[index].quantity,
          'price': cart.cartItem[index].unitPrice,
        });
      }
    }

    return items;
  }
}
