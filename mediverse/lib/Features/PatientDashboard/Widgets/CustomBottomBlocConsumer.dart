import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Core/utils/api_keys.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/models/PaymentIndentInputModel.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/models/amount_model/amount_model.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/models/amount_model/details.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/models/item_list_model/item_list_model.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/models/item_list_model/item_model.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/presentation/Manager/Payment_Cubit/Payment_Stripe_Cubit.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/presentation/Manager/Payment_Cubit/Payment_Stripe_States.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/presentation/Views/BookingScreen.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/presentation/Views/Thank_you_Screen.dart';
import 'package:mediverse/Features/PatientDashboard/MainScreen.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/ConfirmButton.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.isPaypal,
    this.isCash = true,
  });

  final bool isPaypal;
  final bool isCash;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentStripeCubit, PaymentStripeState>(
      listener: (context, state) {
        if (!isCash) {
          if (state is PaymentStripeStateSuccess) {
            // paid in visa
            BlocProvider.of<PaymentStripeCubit>(context)
                .completeBooking('paid in visa');

            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return const ThankYouView(
                isCash: false,
              );
            }));
          }
          if (state is PaymentStripeStateFailure) {
            Navigator.of(context).pop();
            String errMessage = state.errMessage;
            bool firstMatch = errMessage.contains("Canceled");
            if (!firstMatch) {
              SnackBar snackBar = SnackBar(
                  content: Text(
                state.errMessage,
              ));

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }
        } else {
          //paid in cash
          BlocProvider.of<PaymentStripeCubit>(context)
                .completeBooking('paid in cash');

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ThankYouView(
                  isCash: true,
                ),
              ));
        }
      },
      builder: (context, state) {
        return ConfirmButton(
          text: "Continue",
          isLoading: state is PaymentStripeStateLoading ? true : false,
          onTap: () {
            if (isPaypal) {
              var transctionsData = getTranscationData();
              exceutePaypalPayment(context, transctionsData);
            } else if (isCash) {
              // paid in cash
              BlocProvider.of<PaymentStripeCubit>(context)
                .completeBooking('paid in cash');

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThankYouView(
                      isCash: true,
                    ),
                  ));
            } else {
              excuteStripePayment(context);
            }
          },
        );
      },
    );
  }

  ({AmountModel amount, ItemListModel itemList}) getTranscationData() {
    var amount = AmountModel(
      total: "100",
      currency: "USD",
      details: Details(
        shipping: "0",
        shippingDiscount: 0,
        subtotal: "100",
      ),
    );
    List<OrderItemModel> orders = [
      OrderItemModel(
        name: "App",
        quantity: 1,
        currency: "USD",
        price: "100",
      ),
    ];
    ItemListModel itemListModel = ItemListModel(orders: orders);
    return (amount: amount, itemList: itemListModel);
  }

  void excuteStripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
        //7ottttttttttttttt hnaaaaaaaaaaaaaaaa al Customerrrrrrrrrrrrrrrrrr idddddddddddddddddd ali fe  fire store
        amount: '100',
        currency: 'egp',
        customerId: 'cus_Pe80vi7rQ3kLfY');
    BlocProvider.of<PaymentStripeCubit>(context)
        .makePayment(paymentIntentInputModel: paymentIntentInputModel);
  }

  void exceutePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transctionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientID,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": transctionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transctionsData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          
          //paid in paypal
          BlocProvider.of<PaymentStripeCubit>(context)
                .completeBooking('paid in paypal');
          
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return const ThankYouView(
                isCash: false,
              );
            }),
            (route) {
              if (route.settings.name == '/') {
                return true;
              } else {
                return false;
              }
            },
          );
        },
        onError: (error) {
          log("onError $error");
          SnackBar snackBar = SnackBar(content: Text(error.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return MainScreenWidget();
            }),
            (route) {
              return false;
            },
          );
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }
}
