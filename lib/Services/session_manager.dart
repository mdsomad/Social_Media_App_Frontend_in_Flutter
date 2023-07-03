
class SessionController {

  static final SessionController _session = SessionController._internal();
  String? userid;


  factory SessionController(){
    return _session;
  }

  SessionController._internal(){

  }
  
  
}



class SessionControllerTolen {

  static final SessionControllerTolen _session = SessionControllerTolen._internal();
  String? token;


  factory SessionControllerTolen(){
    return _session;
  }

  SessionControllerTolen._internal(){

  }
  
  
}