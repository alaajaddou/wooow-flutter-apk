import 'package:flutter/material.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/global.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
              left: BorderSide(width: 1.0, color: getPrimaryColor()),
              right: BorderSide(width: 1.0, color: getPrimaryColor()),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [Text("بتاريخ 21/10/2021")],
                            ),
                            Column(
                              children: const [Text("طلبية رقم 1125623335")],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("تتبع طلبيتك", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                          ],
                        ))
                      ])
                    ],
                  ))
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
              left: BorderSide(width: 1.0, color: getPrimaryColor()),
              right: BorderSide(width: 1.0, color: getPrimaryColor()),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [Text("بتاريخ 21/10/2021")],
                            ),
                            Column(
                              children: const [Text("طلبية رقم 1125623335")],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("تتبع طلبيتك", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                          ],
                        ))
                      ])
                    ],
                  ))
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
              left: BorderSide(width: 1.0, color: getPrimaryColor()),
              right: BorderSide(width: 1.0, color: getPrimaryColor()),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [Text("بتاريخ 21/10/2021")],
                            ),
                            Column(
                              children: const [Text("طلبية رقم 1125623335")],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("تتبع طلبيتك", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                          ],
                        ))
                      ])
                    ],
                  ))
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
              left: BorderSide(width: 1.0, color: getPrimaryColor()),
              right: BorderSide(width: 1.0, color: getPrimaryColor()),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [Text("بتاريخ 21/10/2021")],
                            ),
                            Column(
                              children: const [Text("طلبية رقم 1125623335")],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("تتبع طلبيتك", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                          ],
                        ))
                      ])
                    ],
                  ))
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
              left: BorderSide(width: 1.0, color: getPrimaryColor()),
              right: BorderSide(width: 1.0, color: getPrimaryColor()),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [Text("بتاريخ 21/10/2021")],
                            ),
                            Column(
                              children: const [Text("طلبية رقم 1125623335")],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("تتبع طلبيتك", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                          ],
                        ))
                      ])
                    ],
                  ))
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
              left: BorderSide(width: 1.0, color: getPrimaryColor()),
              right: BorderSide(width: 1.0, color: getPrimaryColor()),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [Text("بتاريخ 21/10/2021")],
                            ),
                            Column(
                              children: const [Text("طلبية رقم 1125623335")],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("تتبع طلبيتك", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                          ],
                        ))
                      ])
                    ],
                  ))
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
              left: BorderSide(width: 1.0, color: getPrimaryColor()),
              right: BorderSide(width: 1.0, color: getPrimaryColor()),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [Text("بتاريخ 21/10/2021")],
                            ),
                            Column(
                              children: const [Text("طلبية رقم 1125623335")],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("تتبع طلبيتك", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                          ],
                        ))
                      ])
                    ],
                  ))
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
              left: BorderSide(width: 1.0, color: getPrimaryColor()),
              right: BorderSide(width: 1.0, color: getPrimaryColor()),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [Text("بتاريخ 21/10/2021")],
                            ),
                            Column(
                              children: const [Text("طلبية رقم 1125623335")],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("تتبع طلبيتك", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                          ],
                        ))
                      ])
                    ],
                  ))
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
              left: BorderSide(width: 1.0, color: getPrimaryColor()),
              right: BorderSide(width: 1.0, color: getPrimaryColor()),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [Text("بتاريخ 21/10/2021")],
                            ),
                            Column(
                              children: const [Text("طلبية رقم 1125623335")],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("تتبع طلبيتك", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                          ],
                        ))
                      ])
                    ],
                  ))
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
              left: BorderSide(width: 1.0, color: getPrimaryColor()),
              right: BorderSide(width: 1.0, color: getPrimaryColor()),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [Text("بتاريخ 21/10/2021")],
                            ),
                            Column(
                              children: const [Text("طلبية رقم 1125623335")],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("تتبع طلبيتك", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                          ],
                        ))
                      ])
                    ],
                  ))
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
              left: BorderSide(width: 1.0, color: getPrimaryColor()),
              right: BorderSide(width: 1.0, color: getPrimaryColor()),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [Text("بتاريخ 21/10/2021")],
                            ),
                            Column(
                              children: const [Text("طلبية رقم 1125623335")],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("تتبع طلبيتك", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                          ],
                        ))
                      ])
                    ],
                  ))
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
              left: BorderSide(width: 1.0, color: getPrimaryColor()),
              right: BorderSide(width: 1.0, color: getPrimaryColor()),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [Text("بتاريخ 21/10/2021")],
                            ),
                            Column(
                              children: const [Text("طلبية رقم 1125623335")],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("تتبع طلبيتك", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                          ],
                        ))
                      ])
                    ],
                  ))
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
              left: BorderSide(width: 1.0, color: getPrimaryColor()),
              right: BorderSide(width: 1.0, color: getPrimaryColor()),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [Text("بتاريخ 21/10/2021")],
                            ),
                            Column(
                              children: const [Text("طلبية رقم 1125623335")],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("تتبع طلبيتك", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                          ],
                        ))
                      ])
                    ],
                  ))
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
              left: BorderSide(width: 1.0, color: getPrimaryColor()),
              right: BorderSide(width: 1.0, color: getPrimaryColor()),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [Text("بتاريخ 21/10/2021")],
                            ),
                            Column(
                              children: const [Text("طلبية رقم 1125623335")],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("تتبع طلبيتك", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                          ],
                        ))
                      ])
                    ],
                  ))
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
              left: BorderSide(width: 1.0, color: getPrimaryColor()),
              right: BorderSide(width: 1.0, color: getPrimaryColor()),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [Text("بتاريخ 21/10/2021")],
                            ),
                            Column(
                              children: const [Text("طلبية رقم 1125623335")],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("تتبع طلبيتك", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                          ],
                        ))
                      ])
                    ],
                  ))
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
              left: BorderSide(width: 1.0, color: getPrimaryColor()),
              right: BorderSide(width: 1.0, color: getPrimaryColor()),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [Text("بتاريخ 21/10/2021")],
                            ),
                            Column(
                              children: const [Text("طلبية رقم 1125623335")],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("تتبع طلبيتك", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                          ],
                        ))
                      ])
                    ],
                  ))
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
              left: BorderSide(width: 1.0, color: getPrimaryColor()),
              right: BorderSide(width: 1.0, color: getPrimaryColor()),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [Text("بتاريخ 21/10/2021")],
                            ),
                            Column(
                              children: const [Text("طلبية رقم 1125623335")],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("تتبع طلبيتك", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                          ],
                        ))
                      ])
                    ],
                  ))
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
              left: BorderSide(width: 1.0, color: getPrimaryColor()),
              right: BorderSide(width: 1.0, color: getPrimaryColor()),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [Text("بتاريخ 21/10/2021")],
                            ),
                            Column(
                              children: const [Text("طلبية رقم 1125623335")],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("تتبع طلبيتك", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                          ],
                        ))
                      ])
                    ],
                  ))
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
              left: BorderSide(width: 1.0, color: getPrimaryColor()),
              right: BorderSide(width: 1.0, color: getPrimaryColor()),
            )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [Text("بتاريخ 21/10/2021")],
                            ),
                            Column(
                              children: const [Text("طلبية رقم 1125623335")],
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("تتبع طلبيتك", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Text(
                                  "طلبية",
                                  style: TextStyle(color: Colors.amber),
                                )
                              ],
                            ),
                          ],
                        ))
                      ])
                    ],
                  ))
                ])
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          child: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 35.0,
          )),
      bottomNavigationBar: const CustomNavigator(),
    );
  }
}
