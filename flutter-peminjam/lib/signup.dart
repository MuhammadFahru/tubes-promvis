// TO DO : Merapihkan Kode dan Menerapkan Cubit dan BLoC serta Controller

import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  // variabel bool untuk check-list
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // TOP NAVBAR
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Sign Up UMKM',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50.0),

            // ==================== FORM DATA AKUN ==============================
            // Field Nama Peminjam (UMKM)
            Container(
              decoration: BoxDecoration(
                color: Color(int.parse('0xffF6F6F6')),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText: 'Nama',
                    labelStyle: TextStyle(
                        color: Color(int.parse('0xffBDBDBD')),
                        fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 16.0),

            // Field Email Peminjam (UMKM)
            Container(
              decoration: BoxDecoration(
                color: Color(int.parse('0xffF6F6F6')),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: Color(int.parse('0xffBDBDBD')),
                        fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 16.0),

            // Field Password
            PasswordTextField(),
            const SizedBox(height: 16.0),

            // Field Password (To do: Mengganti ini dan membuat retype-password)
            PasswordTextField(),

            // ==================== FORM DATA UMKM ==============================
            const SizedBox(height: 24.0),

            // Field Nama Perusahaan
            Container(
              decoration: BoxDecoration(
                color: Color(int.parse('0xffF6F6F6')),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText: 'Nama Perusahaan',
                    labelStyle: TextStyle(
                        color: Color(int.parse('0xffBDBDBD')),
                        fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 16.0),

            // ComboBox Pilihan Kategori UMKM
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: ComboBoxKategori(),
            ),
            const SizedBox(height: 16.0),

            // Field Email Perusahaan
            Container(
              decoration: BoxDecoration(
                color: Color(int.parse('0xffF6F6F6')),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    labelText: 'Email Perusahaan',
                    labelStyle: TextStyle(
                        color: Color(int.parse('0xffBDBDBD')),
                        fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 16.0),

            // Field Alamtat Perusahaan
            Container(
              decoration: BoxDecoration(
                color: Color(int.parse('0xffF6F6F6')),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: SizedBox(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      labelText: 'Alamat Perusahaan',
                      labelStyle: TextStyle(
                          color: Color(int.parse('0xffBDBDBD')),
                          fontWeight: FontWeight.bold)),
                  maxLines: null,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // ComboBox Pilihan Bank
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: ComboBoxBank(),
            ),
            const SizedBox(height: 16.0),

            // Field Nomor Rekening Bank
            Container(
              decoration: BoxDecoration(
                color: Color(int.parse('0xffF6F6F6')),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: SizedBox(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      labelText: 'Nomor Rekening',
                      labelStyle: TextStyle(
                          color: Color(int.parse('0xffBDBDBD')),
                          fontWeight: FontWeight.bold)),
                  maxLines: null,
                ),
              ),
            ),
            SizedBox(
              height: 14.0,
            ),

            // Checkbox Syarat dan Ketentuan
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
                // TO DO -> Menerapkan BloC dan Cubit untuk mengganti value
              },
            ),
            SizedBox(
              height: 14.0,
            ),
            const Spacer(),

            // SIGN UP BUTTON
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(int.parse('0xff613EEA')),
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                onPressed: () {
                  // Perform sign up action
                  Navigator.pushNamed(context, '/home');
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
    );
  }
}

// Class Field Password
class PasswordTextField extends StatefulWidget {
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

// State Field Password
class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility(bool isVisisble) {
    setState(() {
      _isPasswordVisible = isVisisble;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(int.parse('0xffF6F6F6')),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: TextField(
        obscureText: !_isPasswordVisible,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            labelText: 'Password',
            labelStyle: TextStyle(
                color: Color(int.parse('0xffBDBDBD')),
                fontWeight: FontWeight.bold),
            suffixIcon: GestureDetector(
              onTapDown: (_) => _togglePasswordVisibility(true),
              onTapUp: (_) => _togglePasswordVisibility(false),
              onTapCancel: () => _togglePasswordVisibility(false),
              child: IconButton(
                icon: const Icon(Icons.visibility),
                onPressed: () {},
              ),
            )),
      ),
    );
  }
}

// Variabel Untuk Menyimpan Value Item ComboBox
List<String> listKategori = <String>[
  'Warung Kecil',
  'Usaha Kuliner',
  'Usaha Sandang',
  'Usaha Ternak'
];

List<String> listBank = [
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

// COMBOBOX 'KATEGORI'
class ComboBoxKategori extends StatefulWidget {
  const ComboBoxKategori({super.key});

  @override
  State<ComboBoxKategori> createState() => _ComboBoxKategoriState();
}

class _ComboBoxKategoriState extends State<ComboBoxKategori> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text("- Pilih Kategori UMKM -"),
      value: dropdownValue,
      elevation: 16,
      underline: Container(color: Colors.transparent),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: listKategori.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

// COMBOBOX 'BANK'
class ComboBoxBank extends StatefulWidget {
  const ComboBoxBank({super.key});

  @override
  State<ComboBoxBank> createState() => _ComboBoxBankState();
}

class _ComboBoxBankState extends State<ComboBoxBank> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text("- Pilih Bank- "),
      value: dropdownValue,
      elevation: 16,
      underline: Container(color: Colors.transparent),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: listBank.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
