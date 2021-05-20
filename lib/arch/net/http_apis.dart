class HttpApi {
  static const String BASE_SERVER = "police-app/app-server/";

  static String BASE_URL = "http://dolphin-dev.kedacom.com/";

  static String LOGIN_IN = BASE_SERVER + "oauth2/password";

  static String API_GET_CODEITEM_BY_TYPENO = BASE_SERVER + "codeItem/getCodeItemByTypeNo";

  static String GET_USER_INFO = BASE_SERVER + "user/getUserInfo";

  static String GET_URL_TRANSFORM =  BASE_SERVER + "system/getUrlTransform";

  //车辆信息
  static const  String GET_CAR_LIST = BASE_SERVER+"basic/getVehiclePage";
  static const  String GET_CAR_DETAIL = BASE_SERVER+"basic/getVehicleDetail";
  static const  String UPDATE_CAR_STATUS = BASE_SERVER+"basic/updateVehicleState";
  static const  String DELETE_CAR = BASE_SERVER+"basic/deleteVehicle";
  static const  String ADD_OR_UPDATE_CAR = BASE_SERVER+"basic/modifyVehicle";

}
