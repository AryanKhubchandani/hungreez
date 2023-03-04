import 'package:hungreez/secrets.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class TwilioSMS {
  void sendSMS(String body, String mobile2) {
    TwilioFlutter twilioFlutter;
    twilioFlutter = TwilioFlutter(
      accountSid: twilio_sid,
      authToken: auth_token,
      twilioNumber: mobile,
    );
    twilioFlutter.sendSMS(toNumber: "+91$mobile2", messageBody: body);
  }
}
