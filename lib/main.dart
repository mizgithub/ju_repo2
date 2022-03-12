// @dart=2.9
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_colored_progress_indicators/flutter_colored_progress_indicators.dart';
import 'package:flutter/services.dart';
import 'navigation_controls.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor:Colors.white,
      ),
      home: MyHomePage( 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.title);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final _formKey = GlobalKey<FormState>();
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      body:
      Column(

        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        mainAxisAlignment: MainAxisAlignment.start,

        children: <Widget>[
            Image.asset('assets/images/header.png',
            width: width,

          ),
          // Container(
          //     color: Colors.white24,
          //     padding: EdgeInsets.all(20),
          //     child:Text(
          //       "Jimma University\nDigital Repository",
          //       style: TextStyle(
          //         color: Colors.indigo,
          //         fontSize: 20,
          //         fontWeight: FontWeight.bold,
          //         fontFamily: "Times new roman",
          //
          //       ),
          //     )
          // ),
          Container(
           // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),

            //height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            //color: Colors.white,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                color: Colors.white
            ),
          child:Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),

            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width/2,

            decoration: BoxDecoration(
                border: Border.all(color: Colors.white54),

            ),
          child:ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                      child:Column(
                        children: [
                          Container(
                              margin:EdgeInsets.fromLTRB(50,50,25,0),
                              child:Column(
                                children: <Widget>[
                                  Material(
                                  child:InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) => MyWebView(
                                             "OPAC",
                                             "https://abcd.ju.edu.etcgi-bin/utf8/wxis/iah/scripts/?IsisScript=iah.xis&lang=en&base=RDA",
                                          )
                                      ));
                                    }, // Handle your callback.

                                    child: Ink(
                                      height: 100,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/opac.png'),
                                          //fit: BoxFit.cover,

                                        ),

                                      ),
                                    ),
                                  ),
                                  ),
                                  Text("OPAC")
                                ],
                              )
                          ),
                          Container(
                              margin:EdgeInsets.fromLTRB(50,25,25,0),
                              child:Column(
                                children: <Widget>[
                                  Material(
                                  child:InkWell(
                                    onTap: () {
                                      // Navigator.of(context).push(MaterialPageRoute(
                                      //     builder: (BuildContext context) => MyWebView(
                                      //       title: "E-Resources",
                                      //       selectedUrl: "https://www.ju.edu.et/?q=president%E2%80%99s-message",
                                      //     )
                                      // ));
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: Stack(
                                                  overflow: Overflow.visible,
                                                  alignment: Alignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      width: 250,
                                                      height: 260,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(100),
                                                          color: Colors.white
                                                      ),
                                                      //padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Container(
                                                                //margin:EdgeInsets.fromLTRB(25,50,50,0),
                                                                  child:Column(
                                                                    children: <Widget>[
                                                                      IconButton(
                                                                        icon: Image.asset('assets/images/subJ.png'),
                                                                        iconSize: 100,
                                                                        onPressed: () {
                                                                          Navigator.of(context).push(MaterialPageRoute(
                                                                              builder: (BuildContext context) => MyWebView(
                                                                                 "Subscribed Journals",
                                                                                 "https://www.ju.edu.et/library/?q=node/382",
                                                                              )
                                                                          ));
                                                                        },
                                                                      ),
                                                                      // Image(image: AssetImage("assets/images/subJ.png")),
                                                                      Text("Subscribed Journals",
                                                                        style: TextStyle(fontSize: 10),
                                                                      )
                                                                    ],
                                                                  )
                                                              ),
                                                              Container(
                                                                //margin:EdgeInsets.fromLTRB(25,50,50,0),
                                                                  child:Column(
                                                                    children: <Widget>[
                                                                      IconButton(
                                                                        icon: Image.asset('assets/images/openj.png'),
                                                                        iconSize: 100,
                                                                        onPressed: () {
                                                                          Navigator.of(context).push(MaterialPageRoute(
                                                                              builder: (BuildContext context) => MyWebView(
                                                                                 "Open Journals",
                                                                                 "https://www.ju.edu.et/library/?q=node/383",
                                                                              )
                                                                          ));
                                                                        },
                                                                      ),
                                                                      // Image(image: AssetImage("assets/images/subJ.png")),
                                                                      Text("Open Journals",
                                                                        style: TextStyle(fontSize: 10),
                                                                      )
                                                                    ],
                                                                  )
                                                              ),

                                                            ],
                                                          ),
                                                          Container(
                                                            //margin:EdgeInsets.fromLTRB(25,50,50,0),
                                                              child:Column(
                                                                children: <Widget>[
                                                                  IconButton(
                                                                    icon: Image.asset('assets/images/fe-book.png'),
                                                                    iconSize: 100,
                                                                    onPressed: () {
                                                                      Navigator.of(context).push(MaterialPageRoute(
                                                                          builder: (BuildContext context) => MyWebView(
                                                                             "Free e-Books",
                                                                             "https://www.ju.edu.et/library/?q=node/421",
                                                                          )
                                                                      ));
                                                                    },
                                                                  ),
                                                                  // Image(image: AssetImage("assets/images/subJ.png")),
                                                                  Text("Free e-Books",
                                                                    style: TextStyle(fontSize: 10),
                                                                  )
                                                                ],
                                                              )
                                                          ),

                                                        ],
                                                      ),
                                                    ),

                                                  ]
                                              ),

                                            );
                                          });
                                    },
                                     // Handle your callback.
                                    child: Ink(
                                      height: 100,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/eRes.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ),
                                  Text("E-Resources")
                                ],
                              )
                          ),
                        ],
                      )
                  ),

                  Container(
                      child:Column(
                        children: [
                          Container(
                              margin:EdgeInsets.fromLTRB(25,50,50,0),
                              child:Column(
                                children: <Widget>[
                                  Material(
                                  child:InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) => MyWebView(
                                             "JiT Institutional Repository",
                                             "https://repository.ju.edu.et/handle/123456789/1206",
                                          )
                                      ));
                                    }, // Handle your callback.

                                    child: Ink(
                                      height: 100,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/instRepo.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ),
                                  Text("JiT Institutional Repository")
                                ],
                              )
                          ),
                          Container(
                              margin:EdgeInsets.fromLTRB(25,25,50,0),
                              child:Column(
                                children: <Widget>[
                                  Material(
                                  child:InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) => MyWebView(
                                             "JiT Digital Library",
                                             "http://library.ju.edu.et:8080/handle/378/9",
                                          )
                                      ));
                                    }, // Handle your callback.

                                    child: Ink(
                                      height: 100,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/lib_sys.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ),
                                  Text("JIT Digital Library")
                                ],
                              )
                          ),
                        ],
                      )
                  ),

                  Container(
                      child:Column(
                        children: [
                          Container(
                              margin:EdgeInsets.fromLTRB(50,50,25,0),
                              child:Column(
                                children: <Widget>[
                                  Material(
                                  child:InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) => MyWebView(
                                             "SRS",
                                             "https://srs.ju.edu.et/",
                                          )
                                      ));
                                    }, // Handle your callback.

                                    child: Ink(
                                      height: 100,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/srs.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ),
                                  Text("SRS home")
                                ],
                              )
                          ),
                          Container(
                              margin:EdgeInsets.fromLTRB(50,25,25,0),
                              child:Column(
                                children: <Widget>[
                                  Material(
                                  child:InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) => About(
                                          )
                                      ));
                                    }, // Handle your callback.

                                    child: Ink(
                                      height: 100,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/about.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ),
                                  Text("About")
                                ],
                              )
                          ),
                        ],
                      )
                  ),

                  Container(
                      child:Column(
                        children: [
                          Container(
                              margin:EdgeInsets.fromLTRB(25,50,50,0),
                              child:Column(
                                children: <Widget>[
                                  Material(
                                  child:InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) => MyWebView(
                                             "JU Navigation",
                                             "https://www.google.com/maps/place/Jimma+University/@7.6821696,36.8526477,18z/data=!4m9!1m2!2m1!1sJimma+UNiversity!3m5!1s0x17adb8c70a722351:0x4a70aa5d5253b48b!8m2!3d7.6820055!4d36.8559734!15sChBKaW1tYSBVTml2ZXJzaXR5kgEKdW5pdmVyc2l0eQ",
                                          )
                                      ));

                                    }, // Handle your callback.

                                    child: Ink(
                                      height: 100,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/navigation.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ),
                                  Text("JU Navigation")
                                ],
                              )
                          ),
                          Container(
                              margin:EdgeInsets.fromLTRB(25,25,50,0),
                              child:Column(
                                children: <Widget>[
                                  Material(
                                  child:InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) => Help(
                                          )
                                      ));
                                    }, // Handle your callback.

                                    child: Ink(
                                      height: 100,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/help.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ),
                                  Text("Help")
                                ],
                              )
                          ),
                        ],
                      )
                  )

                ],
              ),
            ),
          ),
          ),

        ],

      ),

    );
  }
}
class MyWebView extends StatefulWidget{
  final String title;
  final String selectedUrl;

  // const MyWebView(this.title, this.selectedUrl);
  MyWebView(this.title,this.selectedUrl);
  @override
  _MyWebView createState() => _MyWebView();
}
class _MyWebView extends State<MyWebView> {
  bool isLoading = true;

  final Completer<WebViewController> controller =  Completer<WebViewController>();
  // NavigationDecision _interceptNavigation(NavigationRequest request) {
  //   // if (request.url == widget.selectedUrl) {
  //   //   return NavigationDecision.prevent;
  //   // }
  //   // if (request.url.contains("umuieme")) {
  //   //   launch(request.url);
  //   //   return NavigationDecision.prevent;
  //   // }
  //   return NavigationDecision.navigate;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            NavigationControls(controller), // Add this line
          ],
        ),
        body: Stack(
          children: [
            WebView(
              initialUrl: widget.selectedUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                controller.complete(webViewController);
              },

              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
              // Add from here ...
              navigationDelegate: (navigation) {
                final host = Uri.parse(navigation.url).host;
                return NavigationDecision.navigate;
              },
              // ... to here.
            ),
            isLoading ? Center( child: ColoredCircularProgressIndicator(),)
                : Stack(),
          ],
        ) );
  }
}

class About extends StatefulWidget{
  @override
  _About createState() => _About();
}
class _About extends State<About> {
  bool isLoading = true;
  final Completer<WebViewController> _controller =  Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("About"),),
        body: Container(
          padding: EdgeInsets.all(50),
            child: Column(
              children:[
                Text(
                  "The application contains important links and repositories of JImma university to allow students access systems of jimma university all in one application\n"
                      +"The app contains\n"
                      "-> Link to jimma university official website\n"
                      "-> Jimma university president message page\n"
                      "-> Jimma university library\n"
                      "-> Jimma university digital library system platform\n"
                      "-> Student registration system (SRS) and\n"
                      "-> Jimma university google map navigator",
                  style: TextStyle(fontSize: 18),
                ),
                Text("---------"),
                Text(
                  "Developers of the application:"
                      "\nMizanu Zelalem: +251909879898, mizanu143@gmail.com"
                      "\nGetamesay Haile:+251967791791, getamesay0923@gmail.com"
                      "\nWith a collaboration of JiT Library, JiT",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              ],
            )

        )
    );
  }
}

class Help extends StatefulWidget{
  @override
  _Help createState() => _Help();
}
class _Help extends State<Help> {
  bool isLoading = true;
  final Completer<WebViewController> _controller =  Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Help"),

        ),
        body: Container(
          padding: EdgeInsets.all(50),
          child:Text(
            "For any Queries or Help"
                "\nPlease contact"
                "\nSystem Administrator"
                "\nContact: JiT Library",
            style: TextStyle(
              fontSize: 18
            ),
          ),
        )
    );
  }
}

