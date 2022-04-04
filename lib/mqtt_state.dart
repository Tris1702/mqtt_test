import 'package:rxdart/subjects.dart';

enum MQTTConnectionState { connected, disconnected, connecting }

class MQTTState {
  final BehaviorSubject<MQTTConnectionState> _currentState =
      BehaviorSubject.seeded(MQTTConnectionState.disconnected);
  final BehaviorSubject<String> _receivedText = BehaviorSubject.seeded('');

  void setReceivedText(String text) {
    _receivedText.add(text);
    print('=======> $text');
  }

  void setState(MQTTConnectionState state) {
    _currentState.add(state);
  }

  Stream<String> get getReceivedTextStream => _receivedText.stream;
  Stream<MQTTConnectionState> get getCurrentStateStream => _currentState.stream;
}
