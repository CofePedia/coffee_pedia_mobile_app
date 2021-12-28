
class GetTokenDatabase {


  String? token;

  GetTokenDatabase({
    this.token,
  });
  GetTokenDatabase.fromJson(Map<String, dynamic> json) {
    token = json['token']?.toString();
  }
 
}
