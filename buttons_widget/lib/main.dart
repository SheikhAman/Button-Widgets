import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: ButtonsExample(),
      ),
    );
  }
}

class ButtonsExample extends StatelessWidget {
  const ButtonsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _showToast() => Fluttertoast.showToast(
          msg: 'Button tapped',
          toastLength: Toast.LENGTH_SHORT,
        );

    void _showSnack() => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Button tapped'),
            duration: Duration(milliseconds: 500),
          ),
        );
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        Column(
          children: <Widget>[
            const Text(
                'Elevated buttons add dimension to mostly flat layouts. They '
                'emphasize functions on busy or wide spaces.'),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _showSnack,
                  child: const Text('RaisedButton'),
                ),
                const ElevatedButton(
                  onPressed: null,
                  child: Text('disabled-Raised'),
                ),
              ],
            ),
          ],
        ),
        const Divider(),
        Column(
          children: <Widget>[
            const Text('A Text button displays an ink splash on press '
                'but does not lift. Use Text buttons on toolbars, in dialogs '
                'and inline with padding'),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: _showToast,
                  child: const Text('TextButton',
                      style: TextStyle(color: Colors.black)),
                ),
                const TextButton(
                  onPressed: null,
                  child: Text('disabled-TextButton'),
                ),
              ],
            ),
          ],
        ),
        const Divider(),
        Column(
          children: <Widget>[
            const Text(
                'Outlined buttons become opaque and elevate when pressed. They '
                'are often paired with raised buttons to indicate an '
                'alternative, secondary action.'),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                  onPressed: _showToast,
                  child: const Text('OutlinedButton',
                      style: TextStyle(color: Colors.black)),
                ),
                const OutlinedButton(
                  onPressed: null,
                  child: Text('OutlinedButton'),
                )
              ],
            ),
          ],
        ),
        const Divider(),
        Column(
          children: <Widget>[
            const Text(
                'Tooltips are short identifying messages that briefly appear '
                'in response to a long press. Tooltip messages are also used '
                'by services that make Flutter apps accessible, like screen '
                'readers.'),
            Center(
              child: IconButton(
                iconSize: 32.0,
                icon: const Icon(Icons.call),
                tooltip: 'Place a phone call',
                onPressed: _showSnack,
              ),
            )
          ],
        ),
      ],
    );
  }
}
