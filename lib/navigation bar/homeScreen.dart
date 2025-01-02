// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as https;
import 'package:testapi/Api/api_hepler.dart';
import 'package:testapi/Model/convert.dart';
import 'package:testapi/widget/text_field.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController controller = TextEditingController();
  String from = "USD";
  String to = 'EUR';
  String result = "";
  @override
  void initState() {
    controller.text = '1';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
            child: MainTextField(
              controller: controller,
              hint: "",
              textInputType: TextInputType.number,
              labelText: 'Enter Amount',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton(
                  value: from,
                  items: const [
                     DropdownMenuItem(value: "USD", child: Text("USD")),
                     DropdownMenuItem(value: "EUR", child: Text("EUR")),
                     DropdownMenuItem(value: "GBP", child: Text("GBP")),
                     DropdownMenuItem(value: "JPY", child: Text("JPY")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      from = value.toString();
                    });
                  },
                ),
                DropdownButton(
                  value: to,
                  items: const [
                    DropdownMenuItem(value: "USD", child: Text("USD")),
                    DropdownMenuItem(value: "EUR", child: Text("EUR")),
                    DropdownMenuItem(value: "GBP", child: Text("GBP")),
                    DropdownMenuItem(value: "JPY", child: Text("JPY")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      to = value.toString();
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfff7f1f9)),
                child: const Text('Reset'),

              ),
              ElevatedButton(
                onPressed: () async {
                  https.Response response = await ApiHelper.get(
                      url:
                          "https://api.frankfurter.app/latest?amount=${controller.text}&from=$from&to=$to");
                  Convert convert =
                      Convert.fromJson(json.decode(response.body));

                  setState(() {
                    if (convert.rates == null) {
                      result = controller.text;
                    } else {
                      result = convert.rates!.eUR.toString();
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfff7f1f9)),
                child: const Text('Exchange'),

              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(16),
              height: 100,
              width: 230,
              decoration: BoxDecoration(
                color: const Color(0xffe3efe5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const Text(
                    'Result:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    result,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
