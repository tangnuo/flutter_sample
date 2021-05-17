/**
 *
 * 创建人：xuqing
 * 创建时间：2020年11月8日11:16:50
 * 类说明：数据模型
 *
 *
 *
 */

class  User{
  String  username;
  String  password;
  User ({this.username,this.password});
  factory User .fromJson(Map<String,dynamic> json) {
    return User (
      username: json['username'],
      password: json['password'],
    );
  }

  Map toJson() {
    Map map = new Map();
    map["username"] = this.username;
    map["password"] = this.password;
    return map;
  }
}