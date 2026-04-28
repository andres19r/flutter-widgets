import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UI Controls')),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation? selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: Text('Developer Mode'),
          subtitle: Text('Additional controls'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        ExpansionTile(
          title: Text('Transport vehicle'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioGroup(
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = value;
              }),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text('Car'),
                    subtitle: Text('Travel by car'),
                    leading: Radio(value: Transportation.car),
                  ),
                  ListTile(
                    title: Text('Plane'),
                    subtitle: Text('Travel by plane'),
                    leading: Radio(value: Transportation.plane),
                  ),
                  ListTile(
                    title: Text('Boat'),
                    subtitle: Text('Travel by boat'),
                    leading: Radio(value: Transportation.boat),
                  ),
                  ListTile(
                    title: Text('Submarine'),
                    subtitle: Text('Travel by submarine'),
                    leading: Radio(value: Transportation.submarine),
                  ),
                ],
              ),
            ),
          ],
        ),
        CheckboxListTile(
          title: Text('Breakfast'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: Text('Lunch'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: Text('Dinner'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
