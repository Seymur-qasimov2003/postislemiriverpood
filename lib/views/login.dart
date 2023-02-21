import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';

import '../riverpood/riverpoodmanegement.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool _isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller:
                      ref.watch(loginRiverpodProvider).usernameController,
                  decoration: const InputDecoration(
                    hintText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller:
                      ref.watch(loginRiverpodProvider).passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isloading
                        ? null
                        : () async {
                            ref
                                .read(loginRiverpodProvider.notifier)
                                .loginCall();
                            setState(() {
                              _isloading = true;
                            });
                            Future.delayed(Duration(seconds: 4), () {
                              setState(() {
                                _isloading = false;
                              });
                            });
                          },
                    child: const Text('Login'),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SocialMediaRecorder(
                  sendRequestFunction: (soundFile) {
                    print(soundFile);
                  },
                  encode: AudioEncoderType.AAC_HE,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FacebookButton(
                    onPressed: () {},
                  ),
                  TwitterButton(
                    onPressed: () {},
                  ),
                  GithubButton(
                    onPressed: () {},
                  ),
                  InstagramButton(
                    onPressed: () {},
                  ),
                  LinkedinButton(
                    onPressed: () {},
                  ),
                  MicrosoftButton(
                    onPressed: () {},
                  ),
                  GoogleButton(
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
