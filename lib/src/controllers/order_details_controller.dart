import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:products_deliveryboy/src/models/order_list.dart';
import 'package:products_deliveryboy/src/repository/user_repository.dart';
import '../repository/order_repository.dart' as repository;

class OrderDetailsController extends ControllerMVC {
  double taxAmount = 0.0;
  double subTotal = 0.0;
  double deliveryFee = 0.0;
  double total = 0.0;
  GlobalKey<ScaffoldState> scaffoldKey;
  OrderList orderData = new OrderList();
  bool orderDetailLoader = false;
  OrderDetailsController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();

  }


  updateData(id, status) {

    FirebaseFirestore.instance.collection('orderDetails').doc(id).update({'driverStatus': status}).catchError((e) {
      print(e);
    });
  }


  statusAccepted(status,orderId,otp){
    updateData(orderId, status);
    repository.status(status, orderId, otp).then((value) {

      Fluttertoast.showToast(
        msg: 'Update Successfully',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
      );


    });
  }

  statusStart(status, orderId, otp, stateData, orderDetails) async {
      if(status=='Start') {
          if(currentUser.value.liveStatus==true ) {
            repository.status(status, orderId, otp).then((value) {
              updateData(orderId, status);
              Fluttertoast.showToast(
                msg: 'Update Successfully',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
              );
              currentUser.value.currentOrderID = orderId;
              if(currentUser.value.latitude!=null && currentUser.value.longitude!=null) {

               Navigator.of(context).pushNamed(
                    '/Map', arguments: orderDetails);
              } else{
                Fluttertoast.showToast(
                  msg: 'Restart your driving mode',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                );
              }
              return value;
            });
          } else {
            Fluttertoast.showToast(
              msg: 'Please turn on your driving mode',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
            );
          }
      }
  }


  statusUpdate(status, orderId, otp, stateData, orderDetails) async {
    bool state;
    if(currentUser.value.liveStatus==true ) {
    repository.status(status, orderId, otp).then((value) {
      updateData(orderId, status);
      state = value;
      if (value == true) {
        Fluttertoast.showToast(
          msg: 'Order is  ' + status + ' successfully',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
        );
                print(status);

        if (status == 'delivered') {
          setState(() {
            stateData = 'delivered';
          });
        //  Navigator.of(context).pushReplacementNamed('/Pages', arguments: 1);
        }


      }
     else {
        // ignore: deprecated_member_use
        scaffoldKey?.currentState?.showSnackBar(SnackBar(
          content: Text('Otp is not matched'),
        ));
      //  Navigator.pop(context, "success");
      }
      return value;
    });
    } else {
      Fluttertoast.showToast(
        msg: 'Please on your driving mode',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
      );
    }

    if (state == true) {
      return true;
    } else {
      return false;
    }
  }

  listenForOrderDetails(id){

    repository.getOrderDetails(id).then((value) {

      setState(() {
        orderData = value;
        orderDetailLoader = true;
      });
    }).catchError((e) {

    }).whenComplete(() {

    });
  }
}
