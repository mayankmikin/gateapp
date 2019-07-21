import 'dart:async';
import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';

class MQTTClient
{
      final MqttClient client = MqttClient('test.mosquitto.org', '');
      
      
 /// Create a connection message to use or use the default one. The default one sets the
  /// client identifier, any supplied username/password, the default keepalive interval(60s)
  /// and clean session, an example of a specific one below.
  /// 
    void  createConnection()
    {
          final MqttConnectMessage connMess = MqttConnectMessage()
        .withClientIdentifier('Mqtt_MyClientUniqueId')
        .keepAliveFor(20) // Must agree with the keep alive set above or not set
        .withWillTopic('willtopic') // If you set this you must set a will message
        .withWillMessage('My Will message')
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
        print('EXAMPLE::Mosquitto client connecting....');
        client.connectionMessage = connMess;
    }


    void connect(username,password) async
    {
    
      client.logging(on: true);
      /// Connect the client, any errors here are communicated by raising of the appropriate exception. Note
      /// in some circumstances the broker will just disconnect us, see the spec about this, we however eill
      /// never send malformed messages.
            try {
        await client.connect(username,password);
      } on Exception catch (e) {
        print('EXAMPLE::client exception - $e');
        client.disconnect();
      }

      /// Check we are connected
        if (client.connectionStatus.state == MqttConnectionState.connected) {
          print('EXAMPLE::Mosquitto client connected');
        } else {
          /// Use status here rather than state if you also want the broker return code.
          print(
              'EXAMPLE::ERROR Mosquitto client connection failed - disconnecting, status is ${client.connectionStatus}');
          client.disconnect();
          exit(-1);
        }

    }

    void subscribeATopic(topicName)
    {
          /// Ok, lets try a subscription
      print('EXAMPLE::Subscribing to the topic: {} '+topicName);
      String topic = topicName; // Not a wildcard topic
      client.subscribe(topic, MqttQos.atMostOnce);
    }
    /// The subscribed callback
    void onSubscribed(String topic) {
      print('EXAMPLE::Subscription confirmed for topic $topic');
    }

    /// The unsolicited disconnect callback
    void onDisconnected() {
      print('EXAMPLE::OnDisconnected client callback - Client disconnection');
      if (client.connectionStatus.returnCode == MqttConnectReturnCode.solicited) {
        print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
      }
      exit(-1);
    }

    /// The successful connect callback
    void onConnected() {
      print(
          'EXAMPLE::OnConnected client callback - Client connection was sucessful');
    }

    /// Pong callback
    void pong() {
      print('EXAMPLE::Ping response client callback invoked');
    }
}