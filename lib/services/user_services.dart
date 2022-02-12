part of 'services.dart';

class UserServices {
  //Srevice  Sign In
  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }
    var url =
        Uri.parse('http://foodmarket-backend.buildwithangga.id/api/login');

    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please Try Again');
    }
    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
  }

// Service SignUp / Register
  static Future<ApiReturnValue<User>> signUp(User user, String password,
      {File? pictureFile, http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }
    var url =
        Uri.parse('http://foodmarket-backend.buildwithangga.id/api/register');

    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          'name': user.name!,
          'email': user.email!,
          'password': password,
          'password_confirmation': password,
          'address': user.address!,
          'city': user.city!,
          'houseNumber': user.houseNumber!,
          'phoneNumber': user.phoneNumber!
        }));
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please Try Again');
    }
    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    // todo: Upload PP
    if (pictureFile != null) {
      ApiReturnValue<String> result = await uploadProfilePicture(pictureFile);
      if (result.value != null) {
        value = value.copyWith(
            picturePath:
                "http://foodmarket-backend.buildwithangga.id/storage/" +
                    result.value!);
      }
    }

    return ApiReturnValue(value: value);
  }

// Upload foto
  static Future<ApiReturnValue<String>> uploadProfilePicture(File pictureFile,
      {http.MultipartRequest? request}) async {
    // String url = baseUrl + '';
    var uri =
        Uri.parse('http://foodmarket-backend.buildwithangga.id/api/user/photo');

    if (request == null) {
      request = http.MultipartRequest("POST", uri)
        ..headers["Content-Type"] = "application/json"
        ..headers["Authorization"] = "Bearer ${User.token}";
    }
    var multipartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);
    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responeBody = await response.stream.bytesToString();
      var data = jsonDecode(responeBody);

      String imagePath = data['data'][0];
      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(message: 'Uploading Profile Picture Failed');
    }
  }
}
