import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:logistic_app/helpers/constants.dart';
import 'package:logistic_app/services/local_storage.dart';
import 'package:logistic_app/widgets/GradientButton/GradientButton.dart';
import 'package:logistic_app/widgets/custom_text.dart';
import 'package:logistic_app/widgets/menu.dart';

class FundWithNetteller extends StatefulWidget {
  const FundWithNetteller({Key? key}) : super(key: key);

  @override
  State<FundWithNetteller> createState() => _FundWithNettellerState();
}

class _FundWithNettellerState extends State<FundWithNetteller> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ///Text Editing Controllers
  TextEditingController amountController = TextEditingController(text: '');
  PlatformFile? file;
  Map? res;
  String dte = "Choose date";

  Future getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = result.files.single;
      setState(() {});
    } else {
      // User canceled the picker
    }
  }

  bool loading = false;

  getAccountDetails() async {
    /*final response = await HttpService.get(Api.bankDetails);
    res = jsonDecode(response.data)[0];
    setState(() {});*/
  }

  String? username;
  getusername() async {
    username = await LocalStorage().getString("username");
  }

  FundWithNetteller() async {
    /*loading = true;
    setState(() {});
    print(username);
    final res = await HttpService.postWithFiles(Api.FundWithNetteller, {
      "username": username,
      "date": dte,
      "amt": amountController.text,
      "image": dio.MultipartFile.fromBytes(File(file!.path!).readAsBytesSync(),
          filename: file!.name)
    });
    final result = jsonDecode(res.data);
    if (result["Status"] == "succcess") {
      Get.defaultDialog(
        title: "${result["Report"]}",
        titleStyle:
            TextStyle(color: mycolor, fontWeight: FontWeight.bold),
        middleText: "Fund details sent successfully",
        middleTextStyle: TextStyle(
          color: mycolor,
        ),
      ).then((value) => print("done"));
      amountController.text = "";
    } else {
      Get.defaultDialog(
        title: "${result["Report"]}",
        titleStyle:
            TextStyle(color: mycolor, fontWeight: FontWeight.bold),
        middleText: "Fund details not sent",
        middleTextStyle:
            TextStyle(color: mycolor, fontWeight: FontWeight.bold),
      ).then((value) => print("done"));
    }
    loading = false;
    setState(() {});*/
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getusername();
    getAccountDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: CustomText(
            text: "Fund With Netletter",
            weight: FontWeight.bold,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Image.asset("images/netletter.png"),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Netteller Payment",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Pay To: ",
                        style: TextStyle(color: mycolor),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Netteller: netteller0000974p",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: mycolor),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            "Proof of Payment",
                            style: TextStyle(
                                fontSize: 16,
                                color: mycolor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                getFile();
                              },
                              child: Container(
                                height: 50,
                                width: 150,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: mycolor),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: Offset(2, 2))
                                  ],
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    bottomLeft: Radius.circular(5.0),
                                  ),
                                ),
                                child: Text(
                                  "Choose File",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: mycolor),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: Offset(2, 2))
                                  ],
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5.0),
                                    bottomRight: Radius.circular(5.0),
                                  ),
                                ),
                                child: Text(
                                  "${file != null ? file!.name.split("/").last : "No file chosen"}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ),
                            ),
                          ]),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Text(
                            "Date of Payment",
                            style: TextStyle(
                                fontSize: 16,
                                color: mycolor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      InkWell(
                          onTap: () async {
                            DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime.now());
                            if (date != null) {
                              dte = "${date.year}-${date.month}-${date.day}";
                              setState(() {});
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 450,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                border: Border.all(color: mycolor),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 10,
                                      offset: Offset(2, 2))
                                ]),
                            child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text("$dte",
                                    style: TextStyle(fontSize: 16))),
                          )),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Text(
                            "Amount To Fund",
                            style: TextStyle(
                                fontSize: 16,
                                color: mycolor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      _input("", amountController),
                      SizedBox(
                        height: 25,
                      ),
                      GradientButton(
                        title: "Fund now",
                        clrs: [Colors.black, Colors.black],
                        onpressed: () {},
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _input(String hint, TextEditingController controller,
      {bool obscure = false, bool readOnly = false}) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(color: mycolor),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(2, 2))
          ]),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 8, 15, 0),
        child: TextFormField(
          readOnly: readOnly,
          keyboardType: TextInputType.number,
          cursorColor: mycolor,
          obscureText: obscure,
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return "This field must not be empty.";
            }
            return null;
          },
          decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
              //labelText: label,
              hintText: hint,
              focusColor: Colors.grey,

              //fillColor: Colors.white,

              fillColor: Colors.white),
          //keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ),
    );
  }
}
