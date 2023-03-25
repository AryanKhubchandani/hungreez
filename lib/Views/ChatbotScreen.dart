import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/foundation.dart';
import 'package:hungreez/Widgets/Chat.dart';
import 'package:hungreez/constants.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungreez/Models/Cart.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({Key? key}) : super(key: key);

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  CartController controller = Get.find();
  bool isVoice = true;
  bool isListening = false;
  bool isComplete = false;
  bool placedOrder = false;
  String _text = "";
  List<Map> messsages = [];
  late stt.SpeechToText _speech;
  late DialogFlowtter instance;
  final messageController = TextEditingController();

  @override
  void initState() {
    getInstance();
    _speech = stt.SpeechToText();
    messsages
        .add({"data": 0, "message": "Hey There! Please place your order."});
    super.initState();
  }

  @override
  void dispose() {
    instance.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) => chat(
                        messsages[index]["message"].toString(),
                        messsages[index]["data"]))),
            Column(
              children: [
                Container(
                  child: ListTile(
                    title: Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: const BoxDecoration(
                          color: Color(0xffF2F4F6),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: TextFormField(
                        controller: messageController,
                        decoration: const InputDecoration(
                            hintText: "Send Message",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none),
                        cursorColor: clr1,
                        onChanged: (val) {
                          if (messageController.text.isEmpty) {
                            setState(() {
                              isVoice = true;
                            });
                          } else {
                            setState(() {
                              isVoice = false;
                            });
                          }
                        },
                      ),
                    ),
                    trailing: isVoice
                        ? isListening
                            ? FloatingActionButton(
                                backgroundColor: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    isListening = false;
                                    isComplete = true;
                                  });
                                },
                                child: const Icon(
                                  Icons.mic,
                                  color: Colors.deepOrangeAccent,
                                ),
                              )
                            : FloatingActionButton(
                                heroTag: "btn1",
                                backgroundColor: Colors.white,
                                child: const Icon(
                                  Icons.mic_none_rounded,
                                  color: Colors.deepOrangeAccent,
                                ),
                                onPressed: () {
                                  setState(() {
                                    messageController.text = "";
                                    _listen();
                                    isListening = true;
                                  });
                                })
                        : GestureDetector(
                            child: const Chip(
                              label: Icon(Icons.send_outlined, color: clr1),
                              labelPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 6),
                              backgroundColor: Colors.white,
                              elevation: 4.0,
                            ),
                            onTap: () {
                              getResponse();
                              setState(() {
                                messsages.insert(0, {
                                  "data": 1,
                                  "message": messageController.text
                                });
                                isVoice = true;
                              });
                              if (placedOrder == false) {
                                _text = messageController.text;
                                placedOrder = true;
                              }
                              messageController.clear();
                            },
                          ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void addSpecialItem(int number) {
    Order _order = Order(
        name: "Today's Special", price: 200, quantity: number.obs, time: 10);
    controller.cart.add(_order);
    controller.total.value += 200 * number;
  }

  Future<void> getInstance() async {
    instance = await DialogFlowtter.fromFile(
        path: "assets/pizza100-358205-a93ba59c1eed.json",
        sessionId: "fneuy28gfeuw3rfg");
  }

  Future<void> getResponse() async {
    DetectIntentResponse response = await instance.detectIntent(
      queryInput: QueryInput(text: TextInput(text: messageController.text)),
    );
    print(response.queryResult?.parameters.toString());
    if (response.queryResult?.intent?.displayName == "Adding_Weekday_Special") {
      try {
        int number = response.queryResult?.parameters!["number"] ?? 0;
        if (number != 0) addSpecialItem(number);
      } catch (e) {
        if (kDebugMode) print(e);
      }
    }
    String? textResponse = response.text;
    setState(() {
      messsages.insert(0, {"data": 0, "message": textResponse});
    });
  }

  void _listen() async {
    if (!isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) {
          print('onStatus: $val');
          if (val == "done") {
            setState(() {
              isComplete = true;
              isListening = false;
              isVoice = false;
            });
          }
        },
        onError: (val) {},
      );
      if (available) {
        setState(() => isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            messageController.text = _text;
          }),
        );
      }
    } else {
      setState(() => isListening = false);
      _speech.stop();
    }
  }
}
