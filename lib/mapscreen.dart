import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/foundation.dart';
import 'locations.dart';
import 'wardata.dart';

typedef HitValue = ({String title, String subtitle});

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  final LayerHitNotifier<HitValue> _hitNotifier = ValueNotifier(null);
  List<HitValue>? _prevHitValues;
  List<Polygon<HitValue>>? _hoverGons;
  List<Icon> iconList = [
    Icon(Icons.airplane_ticket),
    Icon(Icons.local_gas_station),
    Icon(Icons.question_answer),
    Icon(Icons.attach_money),
    Icon(Icons.question_answer),
    Icon(Icons.water),
    Icon(Icons.cleaning_services),
    Icon(Icons.school),
    Icon(Icons.fastfood),
    Icon(Icons.work),
    Icon(Icons.health_and_safety),
    Icon(Icons.electrical_services),
    Icon(Icons.warning),
    Icon(Icons.people_alt),
    Icon(Icons.psychology),
    Icon(Icons.group),
    Icon(Icons.psychology),
    Icon(Icons.group),
  ];

  final _polygonsRaw = <Polygon<HitValue>>[
    Polygon(
      points: ukrainePolygon,
      color: Colors.green.withOpacity(0.4),
      borderStrokeWidth: 2,
      borderColor: Colors.blue,
      hitValue: (
        title: 'Yemen',
        subtitle: '',
      ),
    ),
    Polygon(
      points: syriaPolygon,
      color: Colors.orange.withOpacity(0.4),
      borderStrokeWidth: 2,
      borderColor: Colors.blue,
      hitValue: (
        title: 'Suriye',
        subtitle: '',
      ),
    ),
    Polygon(
      points: palestinePolygon,
      color: Colors.green.withOpacity(0.4),
      borderStrokeWidth: 2,
      borderColor: Colors.blue,
      hitValue: (
        title: 'Filistin',
        subtitle: '',
      ),
    ),
    Polygon(
      points: israelPolygon,
      color: Colors.red.withOpacity(0.4),
      borderStrokeWidth: 2,
      borderColor: Colors.blue,
      hitValue: (
        title: 'İsrail',
        subtitle: '',
      ),
    ),
    Polygon(
      points: iraqPolygon,
      color: Colors.orange.withOpacity(0.4),
      borderStrokeWidth: 2,
      borderColor: Colors.blue,
      hitValue: (
        title: 'Irak',
        subtitle: '',
      ),
    ),
    Polygon(
      points: yemenPolygon,
      color: Colors.orange.withOpacity(0.4),
      borderStrokeWidth: 2,
      borderColor: Colors.blue,
      hitValue: (
        title: 'Yemen',
        subtitle: '',
      ),
    ),
  ];
  late final _polygons =
      Map.fromEntries(_polygonsRaw.map((e) => MapEntry(e.hitValue, e)));

  String _selectedCountry = 'İsrail';
  final _countryCoordinates = countryCoordinates;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Warscope"),
            DropdownButton<String>(
              value: _selectedCountry,
              items: _countryCoordinates.keys.map((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCountry = newValue!;
                  _mapController.move(
                      _countryCoordinates[_selectedCountry]!, 5);
                });
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: const MapOptions(
              initialCenter: LatLng(33.0461, 36.8516),
              initialZoom: 7,
            ),
            children: [
              TileLayer(
                  urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
              MarkerLayer(
                markers: _countryCoordinates.entries.map((entry) {
                  return Marker(
                    width: 80.0,
                    height: 80.0,
                    point: entry.value,
                    child: GestureDetector(
                      onTap: () {
                        _openTouchedGonsModal(
                          entry.key,
                          [(title: entry.key, subtitle: '')],
                          entry.value,
                        );
                      },
                      child: Container(
child: Image.asset(
  ['Filistin', 'Ukrayna'].contains(entry.key)
      ? 'assets/icon48_green.png' // Green icon for Yemen, Ukrayna
      : ['Rusya', 'İsrail'].contains(entry.key)
          ? 'assets/icon48_red.png' // Red icon for Rusya, İsrail
          : ['Suriye', 'Irak', 'Yemen'].contains(entry.key)
              ? 'assets/icon48_orange.png' // Orange icon for Suriye, Irak, Yemen
              : 'assets/icon48_green.png', // Default icon if no match
),                      ),
                    ),
                  );
                }).toList(),
              ),
              MouseRegion(
                hitTestBehavior: HitTestBehavior.deferToChild,
                cursor: SystemMouseCursors.click,
                onHover: (_) {
                  final hitValues = _hitNotifier.value?.hitValues.toList();
                  if (hitValues == null) return;

                  if (listEquals(hitValues, _prevHitValues)) return;
                  _prevHitValues = hitValues;

                  final hoverLines = hitValues.map((v) {
                    final original = _polygons[v]!;

                    return Polygon<HitValue>(
                      points: original.points,
                      holePointsList: original.holePointsList,
                      color: Colors.transparent,
                      borderStrokeWidth: 5,
                      borderColor: Colors.green,
                      disableHolesBorder: original.disableHolesBorder,
                    );
                  }).toList();
                  setState(() => _hoverGons = hoverLines);
                },
                onExit: (_) {
                  _prevHitValues = null;
                  setState(() => _hoverGons = null);
                },
                child: GestureDetector(
                  onTap: () {
                    if (_hitNotifier.value != null) {
                      _openTouchedGonsModal(
                        'Tapped',
                        _hitNotifier.value!.hitValues,
                        _hitNotifier.value!.coordinate,
                      );
                    }
                  },
                  onLongPress: () {
                    if (_hitNotifier.value != null) {
                      _openTouchedGonsModal(
                        'Long pressed',
                        _hitNotifier.value!.hitValues,
                        _hitNotifier.value!.coordinate,
                      );
                    }
                  },
                  onSecondaryTap: () {
                    if (_hitNotifier.value != null) {
                      _openTouchedGonsModal(
                        'Secondary tapped',
                        _hitNotifier.value!.hitValues,
                        _hitNotifier.value!.coordinate,
                      );
                    }
                  },
                  child: PolygonLayer(
                    hitNotifier: _hitNotifier,
                    simplificationTolerance: 0,
                    polygons: [..._polygonsRaw, ...?_hoverGons],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
  top: 10,
  left: 10,
  child: Card(
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red, // Red for "Agresör"
                ),
              ),
              SizedBox(width: 8), // Space between circle and text
              Text('Agresör'),
            ],
          ),
          SizedBox(height: 8), // Space between rows
          Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green, // Green for "Müdafaa"
                ),
              ),
              SizedBox(width: 8), // Space between circle and text
              Text('Müdafaa'),
            ],
          ),
          SizedBox(height: 8), // Space between rows
          Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange, // Orange for "İç Savaş"
                ),
              ),
              SizedBox(width: 8), // Space between circle and text
              Text('İç Savaş'),
            ],
          ),
        ],
      ),
    ),
  ),
),


        ],
      ),
    );
  }

  void _openTouchedGonsModal(
    String eventType,
    List<HitValue> tappedLines,
    LatLng coords,
  ) {
    // Extract the conflict title from the tapped polygon
    final tappedConflict = tappedLines.first.title;
    final conflictData = warData[tappedConflict];

    showModalBottomSheet<void>(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tappedConflict,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (conflictData != null)
              Expanded(
                child: ListView.builder(
                  itemCount: conflictData.length,
                  itemBuilder: (context, index) {
                    final category = conflictData.keys.elementAt(index);
                    final value = conflictData[category];
                    return ListTile(
                      leading: iconList[index],
                      title: Text(
                        category,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(value.toString()),
                      dense: true,
                    );
                  },
                ),
              ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
