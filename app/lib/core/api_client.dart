import 'package:dio/dio.dart';

class ApiClient {
  static const String _baseUrl = 'http://10.0.2.2:3000'; // Android emulator → localhost

  final Dio _dio;
  String _userId = 'user_1';

  ApiClient()
      : _dio = Dio(BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ));

  void setUser(String userId) {
    _userId = userId;
  }

  Options get _authOptions =>
      Options(headers: {'X-User-Id': _userId});

  Future<List<dynamic>> getVenues() async {
    final res = await _dio.get('/venues', options: _authOptions);
    return res.data as List<dynamic>;
  }

  Future<List<dynamic>> getSlots(String venueId, String date) async {
    final res = await _dio.get(
      '/venues/$venueId/slots',
      queryParameters: {'date': date},
      options: _authOptions,
    );
    return res.data as List<dynamic>;
  }

  Future<Map<String, dynamic>> bookSlot(String slotId) async {
    final res = await _dio.post(
      '/bookings',
      data: {'slot_id': slotId},
      options: _authOptions,
    );
    return res.data as Map<String, dynamic>;
  }

  Future<List<dynamic>> getUserBookings(String userId) async {
    final res = await _dio.get('/users/$userId/bookings', options: _authOptions);
    return res.data as List<dynamic>;
  }

  Future<void> cancelBooking(String bookingId) async {
    await _dio.delete('/bookings/$bookingId', options: _authOptions);
  }
}
