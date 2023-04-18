import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layer/pages/getstarted.dart';
import 'package:slider_button/slider_button.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:layer/utils/helperfunctions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
          name: 'My App',
          description: 'An app for converting pictures to NFT',
          url: 'https://walletconnect.org',
          icons: [
            'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ]));

  var _session, _uri, _signature;

  loginUsingMetamask(BuildContext context) async {
    if (!connector.connected) {
      try {
        var session = await connector.createSession(onDisplayUri: (uri) async {
          _uri = uri;
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
        });
        print(session.accounts[0]);
        print(session.chainId);
        setState(() {
          _session = session;
        });
      } catch (exp) {
        print(exp);
      }
    }
  }

  signMessageWithMetamask(BuildContext context, String message) async {
    if (connector.connected) {
      try {
        print("Message received");
        print(message);

        EthereumWalletConnectProvider provider =
            EthereumWalletConnectProvider(connector);
        launchUrlString(_uri, mode: LaunchMode.externalApplication);
        var signature = await provider.personalSign(
            message: message, address: _session.accounts[0], password: "");
        print(signature);
        setState(() {
          _signature = signature;
        });
      } catch (exp) {
        print("Error while signing transaction");
        print(exp);
      }
    }
  }

  getNetworkName(chainId) {
    switch (chainId) {
      case 1:
        return 'Ethereum Mainnet';
      case 3:
        return 'Ropsten Testnet';
      case 4:
        return 'Rinkeby Testnet';
      case 5:
        return 'Goreli Testnet';
      case 42:
        return 'Kovan Testnet';
      case 137:
        return 'Polygon Mainnet';
      case 80001:
        return 'Mumbai Testnet';
      default:
        return 'Unknown Chain';
    }
  }

  @override
  Widget build(BuildContext context) {
    connector.on(
        'connect',
        (session) => setState(
              () {
                _session = _session;
              },
            ));
    connector.on(
        'session_update',
        (payload) => setState(() {
              _session = payload;
              print(_session.accounts[0]);
              print(_session.chainId);
            }));
    connector.on(
        'disconnect',
        (payload) => setState(() {
              _session = null;
            }));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DAOC0M',
                  style: TextStyle(
                    fontSize: 80,
                    fontFamily: 'Roboto',
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: [
                          Color.fromRGBO(111, 88, 219, 1.0), // #6F58DB
                          Color.fromRGBO(229, 110, 132, 1.0), // #E56E84
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                  ),
                ),
                (_session != null)
                    ? Container(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Account',
                              style: GoogleFonts.merriweather(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              '${_session.accounts[0]}',
                              style: GoogleFonts.inconsolata(fontSize: 16),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Text(
                                  'Chain: ',
                                  style: GoogleFonts.merriweather(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  getNetworkName(_session.chainId),
                                  style: GoogleFonts.inconsolata(fontSize: 16),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            (_session.chainId != 80001)
                                ? Row(
                                    children: const [
                                      Icon(Icons.warning,
                                          color: Colors.redAccent, size: 15),
                                      Text(
                                        'Network not supported. Switch to ',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        'Mumbai Testnet',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                : (_signature == null)
                                    ? Container(
                                        alignment: Alignment.center,
                                        child: CupertinoButton(
                                          onPressed: () =>
                                              signMessageWithMetamask(
                                                  context,
                                                  generateSessionMessage(
                                                      _session.accounts[0])),
                                          color: Colors.purple[300],
                                          padding: const EdgeInsets.all(0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: const [
                                               Text(
                                                "Sign Message",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Signature: ",
                                                style: GoogleFonts.merriweather(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                  truncateString(
                                                      _signature.toString(),
                                                      4,
                                                      2),
                                                  style:
                                                      GoogleFonts.inconsolata(
                                                          color: Colors.white,
                                                          fontSize: 16))
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          SliderButton(
                                            action: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return const GetStartedPage();
                                              }));
                                            },
                                            label: const Text('Slide to login'),
                                            icon: const Icon(Icons.check),
                                          )
                                        ],
                                      )
                          ],
                        ))
                    : 
                    Column(
                      children: [
                        CupertinoButton(
                            onPressed: () => loginUsingMetamask(
                                context), //funtion calling for login
                            color: Colors.purple[300],
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(
                                  'https://i0.wp.com/kindalame.com/wp-content/uploads/2021/05/metamask-fox-wordmark-horizontal.png?fit=1549%2C480&ssl=1',
                                  width:220
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
