import 'package:flutter/material.dart';
import 'package:job_studio/common/app_style.dart';
import 'package:job_studio/common/height_spacer.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/models/auth/otp_model.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../common/buttons/custom_button.dart';
import '../../controllers/auth/otp_provider.dart';

class OtpVerificarionPage extends StatefulWidget {
  final String email;
  const OtpVerificarionPage({Key? key, required this.email}) : super(key: key);

  @override
  State<OtpVerificarionPage> createState() => _OtpVerificarionPageState();
}

class _OtpVerificarionPageState extends State<OtpVerificarionPage> {
  String otpValue = "";

  @override
  void initState() {
    super.initState();
    Provider.of<OtpProviderNotifer>(context, listen: false).startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OtpProviderNotifer>(builder: (context, otpNotifer, child) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
          ),
          elevation: 0,
        ),
        body: Container(
          // color: Colors.amberAccent,
          margin: const EdgeInsets.only(left: 25, right: 25),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Phone Verification",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const HeightSpacer(size: 10),
                Image.asset(
                  'images/otp.jpg',
                  fit: BoxFit.cover,
                  height: 300,
                ),
                const HeightSpacer(size: 20),
                const Text(
                  "We need to register your email without getting started!",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const HeightSpacer(size: 30),
                Pinput(
                  length: 6,
                  showCursor: true,
                  onCompleted: (pin) {
                    otpValue = pin;
                  },
                ),
                const HeightSpacer(size: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time Remaining: ${otpNotifer.seconds}',
                      style:
                          appStyle(12, Color(kMidGrey.value), FontWeight.w500),
                    ),
                    TextButton(
                        onPressed: () {
                          otpNotifer.resendOtp(email: widget.email);
                        },
                        child: Text("Resend Otp",
                            style: appStyle(
                                14,
                                otpNotifer.isResendOtp
                                    ? Color(kDark.value)
                                    : Color(kLightGrey.value),
                                FontWeight.w500))),
                  ],
                ),
                const HeightSpacer(size: 10),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: CustomButton(
                    onTap: () {
                      otpNotifer.isLoading = true;
                      OtpModel model =
                          OtpModel(otp: otpValue, email: widget.email);
                      otpNotifer.otpVarify(model);
                    },
                    isLoading: otpNotifer.isLoading,
                    height: height * 0.06,
                    text: "Submit",
                    width: width,
                    textColor: Color(kLight.value),
                    radius: 6,
                    backgroundColor: Color(kPink.value),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
