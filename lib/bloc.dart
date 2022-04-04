import 'package:demo_mqtt/mqtt_state.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:rxdart/rxdart.dart';

import 'MQTTManager.dart';

class Bloc {
  void init() {}
  void dispose() {}

  late MqttServerClient client;

  BehaviorSubject<List<String>> msgs =
      BehaviorSubject.seeded(List<String>.empty(growable: true));
  Stream<List<String>> get getMsgsStream => msgs.stream;
  Sink<List<String>> get getMsgsSink => msgs.sink;

  void initMqtt(String host, String topic, String identifier, MQTTState state) async {
    client = await MQTTManager().connect();
  }


  void disconnect() {
    client.disconnect();
  }

  void send(String message) {
    // client.publish(message);
    // msgs.value.add(message);
    // msgs.add(msgs.value);
  }
}
