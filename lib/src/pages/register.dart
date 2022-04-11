import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:products_deliveryboy/generated/l10n.dart';
import 'package:products_deliveryboy/src/controllers/user_controller.dart';
import 'package:products_deliveryboy/src/repository/settings_repository.dart';

import 'Widget/bezierContainer.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends StateMVC<Register> {
  int _currentStep = 0;
  int dropDownValue = 0;
  TextEditingController _controllerAddress1 = new TextEditingController();
  TextEditingController _controllerAddress2 = new TextEditingController();
  TextEditingController _controllerCity = new TextEditingController();
  TextEditingController _controllerState = new TextEditingController();
  TextEditingController _controllerZipcode = new TextEditingController();
  UserController _con;

  _RegisterState() : super(UserController()) {
    _con = controller;
  }
  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();

    _con.registerData.gender = 'Male';
    _con.registerData.dob = "${pickedDate.year},${pickedDate.month}, ${pickedDate.day}";
    _con.registerData.drivingMode = '1';
  }

  DateTime pickedDate;
  AnimationController controller1;
  Animation<double> scaleAnimation;
  String _gender = 'Male';
  String _drivingMode = '1';

  // ignore: non_constant_identifier_names
  void Imagepickerbottomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                new ListTile(
                  leading: new Icon(Icons.camera),
                  title: new Text('Camera'),
                  onTap: () => getImage(),
                ),
                /** new ListTile(
                  leading: new Icon(Icons.image),
                  title: new Text('Gallery'),
                  onTap: () => getImagegaller(),
                ),*/
              ],
            ),
          );
        });
  }

  int selectedRadio;
  File _image;
  int currStep = 0;
  final picker = ImagePicker();

  Future getImage() async {
    try {
      final pickedFile = await picker.getImage(source: ImageSource.camera, maxHeight: 480, maxWidth: 640, imageQuality: 50);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          Navigator.of(context).pop();
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {
      print(e.code);
    }
  }

  Future getImagegaller() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        Navigator.of(context).pop();
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImagefromGallery() async {
    await ImagePicker().getImage(source: ImageSource.gallery);
    /** setState(() {
      _image = File(image.path);
    }); */
  }

  _pickDate() async {
    Theme.of(context).copyWith(
      primaryColor: Colors.amber,
    );
    DateTime date = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 70),
        lastDate: DateTime(DateTime.now().year + 1),
        initialDate: pickedDate,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Theme.of(context).accentColor,
              accentColor: Theme.of(context).accentColor,
              colorScheme: ColorScheme.light(primary: Theme.of(context).accentColor),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child,
          );
        });
    if (date != null)
      setState(() {
        pickedDate = date;
        _con.registerData.dob = "${pickedDate.year},${pickedDate.month}, ${pickedDate.day}";
      });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _con.scaffoldKey,
      body: Theme(
        data: ThemeData(primaryColor: Theme.of(context).accentColor, buttonColor: Theme.of(context).accentColor, canvasColor: Theme.of(context).primaryColor),
        child: Container(
          height: height,
          child: Stack(children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .15),
            SafeArea(
              child: Container(
                width: double.infinity, //To make it use as much space as it wants
                height: MediaQuery.of(context).size.height,
                child: Column(children: <Widget>[
                  ListTile(
                    // onTap: () {
                    //   Navigator.pop(context);
                    // },
                    title: Text(S.of(context).register, style: Theme.of(context).textTheme.headline4),
                    // leading: Icon(
                    //   Icons.arrow_back_ios,
                    //   color: Theme.of(context).backgroundColor,
                    // ),
                  ),
                  Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02, bottom: MediaQuery.of(context).size.height * 0.09), child: Container()),
                  Expanded(
                    child: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                      return Stepper(
                        type: StepperType.vertical,
                        currentStep: _currentStep,
                        onStepTapped: (int step) => setState(() => _currentStep = step),
                        onStepContinue: _currentStep < 4
                            ? () => setState(() {
                                  if (_currentStep < 4) {
                                    if (_con.formKeys[_currentStep].currentState.validate()) {
                                      _con.formKeys[_currentStep].currentState.save();

                                      if (_currentStep == 1) {
                                        _con.getLatLong();
                                      }

                                      if (_currentStep == 3) {
                                        if (_image != null) {
                                          _con.register(_image);
                                          print(_currentStep);
                                        } else {
                                          // ignore: deprecated_member_use
                                          _con.scaffoldKey?.currentState?.showSnackBar(SnackBar(
                                            content: Text('Upload your pic'),
                                          ));
                                        }
                                      } else {
                                        _currentStep += 1;
                                      }
                                    }
                                  }

                                  //print(_con.registerData.toMap());
                                })
                            : null,
                        onStepCancel: _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,
                        controlsBuilder: (context, details) => Container(
                          height: 70,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              _currentStep == 0
                                  ? Text("")
                                  // ignore: deprecated_member_use
                                  : RaisedButton(
                                      onPressed: details.onStepCancel,
                                      textColor: Colors.white,
                                      textTheme: ButtonTextTheme.normal,
                                      child: Row(children: <Widget>[const Icon(Icons.chevron_left), Text("PREV")]),
                                    ),
                              // ignore: deprecated_member_use
                              RaisedButton(
                                onPressed: details.onStepContinue,
                                textColor: Colors.white,
                                textTheme: ButtonTextTheme.normal,
                                child: Row(children: <Widget>[
                                  _currentStep >= 4 ? Icon(Icons.done) : Icon(Icons.chevron_right),
                                  _currentStep > 4 ? Text("DONE") : Text("NEXT"),
                                ]),
                              ),
                            ],
                          ),
                        ),
                        steps: <Step>[
                          Step(
                            title: Text(
                              "GENERAL",
                            ),
                            content: Form(
                              key: _con.formKeys[0],
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                      textAlign: TextAlign.left,
                                      onSaved: (input) => _con.registerData.firstname = input,
                                      validator: (input) => input.length < 3 ? S.of(context).should_be_more_than_3_characters : null,
                                      autocorrect: true,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: 'First Name',
                                        hintStyle: Theme.of(context).textTheme.caption,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey[300],
                                            width: 1.0,
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Theme.of(context).accentColor,
                                            width: 1.0,
                                          ),
                                        ),
                                      )),
                                  SizedBox(height: 5),
                                  Container(
                                      width: double.infinity,
                                      height: 70,
                                      child: TextFormField(
                                          textAlign: TextAlign.left,
                                          autocorrect: true,
                                          onSaved: (input) => _con.registerData.lastname = input,
                                          validator: (input) => input.length < 3 ? S.of(context).should_be_more_than_3_characters : null,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            hintText: 'Last Name',
                                            hintStyle: Theme.of(context).textTheme.caption,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.grey[300],
                                                width: 1.0,
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Theme.of(context).accentColor,
                                                width: 1.0,
                                              ),
                                            ),
                                          ))),
                                  SizedBox(height: 5),
                                  Container(
                                    width: double.infinity,
                                    height: 70,
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      Text(
                                        "DOB",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      InkWell(
                                        onTap: _pickDate,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${pickedDate.year},${pickedDate.month}, ${pickedDate.day}",
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            Icon(Icons.arrow_drop_down)
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 0, right: 0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                //                    <--- top side
                                                color: Colors.grey[300],
                                                width: 2.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                  SizedBox(height: 5),
                                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                    Text(
                                      "Gender",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ]),
                                  Container(
                                    width: double.infinity,
                                    child: DropdownButton(
                                        value: _gender,
                                        isExpanded: true,
                                        focusColor: Theme.of(context).accentColor,
                                        underline: Container(
                                          color: Colors.grey[300],
                                          height: 1.0,
                                        ),
                                        items: [
                                          DropdownMenuItem(
                                            child: Text("Male"),
                                            value: 'Male',
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Female"),
                                            value: 'Female',
                                          ),
                                          DropdownMenuItem(child: Text("Transgender"), value: 'Transgender'),
                                          DropdownMenuItem(child: Text("Others"), value: 'Others')
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            _gender = value;
                                            _con.registerData.gender = value;
                                            print(_con.registerData.lastname);
                                          });
                                        }),
                                  ),
                                  SizedBox(height: 5),
                                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                    Text(
                                      "Driving Mode",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ]),
                                  Container(
                                    width: double.infinity,
                                    child: DropdownButton(
                                        value: _drivingMode,
                                        isExpanded: true,
                                        focusColor: Theme.of(context).accentColor,
                                        underline: Container(
                                          color: Colors.grey[300],
                                          height: 1.0,
                                        ),
                                        items: [
                                          DropdownMenuItem(
                                            child: Text("Freelancer"),
                                            value: '1',
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Shop"),
                                            value: '2',
                                          ),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            _drivingMode = value;
                                            _con.registerData.drivingMode = value;
                                          });
                                        }),
                                  ),
                                  SizedBox(height: 5),
                                  _drivingMode == '2'
                                      ? Container(
                                          width: double.infinity,
                                          height: 70,
                                          child: TextFormField(
                                              textAlign: TextAlign.left,
                                              autocorrect: true,
                                              onSaved: (input) => _con.registerData.storeId = input,
                                              validator: (input) => input.length < 2 ? 'Enter your Store ID' : null,
                                              keyboardType: TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                              decoration: InputDecoration(
                                                hintText: 'Store ID',
                                                hintStyle: Theme.of(context).textTheme.caption,
                                                enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.grey[300],
                                                    width: 1.0,
                                                  ),
                                                ),
                                                focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Theme.of(context).accentColor,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              )))
                                      : Container(),
                                ],
                              ),
                            ),
                            isActive: _currentStep >= 0,
                            state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
                          ),
                          Step(
                            title: Text(
                              S.of(context).address,
                            ),
                            content: Form(
                              key: _con.formKeys[1],
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                                SizedBox(height: 20),
                                Container(
                                    width: double.infinity,
                                    height: 70,
                                    child: TextFormField(
                                        controller: _controllerAddress1,
                                        textAlign: TextAlign.left,
                                        onSaved: (input) => _con.registerData.address1 = input,
                                        validator: (input) => input.length < 1 ? 'Please enter your address' : null,
                                        autocorrect: true,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          hintText: '${S.of(context).address} 1',
                                          hintStyle: Theme.of(context).textTheme.caption,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey[300],
                                              width: 1.0,
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Theme.of(context).accentColor,
                                              width: 1.0,
                                            ),
                                          ),
                                        ))),
                                SizedBox(height: 5),
                                Container(
                                    width: double.infinity,
                                    height: 70,
                                    child: TextFormField(
                                        controller: _controllerAddress2,
                                        textAlign: TextAlign.left,
                                        autocorrect: true,
                                        onSaved: (input) => _con.registerData.address2 = input,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          hintText: '${S.of(context).address} 2',
                                          hintStyle: Theme.of(context).textTheme.caption,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey[300],
                                              width: 1.0,
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Theme.of(context).accentColor,
                                              width: 1.0,
                                            ),
                                          ),
                                        ))),
                                SizedBox(height: 5),
                                Container(
                                    width: double.infinity,
                                    height: 70,
                                    child: TextFormField(
                                        controller: _controllerCity,
                                        onSaved: (input) => _con.registerData.city = input,
                                        textAlign: TextAlign.left,
                                        autocorrect: true,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          hintText: 'City',
                                          hintStyle: Theme.of(context).textTheme.caption,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey[300],
                                              width: 1.0,
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Theme.of(context).accentColor,
                                              width: 1.0,
                                            ),
                                          ),
                                        ))),
                                SizedBox(height: 5),
                                Container(
                                    width: double.infinity,
                                    height: 70,
                                    child: TextFormField(
                                        controller: _controllerState,
                                        onSaved: (input) => _con.registerData.state = input,
                                        textAlign: TextAlign.left,
                                        autocorrect: true,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          hintText: 'State',
                                          hintStyle: Theme.of(context).textTheme.caption,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey[300],
                                              width: 2.0,
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Theme.of(context).accentColor,
                                              width: 2.0,
                                            ),
                                          ),
                                        ))),
                                SizedBox(height: 5),
                                Container(
                                    width: double.infinity,
                                    height: 70,
                                    child: TextFormField(
                                        controller: _controllerZipcode,
                                        // onSaved: (input) => _con.registerData.zipcode = int.parse(input),
                                        onSaved: (input) => _con.registerData.zipcode = input,
                                        textAlign: TextAlign.left,
                                        autocorrect: true,
                                        keyboardType: TextInputType.text,
                                        // keyboardType: TextInputType.number,
                                        // inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                        decoration: InputDecoration(
                                          hintText: 'Zipcode',
                                          hintStyle: Theme.of(context).textTheme.caption,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey[300],
                                              width: 2.0,
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Theme.of(context).accentColor,
                                              width: 2.0,
                                            ),
                                          ),
                                        ))),
                                SizedBox(height: 5),
                                InkWell(
                                  onTap: () async {
                                    LocationResult result = await showLocationPicker(
                                      context,
                                      setting.value.googleMapsKey,
                                      initialCenter: LatLng(31.1975844, 29.9598339),
                                      automaticallyAnimateToCurrentLocation: true,
                                      myLocationButtonEnabled: true,
                                      layersButtonEnabled: true,
                                      resultCardAlignment: Alignment.bottomCenter,
                                    );

                                    var addresses = await Geocoder.local.findAddressesFromQuery(result.address);
                                    var first = addresses.first;
                                    _controllerAddress1.text = '${first.thoroughfare}';
                                    _controllerAddress2.text = first.subLocality;
                                    _controllerCity.text = first.locality;
                                    _controllerState.text = first.adminArea;
                                    _controllerZipcode.text = first.postalCode;

                                    // Navigator.of(widget.scaffoldKey.currentContext).pop();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Get Address From Map', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 16)),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                            isActive: _currentStep >= 1,
                            state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
                          ),
                          Step(
                            title: Text(
                              "REGISTER",
                            ),
                            content: Form(
                              key: _con.formKeys[2],
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                                SizedBox(height: 20),
                                Container(
                                    width: double.infinity,
                                    height: 70,
                                    child: TextFormField(
                                        onSaved: (input) => _con.registerData.email = input,
                                        validator: (input) => !input.contains('@') ? S.of(context).should_be_valid_email : null,
                                        textAlign: TextAlign.left,
                                        autocorrect: true,
                                        keyboardType: TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          hintText: S.of(context).email,
                                          hintStyle: Theme.of(context).textTheme.caption,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey[300],
                                              width: 1.0,
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Theme.of(context).accentColor,
                                              width: 1.0,
                                            ),
                                          ),
                                        ))),
                                SizedBox(height: 5),
                                Container(
                                    width: double.infinity,
                                    height: 70,
                                    child: TextFormField(
                                        onSaved: (input) => _con.registerData.mobile = int.parse(input),
                                        validator: (input) => input.length < 3 ? 'Please enter your valid mobile number' : null,
                                        textAlign: TextAlign.left,
                                        autocorrect: true,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                        decoration: InputDecoration(
                                          hintText: S.of(context).mobile,
                                          hintStyle: Theme.of(context).textTheme.caption,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey[300],
                                              width: 1.0,
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Theme.of(context).accentColor,
                                              width: 1.0,
                                            ),
                                          ),
                                        ))),
                                SizedBox(height: 5),
                                Container(
                                    width: double.infinity,
                                    height: 70,
                                    child: TextFormField(
                                        onSaved: (input) => _con.registerData.password = input,
                                        validator: (input) => input.length < 3 ? S.of(context).should_be_more_than_3_characters : null,
                                        textAlign: TextAlign.left,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          hintText: S.of(context).password,
                                          hintStyle: Theme.of(context).textTheme.caption,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey[300],
                                              width: 1.0,
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Theme.of(context).accentColor,
                                              width: 1.0,
                                            ),
                                          ),
                                        ))),
                              ]),
                            ),
                            isActive: _currentStep >= 2,
                            state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
                          ),
                          Step(
                            title: Text(
                              "PROFILE",
                            ),
                            content: Form(
                              key: _con.formKeys[3],
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                                SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () {
                                    Imagepickerbottomsheet();
                                  },
                                  child: Container(
                                    child: Card(
                                      child: new CircleAvatar(
                                        backgroundImage: _image == null ? new AssetImage('assets/img/userImage.png') : FileImage(_image),
                                        radius: 40.0,
                                      ),
                                      elevation: 5.0,
                                      shape: CircleBorder(),
                                      clipBehavior: Clip.antiAlias,
                                    ),
                                  ),
                                ),
                                Container(
                                    width: double.infinity,
                                    height: 70,
                                    child: TextFormField(
                                        textAlign: TextAlign.left,
                                        autocorrect: true,
                                        onSaved: (input) => _con.registerData.licenseno = input,
                                        validator: (input) => input.length < 1 ? 'Please enter your Driving Licence' : null,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          hintText: 'Driving Licence No',
                                          hintStyle: Theme.of(context).textTheme.caption,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey[300],
                                              width: 2.0,
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Theme.of(context).accentColor,
                                              width: 2.0,
                                            ),
                                          ),
                                        ))),
                                SizedBox(height: 5),
                                Container(
                                    width: double.infinity,
                                    height: 70,
                                    child: TextFormField(
                                        textAlign: TextAlign.left,
                                        autocorrect: true,
                                        onSaved: (input) => _con.registerData.aboutyou = input,
                                        validator: (input) => input.length < 1 ? 'Please enter about you' : null,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          hintText: S.of(context).about,
                                          hintStyle: Theme.of(context).textTheme.caption,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey[300],
                                              width: 2.0,
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Theme.of(context).accentColor,
                                              width: 2.0,
                                            ),
                                          ),
                                        ))),
                              ]),
                            ),
                            isActive: _currentStep >= 3,
                            state: _currentStep >= 3 ? StepState.complete : StepState.disabled,
                          ),
                        ],
                      );
                    }),
                  )
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
