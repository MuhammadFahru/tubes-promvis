import 'package:flutter/material.dart';

class payment extends StatefulWidget {
  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  bool _isOnTap = false;
  int _groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Metode Pembayaran'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                SizedBox(height: 50),
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Icon(
                      Icons.attach_money,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "Saldo Investasi",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Rp5.000.000",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 80, 80, 80),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isOnTap = !_isOnTap;
                        _groupValue = _isOnTap ? 1 : 0;
                      });
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Transform.scale(
                        scale: 1.3,
                        child: Radio(
                          value:
                              1, 
                          groupValue: _groupValue, 
                         activeColor: Theme.of(context).primaryColor,
                          onChanged: (value) {
                            setState(() {
                              _isOnTap = value == 1;
                              _groupValue = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Total Bayar',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Rp 200.000',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            label: '',
          ),
          // Item kedua dengan jarak menggunakan Padding
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => payment(),
                  ),
                );
                // Lakukan aksi lainnya sesuai kebutuhan
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Bayar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
