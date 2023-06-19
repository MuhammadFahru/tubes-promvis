import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DetailFundingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Funding'),
        ),
        body: DetailFunding(
          UMKMName: "Makmur Jaya Persero",
          UMKMAddress: "Jl. Raya Bogor KM 30",
          fundingTitle: "Modal Dagang Warung Kecil",
          fundingAmount: "Rp5.000.000",
          fundingTenure: "5 Minggu",
          fundingReturns: "10%",
          weeklyInstallment: "Rp510.000",
          monthlyIncome: "Rp750.000",
          occupation: "Pedagang",
          sector: "UMKM Kecil",
          agreement: "Agreement",
          riskDescription: "Risk Description",
          risks: ["Riks 1", "Riks 2", "Riks 3"],
        ));
  }
}

// class DetailFunding extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         child: Stack(
//           children: [
//             Container(
//               width: double.infinity,
//               padding:
//                   const EdgeInsets.only(top: 20, bottom: 8, left: 0, right: 0),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 verticalDirection: VerticalDirection.down,
//                 children: [
// Padding(
//   padding: const EdgeInsets.only(left: 40, right: 40),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       FittedBox(
//         fit: BoxFit.fill,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(50.0),
//           child: Image.network(
//             'https://awsimages.detik.net.id/community/media/visual/2023/02/23/warung-kelontong-madura-1.jpeg',
//             height: 100.0,
//             width: 100.0,
//           ),
//         ),
//       ),
//       SizedBox(width: 20),
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 10),
//           Text(
//             "Makmur Jaya Persero",
//             style: GoogleFonts.inter(
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//           SizedBox(height: 6),
//           Text(
//             "Modal Dagang Warung Kecil",
//             style: GoogleFonts.inter(
//               fontSize: 12.0,
//               color: Color.fromARGB(255, 80, 80, 80),
//             ),
//           ),
//           SizedBox(height: 6),
//           Text(
//             "Jl. Banda No. 12",
//             style: GoogleFonts.inter(
//               fontSize: 10.0,
//               color: Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     ],
//   ),
// ),
//                   SizedBox(height: 10),
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     Row(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(right: 24.0),
//           child: Column(
//             children: [
//               Text(
//                 "PLAFOND",
//                 style: GoogleFonts.inter(
//                   fontSize: 14.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 "Rp5.000.000",
//                 style: GoogleFonts.inter(),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding:
//               const EdgeInsets.only(left: 24.0, right: 12.0),
//           child: Column(
//             children: [
//               Text(
//                 "BAGI HASIL",
//                 style: GoogleFonts.inter(
//                   fontSize: 14.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 "12%",
//                 style: GoogleFonts.inter(),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding:
//               const EdgeInsets.only(left: 24.0, right: 12.0),
//           child: Column(
//             children: [
//               Text(
//                 "TENOR",
//                 style: GoogleFonts.inter(
//                   fontSize: 14.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 "5 Minggu",
//                 style: GoogleFonts.inter(),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   ],
// ),
//                   SizedBox(height: 10),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 30, right: 30),
//                     child: Divider(color: Color.fromARGB(255, 117, 117, 117)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 30, right: 30, top: 10, bottom: 5),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Tenor Pendanaan", style: GoogleFonts.inter()),
//                         Text("5 Minggu", style: GoogleFonts.inter()),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 30, right: 30, top: 5, bottom: 5),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Imbal Hasil", style: GoogleFonts.inter()),
//                         Text("12%", style: GoogleFonts.inter()),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 30, right: 30, top: 5, bottom: 5),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Angsuran Mingguan", style: GoogleFonts.inter()),
//                         Text("Rp112.500", style: GoogleFonts.inter()),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 30, right: 30, top: 5, bottom: 5),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Penghasilan per Bulan",
//                             style: GoogleFonts.inter()),
//                         Text("Rp1.800.000", style: GoogleFonts.inter()),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 30, right: 30, top: 5, bottom: 5),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Pekerjaan", style: GoogleFonts.inter()),
//                         Text("Pedagang Warung", style: GoogleFonts.inter()),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 30, right: 30, top: 5, bottom: 5),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Sektor", style: GoogleFonts.inter()),
//                         Text("Perdagangan", style: GoogleFonts.inter()),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 30, right: 30, top: 5, bottom: 5),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Akad", style: GoogleFonts.inter()),
//                         Text("Perjanjian Pendanaan",
//                             style: GoogleFonts.inter()),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 30, right: 30),
//                     child: Divider(color: Color.fromARGB(255, 117, 117, 117)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 30, right: 30, top: 10, bottom: 5),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Risiko Pendanaan",
//                           style: GoogleFonts.inter(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
//                           style: GoogleFonts.inter(),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 30, right: 30, top: 0, bottom: 0),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Container(
//                               padding: EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(100),
//                                 color: Color.fromARGB(255, 144, 26, 165),
//                               ),
//                               child: Text(
//                                 '1',
//                                 style: GoogleFonts.inter(
//                                   color: Colors.white,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 10),
//                             Text("Lorem ipsum 1", style: GoogleFonts.inter()),
//                           ],
//                         ),
//                         SizedBox(height: 4),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Container(
//                               padding: EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(100),
//                                 color: Color.fromARGB(255, 144, 26, 165),
//                               ),
//                               child: Text(
//                                 '2',
//                                 style: GoogleFonts.inter(
//                                   color: Colors.white,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 10),
//                             Text("Lorem ipsum 2", style: GoogleFonts.inter()),
//                           ],
//                         ),
//                         SizedBox(height: 4),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Container(
//                               padding: EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(100),
//                                 color: Color.fromARGB(255, 144, 26, 165),
//                               ),
//                               child: Text(
//                                 '3',
//                                 style: GoogleFonts.inter(
//                                   color: Colors.white,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 10),
//                             Text("Lorem ipsum 3", style: GoogleFonts.inter()),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(10.0),
//                         child: LinearPercentIndicator(
//                           width: 300,
//                           animation: true,
//                           lineHeight: 20.0,
//                           animationDuration: 800,
//                           percent: 0.8,
//                           center: Text(
//                             "4 Minggu",
//                             style: GoogleFonts.inter(color: Colors.white),
//                           ),
//                           linearStrokeCap: LinearStrokeCap.roundAll,
//                           progressColor: Colors.purple,
//                         ),
//                       ),
//                       Text(
//                         "80.0%",
//                         style: GoogleFonts.inter(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.purple,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class DetailFunding extends StatelessWidget {
  final String UMKMName;
  final String UMKMAddress;
  final String fundingTitle;
  final String fundingAmount;
  final String fundingTenure;
  final String fundingReturns;
  final String weeklyInstallment;
  final String monthlyIncome;
  final String occupation;
  final String sector;
  final String agreement;
  final String riskDescription;
  final List<String> risks;

  DetailFunding({
    required this.UMKMName,
    required this.UMKMAddress,
    required this.fundingTitle,
    required this.fundingAmount,
    required this.fundingTenure,
    required this.fundingReturns,
    required this.weeklyInstallment,
    required this.monthlyIncome,
    required this.occupation,
    required this.sector,
    required this.agreement,
    required this.riskDescription,
    required this.risks,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.fill,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.network(
                      'https://awsimages.detik.net.id/community/media/visual/2023/02/23/warung-kelontong-madura-1.jpeg',
                      height: 100.0,
                      width: 100.0,
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
                      UMKMName,
                      style: GoogleFonts.inter(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      fundingTitle,
                      style: GoogleFonts.inter(
                        fontSize: 12.0,
                        color: Color.fromARGB(255, 80, 80, 80),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      UMKMAddress,
                      style: GoogleFonts.inter(
                        fontSize: 10.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: Column(
                      children: [
                        Text(
                          "PLAFOND",
                          style: GoogleFonts.inter(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          fundingAmount,
                          style: GoogleFonts.inter(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 12.0),
                    child: Column(
                      children: [
                        Text(
                          "BAGI HASIL",
                          style: GoogleFonts.inter(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          fundingReturns,
                          style: GoogleFonts.inter(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 12.0),
                    child: Column(
                      children: [
                        Text(
                          "TENOR",
                          style: GoogleFonts.inter(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          fundingTenure,
                          style: GoogleFonts.inter(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Jumlah Pendanaan", style: GoogleFonts.inter()),
                Text(fundingAmount, style: GoogleFonts.inter()),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tenor Pendanaan", style: GoogleFonts.inter()),
                Text(fundingTenure, style: GoogleFonts.inter()),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Imbal Hasil", style: GoogleFonts.inter()),
                Text(fundingReturns, style: GoogleFonts.inter()),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Angsuran Mingguan", style: GoogleFonts.inter()),
                Text(weeklyInstallment, style: GoogleFonts.inter()),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Penghasilan per Bulan", style: GoogleFonts.inter()),
                Text(monthlyIncome, style: GoogleFonts.inter()),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Pekerjaan", style: GoogleFonts.inter()),
                Text(occupation, style: GoogleFonts.inter()),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sektor", style: GoogleFonts.inter()),
                Text(sector, style: GoogleFonts.inter()),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
            child: Text(
              "Perjanjian Pendanaan",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 20),
            child: Text(
              agreement,
              style: GoogleFonts.inter(),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
            child: Text(
              "Deskripsi Risiko",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 20),
            child: Text(
              riskDescription,
              style: GoogleFonts.inter(),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
            child: Text(
              "Risiko",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 20),
            child: Column(
              children: risks.map((risk) => buildRiskItem(risk)).toList(),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: LinearPercentIndicator(
                  width: 300,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 800,
                  percent: 0.8,
                  center: Text(
                    fundingTenure,
                    style: GoogleFonts.inter(color: Colors.white),
                  ),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.purple,
                ),
              ),
              Text(
                "80.0%",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildRiskItem(String risk) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 4, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Color.fromARGB(255, 144, 26, 165),
            ),
            child: Text(
              (risks.indexOf(risk) + 1).toString(),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(risk, style: GoogleFonts.inter()),
        ],
      ),
    );
  }
}
