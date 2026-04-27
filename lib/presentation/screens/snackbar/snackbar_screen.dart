import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: Text('Hello World'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text(
          'Magna voluptate enim cupidatat adipisicing ipsum culpa Lorem occaecat veniam magna. Irure dolore ullamco elit magna velit elit ullamco aute elit pariatur laboris. Magna id id dolor aliquip. Lorem duis deserunt duis pariatur minim. Duis mollit amet ipsum occaecat quis. Elit deserunt tempor Lorem exercitation id amet veniam ut dolor est. Voluptate ipsum ad esse amet fugiat excepteur nulla ea aliquip proident.',
        ),
        actions: [
          TextButton(onPressed: () => context.pop(), child: Text('Cancel')),
          FilledButton(onPressed: () => context.pop(), child: Text('Accept')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbars & Dialogs')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    Text(
                      'Consectetur consequat in mollit nostrud nostrud qui consequat Lorem fugiat ad officia cillum enim nisi.',
                    ),
                  ],
                );
              },
              child: Text('Liceses used'),
            ),
            SizedBox(height: 10),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: Text('Show screen dialog'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: Text('Show Snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
