import 'package:flutter/material.dart';
import 'login.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/services.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  List<String> bank = [
    "Bank Central Asia",
    "Bank Mandiri",
    "Bank Jago",
    "United Overseas Bank",
    "BCA Syariah",
    "Bank Negara Indonesia",
    "Bank Permata",
    "Bank Syariah Indonesia",
    "Bank Rakyat Indonesia",
    "Bank BJB"
  ];

  bool _isChecked = false;
  bool _showPassword = false;
  bool _showRepeatPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 100.0),
                  // Title
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35.0),
                ],
              ),

              // NIK
              Container(
                width: 200.0,
                height: 47.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 242, 240, 240),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 238, 235, 235),
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                      hintText: 'NIK',
                      hintStyle: TextStyle(
                        color: Color(int.parse('0xffBDBDBD')),
                        fontFamily: "Inter",
                        fontSize: 15,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14.0),

              // Nama
              Container(
                width: 200.0,
                height: 47.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 242, 240, 240),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 238, 235, 235),
                    width: 1.0,
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: 'Nama',
                    hintStyle: TextStyle(
                      color: Color(int.parse('0xffBDBDBD')),
                      fontFamily: "Inter",
                      fontSize: 15,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 14.0),

              // Email
              Container(
                width: 200.0,
                height: 47.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 242, 240, 240),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 238, 235, 235),
                    width: 1.0,
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Color(int.parse('0xffBDBDBD')),
                      fontFamily: "Inter",
                      fontSize: 15,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 14.0),

              // Password
              Container(
                width: 200.0,
                height: 47.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 242, 240, 240),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 238, 235, 235),
                    width: 1.0,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextField(
                      obscureText: !_showPassword,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Color(int.parse('0xffBDBDBD')),
                          fontFamily: "Inter",
                          fontSize: 15,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(
                            _showPassword ? 'Hide' : 'Show',
                            style: TextStyle(
                              color: Color(int.parse('0xff613EEA')),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14.0),

              // Repeat Password
              Container(
                width: 200.0,
                height: 47.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 242, 240, 240),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 238, 235, 235),
                    width: 1.0,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextField(
                      obscureText: !_showRepeatPassword,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: 'Ulangi Password',
                        hintStyle: TextStyle(
                          color: Color(int.parse('0xffBDBDBD')),
                          fontFamily: "Inter",
                          fontSize: 15,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showRepeatPassword = !_showRepeatPassword;
                        });
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(
                            _showRepeatPassword ? 'Hide' : 'Show',
                            style: TextStyle(
                              color: Color(int.parse('0xff613EEA')),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 14.0,
              ),

              // Dropdown
              Container(
                width: 200.0,
                height: 45.0,
                child: DropdownSearch<String>(
                  mode: Mode.DIALOG,
                  showSelectedItem: true,
                  items: bank,
                  label: "Pilih Bank",
                  hint: "Pilih Bank",
                  popupTitle: Container(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      "Pilihan Bank",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  popupShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  popupItemBuilder: (context, item, isSelected) {
                    return Container(
                      height: 40,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color.fromARGB(255, 230, 230, 230),
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Text(
                        item,
                        textAlign: TextAlign.left,
                      ),
                    );
                  },
                ),
              ),

              SizedBox(
                height: 14.0,
              ),

              // No Rekening
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 242, 240, 240),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 238, 235, 235),
                    width: 1.0,
                  ),
                ),
                child: TextField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: 'No Rekening',
                    hintStyle: TextStyle(
                      color: Color(int.parse('0xffBDBDBD')),
                      fontFamily: "Inter",
                      fontSize: 15,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 14.0,
              ),

              // Checkbox
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'I would like to receive your newsletter and other promotional information',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: "Inter",
                  ),
                ),
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value!;
                  });
                },
              ),

              SizedBox(
                height: 14.0,
              ),

              // Sign up button
              // Sementara buat cek berhasil enggaknya diarahin ke loginpage
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(int.parse('0xff613EEA')),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
