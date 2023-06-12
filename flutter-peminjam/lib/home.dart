import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

// HOME SCREEN
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Color.fromARGB(255, 213, 213, 213),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 16, left: 16, right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(int.parse('0xff613EEA')),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: Text("Tagihan Selanjutnya",
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white))),
                          Container(
                              child: Text("Rp1.000.000",
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))),
                          const SizedBox(height: 16.0),
                          Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/');
                                  },
                                  icon: Icon(Icons.calendar_month),
                                  color: Color(int.parse('0xff613EEA')),
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Container(
                                child: Text("3 Juni 2023",
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white)),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(width: 24.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text("2 hari lagi",
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red)))),
                          const SizedBox(height: 24.0),
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: SizedBox(
                              height: 64.0,
                              width: 64.0,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/paymentFunding');
                                },
                                iconSize: 48,
                                icon: Icon(Icons.payment),
                                color: Color(int.parse('0xff613EEA')),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text("Peminjaman Anda",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color(int.parse('0xff613EEA')))),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/detailFunding');
                  },
                  child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 8, left: 0, right: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Image.network(
                                    'https://awsimages.detik.net.id/community/media/visual/2023/02/23/warung-kelontong-madura-1.jpeg',
                                    height: 64.0,
                                    width: 64.0,
                                  ),
                                ),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Modal Dagang Warung",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      Text("Penjanjian Pendanaan",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey)),
                                    ]),
                                Container(
                                    margin: new EdgeInsets.symmetric(
                                        horizontal: 0.0),
                                    decoration: BoxDecoration(
                                        color: Color(int.parse('0xff613EEA')),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("Ongoing",
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ))
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: Column(
                                      children: [
                                        Text("TOTAL",
                                            style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold)),
                                        Text("TAGIHAN",
                                            style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold)),
                                        Text("Rp5.000.000"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, right: 12.0),
                                    child: Column(
                                      children: [
                                        Text("TOTAL",
                                            style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold)),
                                        Text("DIBAYAR",
                                            style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold)),
                                        Text("Rp4.000.000"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, right: 12.0),
                                    child: Column(
                                      children: [
                                        Text("TENOR",
                                            style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold)),
                                        Text("WAKTU",
                                            style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold)),
                                        Text("5 Minggu"),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: new LinearPercentIndicator(
                                  width: 300,
                                  animation: true,
                                  lineHeight: 20.0,
                                  animationDuration: 800,
                                  percent: 0.8,
                                  center: Text("4 Minggu",
                                      style: TextStyle(color: Colors.white)),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.purple,
                                ),
                              ),
                              Text("80.0%",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple)),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ));
  }
}
