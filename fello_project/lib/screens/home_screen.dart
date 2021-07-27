import 'package:fello_project/utility/common.dart';
import 'package:fello_project/utility/constant.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const id = "HOME_SCREEN";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isJumping = false;
  var _currentJumpPosition = 0.0;
  var _finalJumpPos = 0.0;
  var _initialJumpPos = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _finalJumpPos = 428;
    _initialJumpPos = 204;

    final btnJump = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 48),
        child: MaterialButton(
          onPressed: () async {
            _jumpMario();
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: const Icon(
            Icons.arrow_upward_rounded,
            size: 38,
          ),
          padding: const EdgeInsets.all(16),
          shape: const CircleBorder(),
        ),
      ),
    );

    final imgMarioStand = Positioned(
      left: context.getWidth / 2 - 64,
      bottom: _initialJumpPos,
      child: Image.asset(
        imgMarioStanding,
        width: 128,
      ),
    );

    final imgMarioJump = AnimatedPositioned(
      left: context.getWidth / 2 - 74,
      duration: const Duration(milliseconds: 400),
      curve: Curves.bounceOut,
      bottom: _isJumping ? _currentJumpPosition : _initialJumpPos,
      child: Image.asset(
        imgMarioJumping,
        width: 148,
      ),
    );

    final imgBrick = Image.asset(
      imgMarioBrick,
      height: 68,
    );

    final brickLayer = Positioned(
      bottom: 0,
      child: Column(
        children: [
          imgBrick,
          imgBrick,
          imgBrick,
        ],
      ),
    );

    final imgCloud = Image.asset(imgMarioCloud, height: 68);

    final cloud1 = Positioned(top: 58, left: 18, child: imgCloud);

    final cloud2 = Positioned(top: 128, right: -48, child: imgCloud);

    return Scaffold(
      bottomNavigationBar: getBottomNav(context),
      body: Container(
        color: Colors.blue,
        child: Stack(
          children: [
            brickLayer,
            cloud1,
            cloud2,
            if (!_isJumping) imgMarioStand,
            if (_isJumping) imgMarioJump,
            btnJump,
          ],
        ),
      ),
    );
  }

  Future<void> _jumpMario() async {
    if (!_isJumping) {
      _isJumping = true;
      _currentJumpPosition = _finalJumpPos;
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 400));
      _currentJumpPosition = _initialJumpPos;
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 400));
      _isJumping = false;
      setState(() {});
    }
  }
}
