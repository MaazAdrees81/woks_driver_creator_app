

class Registermodel {
  String firstname;
  String lastname;
  String dob;
  String gender;
  String address1;
  String address2;
  String city;
  String state;
  int zipcode;
  double latitude;
  double longtitude;
  String email;
  int mobile;
  String password;
  String profile;
  String licenseno;
  String aboutyou;
  String drivingMode;
  String storeId;


  Registermodel();

  Registermodel.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      firstname = jsonMap['firstname'];
      lastname = jsonMap['lastname'] != null ? jsonMap['lastname'].toString() : null;
      dob = jsonMap['dob'];
      drivingMode = jsonMap['drivingMode'];
      storeId = jsonMap['storeId'];
      gender = jsonMap['gender'] != null ? jsonMap['gender'] : null;
      address1 = jsonMap['address1'] != null ? jsonMap['address1'] : null;
      address2 = jsonMap['address2'];
      city = jsonMap['city'];
      state = jsonMap['state'];
      zipcode = jsonMap['zipcode'];
      latitude = jsonMap['latitude'];
      longtitude = jsonMap['longtitude'];
      email = jsonMap['email'];
      mobile = jsonMap['mobile'];
      password = jsonMap['password'];
      profile = jsonMap['profile'];
      licenseno = jsonMap['licenseno'];
      aboutyou = jsonMap['aboutyou'];


    } catch (e) {
      firstname = '';
      lastname = '';
      drivingMode = '';
      storeId = '';
      dob = '';
      gender = '';
      address1 = '';
      address2 = '';
      city = '';
      state = '';
      zipcode = 0;
      latitude = 0.0;
      longtitude = 0.0;
      email = '';
      mobile = 0;
      password = '';
      profile = '';
      licenseno = '';
      aboutyou = '';

      print(e);
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["firstname"] = firstname;
    map["lastname"] = lastname;
    map["dob"] = dob;
    map["gender"] = gender;
    map["address1"] = address1;
    map["address2"] = address2;
    map["city"] = city;
    map["state"] = state;
    map["zipcode"] = zipcode;
    map["latitude"] = latitude;
    map["longtitude"] = longtitude;
    map["email"] = email;
    map["mobile"] = mobile;
    map["password"] = password;
    map["profile"] = profile;
    map["licenseno"] = licenseno;
    map["drivingMode"] = drivingMode;
    map["storeId"] = storeId;


    return map;
  }
}
