import 'package:flutter/material.dart';
import 'package:walatic/UI/VIEWS_CONTROLERS/LOGIN_CONTROLER/bubble_indicator_painter.dart';
import 'package:walatic/UI/ORGANISM_WIDGETS/sign_in.dart';
import 'package:walatic/UI/ORGANISM_WIDGETS/sign_up.dart';
import 'package:walatic/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.orange;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
      child: Container(
          
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black87,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 75.0),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          0.0,
                          0.0,
                        ),
                        blurRadius: 1.0,
                        spreadRadius: 1.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.black12,
                        offset: const Offset(3.0, 3.0),
                        blurRadius: 0.0,
                        spreadRadius: 1.0,
                      ), //BoxShadow

                  ],
                    image: DecorationImage(
                      image: const AssetImage('assets/img/wabit_.jpg'),
                      fit: BoxFit.fill
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: _buildMenuBar(context),
              ),
              Expanded(
                flex: 2,
                child: PageView(
                  controller: _pageController,
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: (int i) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (i == 0) {
                      setState(() {
                        right = Colors.grey;
                        left = Colors.white;
                      });
                    } else if (i == 1) {
                      setState(() {
                        right = Colors.white;
                        left = Colors.grey;
                      });
                    }
                  },
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: const SignUp(),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: const SignIn(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      padding: EdgeInsets.all(3.0),
      decoration: const BoxDecoration(
        
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
       
                  boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: const Offset(
                          0.0,
                          0.0,
                        ),
                        blurRadius: 1.0,
                        spreadRadius: 1.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: CustomTheme.blackSoft,
                        offset: const Offset(5.0, 5.0),
                        blurRadius: 0.0,
                        spreadRadius: 1.0,
                      ), //BoxShadow
                      
                  ],
                  
      ),

      child: CustomPaint(
        painter: BubbleIndicatorPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            
            //Container(height: 33.0, width: 1.0, color: Colors.grey),

            Container(
              
              child: Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    
                  ),
                  onPressed: _onSignInButtonPress,
                  child: Text(
                    
                    'Registrarse',
                    style: TextStyle(
                        color: left,
                        fontSize: 16.0,
                        fontFamily: 'WorkSansd'),
                  ),
                ),
              ),
            ),
            Container(
            child: Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: _onSignUpButtonPress,
                    child: Text(
                      'Ingresar',
                      style: TextStyle(
                          color: right,
                          fontSize: 16.0,
                          fontFamily: 'WorkSansd'),
                    ),
                  ),
                ),
              ),       
          ],
        ),
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
