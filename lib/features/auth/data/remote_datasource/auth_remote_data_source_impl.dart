// import 'dart:developer';
//
// import 'package:dio/dio.dart';
//
// import '../../../../core/common/constants/strings/api_urls.dart';
// import '../../../../core/network/dio_client.dart';
//
// class AuthDataSource {
//   final DioClient _dioClient;
//
//   AuthDataSource(this._dioClient);
//
//   Future<void> signIn(String phoneNumber) async {
//     try {
//       final response = await _dioClient.post(
//         ApiUrls.signIn,
//
//       );
//       if (!(response.statusCode! >= 200 && response.statusCode! < 300)) {
//         log(
//           "Error Bad status code  in send sms: ${response
//               .statusCode} ---------",
//         );
//
//       }
//     } on DioException catch (error) {
//       log(
//         "Error DioException  in send sms: ${error.response?.statusCode}  ${error
//             .response?.statusMessage}-----",
//       );
//       final statusCode = error.response?.statusCode;
//       final errorMessage = error.response?.data["message"];
//       log(
//         "❌ DioException in sendSms — Status: $statusCode, Message: $errorMessage",
//       );
//     }
//   }
// }