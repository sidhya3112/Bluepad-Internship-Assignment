import 'package:bluepad_assignment/bottom_appbar.dart';
import 'package:bluepad_assignment/likes_comment.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: Change())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<State> key = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ui.Size screenSize = MediaQuery.of(context).size;
    final double _height = screenSize.height;
    final double _width = screenSize.width;

    final _isVisible = Provider.of<Change>(context);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(_height * 0.08),
          child: Builder(builder: (BuildContext context) {
            return AppBar(
              title: Padding(
                padding: EdgeInsets.only(left: _width * 0.19),
                child: Text(
                  "Bluepad",
                  style: GoogleFonts.yesevaOne(
                    textStyle: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.w400,
                        fontSize: _height * 0.032),
                  ),
                ),
              ),
              leading: IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: _height * 0.040,
                  ),
                  onPressed: () {
                    var snackBar = SnackBar(
                      content: Text("Home Button Pressed"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }),
              backgroundColor: Colors.white,
            );
          })),
      body: NotificationListener<ScrollNotification>(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: _height * 0.022,
                      right: _width * 0.045,
                      left: _width * 0.045),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Crypto Investor Buys \$ 69 Million Beeple NFT Art Work",
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w600,
                            fontSize: _height * 0.038),
                      ),
                      SizedBox(
                        height: _height * 0.04,
                      ),
                      Text(
                        "The latest news to do the rounds is about the investor from Singapore, has bought \$ 69 Million Beeple NFT. Now, that sounds too interesting. However, he is not ready to divulge his real name. I a world like ours, anyone can attack him for his funds. I just learnt, that this wealthy investor goes by the name Metakovan. It is a record of sorts in the bitcoin genre. The record-braking digital artwork is connected to an image file, that is connected to a NFT.\n\n\n"
                        "You will be amazed to know how lucrative such bitcoins are getting today. Moreover, they are receiving rave reviews. Christie’s Auction House is behind this huge deal. Metakovan also happens to be the chief investor behind Metapurse. It is nothing, but a Crypto-based fund. It is also the largest NFT in the world. At least, that is what it claims to be. Metakovan has also given an interview on Google Hangouts, and states there, that it is one lucrative deal. It is a big investment. The art work in question is interesting.\n\n\n"
                        "It is a mosaic of 5,000 artworks. It took him the last 13 years to prepare it. Says, Mike Winkelmann, who goes by the artist whose name is Beeple. One can find a variety of images inside the mosaic artwork. There is Abraham Lincoln spanking baby Trump, and more interesting ones. The bidding happened on 25 February. If reports are to be believed, initially things were a bit mellow, however, it shot up in the last ten minutes.",
                        style: TextStyle(fontSize: _height * 0.023),
                      ),
                      SizedBox(
                        height: _height * 0.05,
                      ),
                      Image.asset("images/img1.jpg"),
                      SizedBox(
                        height: _height * 0.05,
                      ),
                      Text(
                        "Monetization of NFTs",
                        style: TextStyle(
                            fontSize: _height * 0.028,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: _height * 0.035,
                      ),
                      Text(
                        "Well, this is not the first time, Metakovan has done this. He has purchased more such Beeple artworks amounting to \$ 2.2 million in December 2020. Moreover, he fractionalized them and locked them with blockchain. No one even got a whiff, of what he was up to. The entire episode has created a sudden gripping interest in NFTs.\n\n\n"
                        " Winkelmann is not ready to divulge any further details yet. Well, Metakovan himself is not planning to sell his shares. This is a historic feat that he has achieved. For the uninitiated, almost 20 million visitors were a part of the auction. And, there were 200 registrations for the bidding. Metakovan was one of them. He has made the payment through ether. This is also a first, for Christie’s. no one has ever received such a large payment in cryptocurrency, in a similar domain.\n\n\n"
                        "This is the third highest amount which has been paid for the artwork of a living artist. So, you can understand, how it is. The entire feeling is simply overwhelming. The amount, that Metakovan has invested in artwork can actually buy a few palaces in France. You could even buy a yacht or an aeroplane, with that amount of money.\n\n\n"
                        "It seems that the market is quite open now.  And, people like Metakovan can do the unimaginable. Metakovan says, that he has no house, or cars. He just loves art and the power of bitcoin. He packs it up and moves on. While the world gushes at him.",
                        style: TextStyle(fontSize: _height * 0.023),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _height * 0.1,
                ),
                Like_Comment(key: key),
                CustomBottomAppBar(),
                SizedBox(
                  height: _height * 0.04,
                ),
                Container(
                  height: _height * 0.05,
                  child: Text(
                    "You Reached The Bottom of The Screen!",
                    style: TextStyle(
                        fontSize: _height * 0.025, color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
          ),
        ),
        onNotification: (ScrollNotification scroll) {
          var currentContext = key.currentContext;
          if (currentContext == null) return false;

          var renderObject = currentContext.findRenderObject();
          RenderAbstractViewport viewport =
              RenderAbstractViewport.of(renderObject);
          var offsetToRevealBottom =
              viewport.getOffsetToReveal(renderObject, 1.0);
          var offsetToRevealTop = viewport.getOffsetToReveal(renderObject, 0.0);

          if (offsetToRevealBottom.offset > scroll.metrics.pixels ||
              scroll.metrics.pixels > offsetToRevealTop.offset) {
            _isVisible.visibilityState = false;
          } else {
            _isVisible.visibilityState = true;
          }
          return false;
        },
      ),
      bottomNavigationBar:
          _isVisible.visibilityState ? null : CustomBottomAppBar(),
    );
  }
}
