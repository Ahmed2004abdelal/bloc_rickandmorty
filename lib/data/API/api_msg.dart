class ApiMsg {
  final String msg;
  ApiMsg({required this.msg});

  @override
  String toString() {
    return "error : $msg";
  }
}
