import 'package:chat_app/core/api_endpoints/api_endpoints.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart';

@module
abstract class SocketIoModule {
  @lazySingleton
  Socket get socket => io(
        ApiEndpoints.baseUrl,
        OptionBuilder().setTransports(['websocket']).build(),
      );
}
