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

  final _polygonsRaw = <Polygon<HitValue>>[
    Polygon(
      points: palestine_1,
      color: Colors.green.withOpacity(0.4),
      borderStrokeWidth: 2,
      borderColor: Colors.blue,
      hitValue: (
        title: 'Israel-Palestine Conflict',
        subtitle: '',
      ),
    ),
    Polygon(
      points: palestine_2,
      color: Colors.green.withOpacity(0.4),
      borderStrokeWidth: 2,
      borderColor: Colors.blue,
      hitValue: (
        title: 'Israel-Palestine Conflict',
        subtitle: '',
      ),
    ),
    Polygon(
      points: sudan,
      color: Colors.green.withOpacity(0.4),
      borderStrokeWidth: 2,
      borderColor: Colors.blue,
      hitValue: (
        title: 'Sudan Civil War',
        subtitle: '',
      ),
    )
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
              initialCenter: LatLng(51.5, -0.09),
              initialZoom: 5,
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
                      child: Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40.0,
                      ),
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
        ],
      ),
    );
  }

  void _openTouchedGonsModal(
    String eventType,
    List<HitValue> tappedLines,
    LatLng coords,
  ) {
    final warData = {
      'Israel-Palestine Conflict': wardata_israel,
      'Sudan Civil War': wardata_sudan,
      // Add other conflict maps here
    };

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
                    final details = conflictData[category];
                    return ListTile(
                      title: Text(
                        category,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: details != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: details.entries
                                  .map((entry) =>
                                      Text("${entry.key}: ${entry.value}"))
                                  .toList(),
                            )
                          : const Text('No data available'),
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
