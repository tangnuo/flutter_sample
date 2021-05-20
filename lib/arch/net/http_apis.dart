class HttpApi {
  static const String BASE_SERVER = "police-app/app-server/";

  static String BASE_URL = "http://dolphin-dev.kedacom.com/";

  // static String GET_CLIENT_PATH = BASE_SERVER + "manager/getClientPath";
  //
  // static const  String GET_ALARM_LIST = BASE_SERVER+"alarm/getAlarmList";
  // static const String UPDATE_ALARM_STATUS =BASE_SERVER+"alarm/updateAlarmStatus";
  //
  // static const String GET_DISPATCH_VEHICLE =BASE_SERVER+"dispatch/getDispatchVehicle";
  //
  // static const String QUERY_VEHICLE_BY_KEYWORD =BASE_SERVER+"basic/queryVehicleByKeyword";
  //
  // static const String BIND_VEHICLE =BASE_SERVER+"report/bindVehicle";
  // static const String BIND_TEAM =BASE_SERVER+"report/bindTeam";
  // static const String GET_DISPATCH_DEPT =BASE_SERVER+"dispatch/getDispatchDept";
  //
  // static const String SEARCH_BY_KEYWORD =BASE_SERVER+"basic/searchByKeyword";
  //
  static String LOGIN_IN = BASE_SERVER + "oauth2/password";
  //
  // static String GET_ALARM_DETAIL = BASE_SERVER + "alarm/getAlarmDetail";
  //
  // static String GET_ALARM_INSTRUCTION_LIST = BASE_SERVER + "alarm/getAlarmInstructionList";
  //
  // static String API_ADD_SCENE_INFO = BASE_SERVER + "alarm/addSceneInfo";
  //
  // static String API_GET_DEFEND_GOAL_DETAIL = BASE_SERVER + "resource/getDefendGoalDetail";
  // static String API_GET_FIRE_WATER_DETAIL = BASE_SERVER + "resource/getFireWaterDetail";
  //
  static String API_GET_CODEITEM_BY_TYPENO = BASE_SERVER + "codeItem/getCodeItemByTypeNo";
  // static String API_ADD_ALARM_INSTRUMENT = BASE_SERVER + "alarm/addAlarmInstrument";
  //
  // static String QUERY_DEPT_BY_USER = BASE_SERVER + "resource/dept_by_user";
  //
  static String GET_USER_INFO = BASE_SERVER + "user/getUserInfo";
  // static String API_GET_DEPT_TREE = BASE_SERVER + "basic/getDeptWithNextLevel";
  // static String API_SEARCH_DEPT = BASE_SERVER + "basic/searchByKeyword";
  // static String API_ALARM_TEXT = BASE_SERVER + "alarm/addAlarmText";
  // static String API_REPORT_LOCATION = BASE_SERVER + "alarm/reportLocation";
  // static String GET_ALARM_BOOKLIST = BASE_SERVER + "alarm/getAlarmBookList";
  // static String API_FILE_UPLOAD = "/ers-file-server/file/upload";
  // //新的文件上传的接口 （接口提供人 郑现友）
  // static String API_FILE_UPLOADNEW="/police-app/app-server/file/upload";
  //
  //
  static String GET_URL_TRANSFORM =  BASE_SERVER + "system/getUrlTransform";
  // //<-------------加入作战（接口提供人 郑现友）
  // static String GET_JOINALARM = BASE_SERVER + "report/joinAlarm";
  // //<-------------退出作战（接口提供人 郑现友）
  // static String GET_QUITALARM = BASE_SERVER + "report/quitAlarm";
  //
  // //<------------请求现场列表（最新的数据 郑现友）
  // static String GET_GETCURSCENE = BASE_SERVER + "alarm/getScene";
  // //<--------请求现场数据（历史数据 郑现友）
  // static String GET_GETSCENELIST = BASE_SERVER + "alarm/getSceneList";
  //
  // static const String UPDATE_USER_CONFIG_INFO =  BASE_SERVER + "user/updateUserConfigInfo";
  //
  // static const String REPORT_PERSON_GPS =  BASE_SERVER + "report/reportPersonGPS";
  // static const String REPORT_TEAM_GPS =  BASE_SERVER + "report/reportTeamGPS";
  // static const String REPORT_VEHICLE_GPS =  BASE_SERVER + "report/reportVehicleGPS";
  //
  // // 获取现场实况
  // static const String GET_ALARM_LIVE = BASE_SERVER + "alarm/getAlarmLive";
  // // 获取文电信息
  // static const String GET_ALARM_TELEGRAPH = BASE_SERVER + "alarm/getAlarmText";
  //
  // //<--------提交数据现场实况（接口提供人 郑现友）
  // static String API_REPORT_ALARM_LIVE = BASE_SERVER + "report/reportAlarmLive";
  //
  //
  //
  // static const String API_RYXX_LIST = BASE_SERVER + "ryxx/ryxxList";
  //
  // //<--------获取人员信息详情（接口提供人 袁吉）
  // static String  API_GET_PERSON_DETAIL = BASE_SERVER + "ryxx/ryxxDetails";
  //
  //
  // static const String API_UPDATE_RYZT = BASE_SERVER + "ryxx/updateRyzt";
  //
  // // 提交人员信息
  // static const String API_UPDATE_RYXX = BASE_SERVER + "ryxx/modifyRyxx";
  // // 删除人员信息
  // static const String API_DELETE_RYXX = BASE_SERVER + "ryxx/deleteRyxx";

  //车辆信息
  static const  String GET_CAR_LIST = BASE_SERVER+"basic/getVehiclePage";
  static const  String GET_CAR_DETAIL = BASE_SERVER+"basic/getVehicleDetail";
  static const  String UPDATE_CAR_STATUS = BASE_SERVER+"basic/updateVehicleState";
  static const  String DELETE_CAR = BASE_SERVER+"basic/deleteVehicle";
  static const  String ADD_OR_UPDATE_CAR = BASE_SERVER+"basic/modifyVehicle";

}
