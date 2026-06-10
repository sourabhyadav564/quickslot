import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  static const String _baseUrl = 'https://quickslotbe-production.up.railway.app';

  final Dio _dio;
  String _userId = '';

  ApiClient()
      : _dio = Dio(BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        )) {
    if (kDebugMode) {
      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            debugPrint('┌── REQUEST ─────────────────────────────');
            debugPrint('│ ${options.method} ${options.uri}');
            debugPrint('│ Headers: ${options.headers}');
            if (options.data != null) debugPrint('│ Body: ${options.data}');
            debugPrint('└────────────────────────────────────────');
            handler.next(options);
          },
          onResponse: (response, handler) {
            debugPrint('┌── RESPONSE ────────────────────────────');
            debugPrint('│ ${response.statusCode} ${response.requestOptions.uri}');
            debugPrint('│ Data: ${response.data}');
            debugPrint('└────────────────────────────────────────');
            handler.next(response);
          },
          onError: (DioException e, handler) {
            debugPrint('┌── ERROR ───────────────────────────────');
            debugPrint('│ ${e.requestOptions.method} ${e.requestOptions.uri}');
            debugPrint('│ Status: ${e.response?.statusCode}');
            debugPrint('│ Message: ${e.message}');
            debugPrint('│ Response: ${e.response?.data}');
            debugPrint('└────────────────────────────────────────');
            handler.next(e);
          },
        ),
      );
    }
  }

  void setUser(String userId) {
    _userId = userId;
  }

  Options get _authOptions =>
      Options(headers: {'Authorization': 'Bearer $_userId'});

  // ---------- Auth ----------

  /// Returns map with { userId, name } on success; throws DioException on failure.
  Future<Map<String, dynamic>> login(String username, String password) async {
    final res = await _dio.post(
      '/auth/login',
      data: {'username': username, 'password': password},
    );
    return res.data as Map<String, dynamic>;
  }

  // ---------- Venues ----------

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

  // ---------- Bookings ----------

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
