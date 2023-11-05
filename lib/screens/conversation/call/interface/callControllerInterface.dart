
abstract class CallControllerInterface {
  void initializeData();
  void initializeSocket();
  void initializeAgora();
  void acceptCall();
  void endCall();
  void voiceCall();
  void videoCall();
}