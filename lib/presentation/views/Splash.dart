// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/presentation/views/character_list.dart';

import '../../controllers/characters_controller.dart';
import '../../domain/repositories/character_repository.dart';
import '../../domain/services/api_service.dart';
import '../widgets/animation.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late Animation<double> opacity;
  late AnimationController controller;
  final RxBool image = true.obs;
  final RxBool textFinal = true.obs;
  // ignore: use_function_type_syntax_for_parameters

  var allingTextTitle = TextAlign.center;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }

  void navigationPage() {
    final apiService = ApiService();
    final charactersRepository = CharactersRepository(apiService);
    final charactersController = Get.put(
        CharactersController(charactersRepository: charactersRepository));
    Get.to(CharactersList(charactersController: charactersController));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1500), () {
      image.value = false;
    });
    Future.delayed(const Duration(milliseconds: 1800), () {
      textFinal.value = false;
    });
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Container(
          height: height,
          decoration: const BoxDecoration(
            color: Color(0xffD40317),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Obx(() {
                    return AnimatedCrossFade(
                        firstChild: Container(),
                        secondChild: Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              'assets/images/telarana.png',
                              width: 200,
                            )),
                        crossFadeState: textFinal.value
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 300));
                  }),
                ),
                const Expanded(
                  flex: 5,
                  child: AnimationWidget(),
                ),
                Expanded(
                  flex: 5,
                  child: Obx(() {
                    return AnimatedCrossFade(
                        firstChild: Container(),
                        secondChild: Align(
                            alignment: Alignment.bottomLeft,
                            child: Image.asset(
                              'assets/images/telarana.png',
                              width: 200,
                            )),
                        crossFadeState: textFinal.value
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 300));
                  }),
                ),
              ],
            ),
          ),
        ));
  }
}
