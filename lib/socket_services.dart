import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketIoExample extends StatefulWidget {
  @override
  _SocketIoExampleState createState() => _SocketIoExampleState();
}

class _SocketIoExampleState extends State<SocketIoExample> {
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();

    // Initialize and connect to the server
    socket = IO.io(
      'https://soupboyssrikvs-trgiy.ondigitalocean.app/', // Replace with your server URL and port
      IO.OptionBuilder()
          .setTransports(['websocket']) // Specify transport options
          .disableAutoConnect() // Prevents auto-connection
          .build(),
    );

    socket.connect();

    // Listen for connection event
    socket.on('connect', (_) {
      print('Connected to Socket.IO server');
      socket.emit('message', 'Hello from Flutter!');
    });

    // Listen for custom events
    socket.on('custom_event', (data) {
      print('Received custom_event: $data');
    });

    // Handle disconnection
    socket.on('disconnect', (_) {
      print('Disconnected from server');
    });
  }

  @override
  void dispose() {
    socket.dispose(); // Clean up when the widget is destroyed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Socket.IO Example')),
      body: Center(child: Text('Check your console for events')),
    );
  }
}
