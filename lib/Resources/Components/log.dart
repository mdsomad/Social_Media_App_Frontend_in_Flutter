import 'dart:developer' as devlog;
import 'package:logger/logger.dart';



class Loggerclass {

  static final logger = Logger();


   // * customers logs
//  static final logger = Logger(
//     printer: PrettyPrinter(
//       methodCount: 1,
//       colors: true,
//       errorMethodCount: 3,
//       lineLength: 50,
//       printEmojis: true

//     )
//   );
 
 

}






// Container(
//                 child: Center(
//                   child: CupertinoButton(
//                       color: Colors.pink,
//                       onPressed: () {
//                         Loggerclass.logger.v("Verbose log");
//                         Loggerclass.logger.d("Debug log");
//                         Loggerclass.logger.i("Info log \nJaanakaaree");
//                         Loggerclass.logger.w("Warning log \nChetaavanee");
//                         Loggerclass.logger.e("Error log \nGalatee");
//                         Loggerclass.logger
//                             .wtf("What is terrible log \nKya Bhayaanak hai");
//                       },
//                       child: Text("log")),
//                 ),
//               ),