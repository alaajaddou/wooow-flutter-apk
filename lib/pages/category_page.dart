import 'package:flutter/material.dart';
import 'package:wooow_supermarket/utils/global.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<String> listImage = [];
  List<Color> listItemColor = [];
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addImage();
    addItemColor();
  }

  void addItemColor() {
    listItemColor.add(Colors.white);
    listItemColor.add(Colors.black);
    listItemColor.add(Colors.indigo);
    listItemColor.add(Colors.teal);
    listItemColor.add(Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Builder(
        builder: (context) {
          return Container(
            color: Colors.grey.shade100,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.68),
              itemBuilder: (context, position) {
                return gridItem(context, position);
              },
              itemCount: listImage.length,
            ),
            margin: const EdgeInsets.only(bottom: 8, left: 4, right: 4, top: 8),
          );
        },
      ),
    );
  }

  filterSortListOption() {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: filterRow(Icons.filter_list, "Filter"),
            flex: 30,
          ),
          divider(),
          Expanded(
            child: filterRow(Icons.sort, "Sort"),
            flex: 30,
          ),
          divider(),
          Expanded(
            child: filterRow(Icons.list, "List"),
            flex: 30,
          ),
        ],
      ),
    );
  }

  divider() {
    return Container(
      width: 2,
      color: Colors.grey.shade400,
      height: 20,
    );
  }

  filterRow(IconData icon, String title) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.grey,
          ),
          const SizedBox(width: 4),
          Text(
            title,
            style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 12),
          )
        ],
      ),
    );
  }

  gridItem(BuildContext context, int position) {
    return GestureDetector(
      onTap: () {
        filterBottomSheet(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: Colors.grey.shade200)),
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 12),
              alignment: Alignment.topRight,
              child: Container(
                alignment: Alignment.center,
                width: 24,
                height: 24,
                decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.indigo),
                child: const Text(
                  "30%",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
            Image(
              image: NetworkImage(listImage[position]),
              height: 170,
              fit: BoxFit.none,
            ),
            gridBottomView()
          ],
        ),
      ),
    );
  }

  gridBottomView() {
    return Column(
      children: <Widget>[
        Container(
          child: const Text(
            "Chair Dacey li - Black",
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.start,
          ),
          alignment: Alignment.topLeft,
        ),
        const SizedBox(width: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "\$50.00",
              style: TextStyle(color: Colors.indigo.shade700, fontSize: 14),
            ),
            const SizedBox(width: 8),
            const Text(
              "\$80.00",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  decoration: TextDecoration.lineThrough),
            ),
          ],
        ),
        const SizedBox(width: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            SizedBox(width: 4),
            Text(
              "4.5",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        )
      ],
    );
  }

  void addImage() {
    listImage.add("https://png.pngtree.com/png-vector/20190130/ourmid/pngtree-chair-stools-are-commercially-available-elements-elementmaterial-png-image_608426.jpg");
    listImage.add("https://png.pngtree.com/png-vector/20190130/ourmid/pngtree-chair-stools-are-commercially-available-elements-elementmaterial-png-image_608426.jpg");
    listImage.add("https://png.pngtree.com/png-vector/20190130/ourmid/pngtree-chair-stools-are-commercially-available-elements-elementmaterial-png-image_608426.jpg");
    listImage.add("https://png.pngtree.com/png-vector/20190130/ourmid/pngtree-chair-stools-are-commercially-available-elements-elementmaterial-png-image_608426.jpg");
    listImage.add("https://png.pngtree.com/png-vector/20190130/ourmid/pngtree-chair-stools-are-commercially-available-elements-elementmaterial-png-image_608426.jpg");
    listImage.add("https://png.pngtree.com/png-vector/20190130/ourmid/pngtree-chair-stools-are-commercially-available-elements-elementmaterial-png-image_608426.jpg");
  }

  filterBottomSheet(BuildContext context) {
    _scaffoldKey.currentState!.showBottomSheet(
          (context) {
        return filterBottomSheetContent();
      },
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))),
    );
  }

  filterBottomSheetContent() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200, width: 1),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16), topLeft: Radius.circular(16)),
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(width: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Icon(
                Icons.close,
              ),
              Text(
                "Filter",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.8), fontSize: 16),
              ),
              const Text(
                "Reset",
                style: TextStyle(color: Colors.indigo, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(width: 28),
          Container(
            child:
            const Text("Price Range", style: TextStyle(fontWeight: FontWeight.normal)),
            margin: const EdgeInsets.only(left: 4),
          ),
          const SizedBox(width: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Minimum",
                    hintStyle: TextStyle(color: Colors.grey.shade800),
                    focusedBorder: border,
                    contentPadding: const EdgeInsets.only(
                        right: 8, left: 8, top: 12, bottom: 12),
                    border: border,
                    enabledBorder: border,
                  ),
                ),
                flex: 47,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 4),
                  height: 1,
                  color: Colors.grey,
                ),
                flex: 6,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Maximum",
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      focusedBorder: border,
                      contentPadding: const EdgeInsets.only(
                          right: 8, left: 8, top: 12, bottom: 12),
                      border: border,
                      enabledBorder: border,
                    ),
                  ),
                ),
                flex: 47,
              ),
            ],
          ),
          const SizedBox(width: 16),
          Container(
            child: const Text("Item Filter",
                style:
                TextStyle(fontSize: 16)),
            margin: const EdgeInsets.only(left: 4),
          ),
          const SizedBox(width: 8),
          ListView.builder(
            primary: false,
            itemBuilder: (context, position) {
              return Container(
                margin: const EdgeInsets.only(top: 4, bottom: 4, left: 4),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          "Discount",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Icon(
                          Icons.check,
                          color: Colors.indigo,
                        )
                      ],
                    ),
                    const SizedBox(width: 4),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey,
                    )
                  ],
                ),
              );
            },
            itemCount: 3,
            shrinkWrap: true,
          ),
          const SizedBox(width: 16),
          Container(
            child:
            const Text("Item Color", style: TextStyle(fontWeight: FontWeight.normal)),
            margin: const EdgeInsets.only(left: 4),
          ),
          const SizedBox(width: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 30),
            child: ListView.builder(
              primary: false,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, position) {
                return Container(
                  margin: const EdgeInsets.only(top: 4, bottom: 4, left: 4),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: listItemColor[position]),
                );
              },
              itemCount: listItemColor.length,
              shrinkWrap: true,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: getButtonStyle(),
              child: const Text(
                "Apply Filter",
                style: TextStyle(color: Colors.white),
              )
            ),
          )
        ],
      ),
    );
  }

  var border = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.grey.shade300, width: 1));
}
