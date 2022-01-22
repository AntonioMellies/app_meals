import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';
import '../components/drawer_menu.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;
  const SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings _settings;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _settings = widget.settings;
  }

  @override
  Widget build(BuildContext context) {
    Widget _createSwitch(
      String title,
      String subtitle,
      bool value,
      Function(bool) onChanged,
    ) {
      return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (value) {
          onChanged(value);
          widget.onSettingsChanged(_settings);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: DrawerMenu(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  "Sem Glutem",
                  "So exibe refeições sem glutem",
                  _settings.isGlutenFree,
                  (value) => setState(() => _settings.isGlutenFree = value),
                ),
                _createSwitch(
                  "Sem Lactose",
                  "So exibe refeições sem lactose",
                  _settings.isLactoseFree,
                  (value) => setState(() => _settings.isLactoseFree = value),
                ),
                _createSwitch(
                  "Vegana",
                  "So exibe refeições vegans",
                  _settings.isVegan,
                  (value) => setState(() => _settings.isVegan = value),
                ),
                _createSwitch(
                  "Vegetariana",
                  "So exibe refeições vegetarianas",
                  _settings.isVegetarian,
                  (value) => setState(() => _settings.isVegetarian = value),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
