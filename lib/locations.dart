import 'package:latlong2/latlong.dart';

final Map<String, LatLng> countryCoordinates = {
    'Ukrayna': LatLng(48.3794, 31.1656), // Corrected coordinates for Ukraine
    'Rusya': LatLng(61.5240, 105.3188), // Corrected coordinates for Russia
    'Suriye': LatLng(34.8021, 38.9968), // Corrected coordinates for Syria
    'Filistin': LatLng(31.9522, 35.2332), // Corrected coordinates for Palestine
    'İsrail': LatLng(31.0461, 34.8516), // Corrected coordinates for Israel
    'Irak': LatLng(33.2232, 43.6793), // Corrected coordinates for Iraq
    'Yemen': LatLng(15.5525, 48.5164), // Corrected coordinates for Yemen
};


final ukrainePolygon = [
  LatLng(52.101678, 31.785998),
  LatLng(52.061267, 32.159412),
  LatLng(52.288695, 32.412058),
  LatLng(52.238465, 32.715761),
  LatLng(52.335075, 33.7527),
  LatLng(51.768882, 34.391731),
  LatLng(51.566413, 34.141978),
  LatLng(51.255993, 34.224816),
  LatLng(51.207572, 35.022183),
  LatLng(50.773955, 35.377924),
  LatLng(50.577197, 35.356116),
  LatLng(50.225591, 36.626168),
  LatLng(50.383953, 37.39346),
  LatLng(49.915662, 38.010631),
  LatLng(49.926462, 38.594988),
  LatLng(49.601055, 40.069058),
  LatLng(49.30743, 40.080789),
  LatLng(48.783818, 39.674664),
  LatLng(48.232405, 39.895632),
  LatLng(47.898937, 39.738278),
  LatLng(47.825608, 38.770585),
  LatLng(47.5464, 38.255112),
  LatLng(47.10219, 38.223538),
  LatLng(47.022221, 37.425137),
  LatLng(46.6987, 36.759855),
  LatLng(46.645964, 35.823685),
  LatLng(46.273197, 34.962342),
  LatLng(45.651219, 35.020788),
  LatLng(45.409993, 35.510009),
  LatLng(45.46999, 36.529998),
  LatLng(45.113216, 36.334713),
  LatLng(44.939996, 35.239999),
  LatLng(44.361479, 33.882511),
  LatLng(44.564877, 33.326421),
  LatLng(45.034771, 33.546924),
  LatLng(45.327466, 32.454174),
  LatLng(45.519186, 32.630804),
  LatLng(45.851569, 33.588162),
  LatLng(46.080598, 33.298567),
  LatLng(46.333348, 31.74414),
  LatLng(46.706245, 31.675307),
  LatLng(46.5831, 30.748749),
  LatLng(46.03241, 30.377609),
  LatLng(45.293308, 29.603289),
  LatLng(45.464925, 29.149725),
  LatLng(45.304031, 28.679779),
  LatLng(45.488283, 28.233554),
  LatLng(45.596907, 28.485269),
  LatLng(45.939987, 28.659987),
  LatLng(46.25883, 28.933717),
  LatLng(46.437889, 28.862972),
  LatLng(46.517678, 29.072107),
  LatLng(46.379262, 29.170654),
  LatLng(46.349988, 29.759972),
  LatLng(46.423937, 30.024659),
  LatLng(46.525326, 29.83821),
  LatLng(46.674361, 29.908852),
  LatLng(46.928583, 29.559674),
  LatLng(47.346645, 29.415135),
  LatLng(47.510227, 29.050868),
  LatLng(47.849095, 29.122698),
  LatLng(48.118149, 28.670891),
  LatLng(48.155562, 28.259547),
  LatLng(48.467119, 27.522537),
  LatLng(48.368211, 26.857824),
  LatLng(48.220726, 26.619337),
  LatLng(48.220881, 26.19745),
  LatLng(47.987149, 25.945941),
  LatLng(47.891056, 25.207743),
  LatLng(47.737526, 24.866317),
  LatLng(47.981878, 24.402056),
  LatLng(47.985598, 23.760958),
  LatLng(48.096341, 23.142236),
  LatLng(47.882194, 22.710531),
  LatLng(48.15024, 22.64082),
  LatLng(48.422264, 22.085608),
  LatLng(48.825392, 22.280842),
  LatLng(49.085738, 22.558138),
  LatLng(49.027395, 22.776419),
  LatLng(49.476774, 22.51845),
  LatLng(50.308506, 23.426508),
  LatLng(50.424881, 23.922757),
  LatLng(50.705407, 24.029986),
  LatLng(51.578454, 23.527071),
  LatLng(51.617444, 24.005078),
  LatLng(51.888461, 24.553106),
  LatLng(51.910656, 25.327788),
  LatLng(51.832289, 26.337959),
  LatLng(51.592303, 27.454066),
  LatLng(51.572227, 28.241615),
  LatLng(51.427714, 28.617613),
  LatLng(51.602044, 28.992835),
  LatLng(51.368234, 29.254938),
  LatLng(51.416138, 30.157364),
  LatLng(51.319503, 30.555117),
  LatLng(51.822806, 30.619454),
  LatLng(52.042353, 30.927549),
  LatLng(52.101678, 31.785998), // Closing the polygon
];
final syriaPolygon = [
  LatLng(33.378686, 38.792341),
  LatLng(32.312938, 36.834062),
  LatLng(32.709192, 35.719918),
  LatLng(32.716014, 35.700798),
  LatLng(32.868123, 35.836397),
  LatLng(33.277426, 35.821101),
  LatLng(33.824912, 36.06646),
  LatLng(34.201789, 36.61175),
  LatLng(34.593935, 36.448194),
  LatLng(34.644914, 35.998403),
  LatLng(35.410009, 35.905023),
  LatLng(35.821535, 36.149763),
  LatLng(36.040617, 36.41755),
  LatLng(36.259699, 36.685389),
  LatLng(36.81752, 36.739494),
  LatLng(36.623036, 37.066761),
  LatLng(36.90121, 38.167727),
  LatLng(36.712927, 38.699891),
  LatLng(36.716054, 39.52258),
  LatLng(37.091276, 40.673259),
  LatLng(37.074352, 41.212089),
  LatLng(37.229873, 42.349591),
  LatLng(36.605854, 41.837064),
  LatLng(36.358815, 41.289707),
  LatLng(35.628317, 41.383965),
  LatLng(34.419372, 41.006159),
  LatLng(33.378686, 38.792341), // Closing the polygon
];

// final sudan = [
//             LatLng(9.464285, 33.963393),
//             LatLng(9.484061, 33.824963),
//             LatLng(9.981915, 33.842131),
//             LatLng(10.325262, 33.721959),
//             LatLng(10.720112, 33.206938),
//             LatLng(11.441141, 33.086766),
//             LatLng(12.179338, 33.206938),
//             LatLng(12.248008, 32.743419),
//             LatLng(12.024832, 32.67475),
//             LatLng(11.97333, 32.073892),
//             LatLng(11.681484, 32.314235),
//             LatLng(11.080626, 32.400072),
//             LatLng(10.531271, 31.850716),
//             LatLng(9.810241, 31.352862),
//             LatLng(9.707237, 30.837841),
//             LatLng(10.290927, 29.996639),
//             LatLng(10.084919, 29.618957),
//             LatLng(9.793074, 29.515953),
//             LatLng(9.604232, 29.000932),
//             LatLng(9.398224, 28.966597),
//             LatLng(9.398224, 27.97089),
//             LatLng(9.604232, 27.833551),
//             LatLng(9.638567, 27.112521),
//             LatLng(9.466893, 26.752006),
//             LatLng(9.55273, 26.477328),
//             LatLng(10.136421, 25.962307),
//             LatLng(10.411099, 25.790633),
//             LatLng(10.27376, 25.069604),
//             LatLng(9.810241, 24.794926),
//             LatLng(8.917538, 24.537415),
//             LatLng(8.728696, 24.194068),
//             LatLng(8.61973, 23.88698),
//             LatLng(8.666319, 23.805813),
//             LatLng(8.954286, 23.459013),
//             LatLng(9.265068, 23.394779),
//             LatLng(9.681218, 23.55725),
//             LatLng(10.089255, 23.554304),
//             LatLng(10.714463, 22.977544),
//             LatLng(11.142395, 22.864165),
//             LatLng(11.38461, 22.87622),
//             LatLng(11.67936, 22.50869),
//             LatLng(12.26024, 22.49762),
//             LatLng(12.64605, 22.28801),
//             LatLng(12.58818, 21.93681),
//             LatLng(12.95546, 22.03759),
//             LatLng(13.37232, 22.29658),
//             LatLng(13.78648, 22.18329),
//             LatLng(14.09318, 22.51202),
//             LatLng(14.32682, 22.30351),
//             LatLng(14.94429, 22.56795),
//             LatLng(15.68072, 23.02459),
//             LatLng(15.61084, 23.88689),
//             LatLng(19.58047, 23.83766),
//             LatLng(20.0, 23.85),
//             LatLng(20.00304, 25.0),
//             LatLng(22.0, 25.0),
//             LatLng(22.0, 29.02),
//             LatLng(22.0, 32.9),
//             LatLng(22.0, 36.86623),
//             LatLng(22.0, 37.18872),
//             LatLng(21.01885, 36.96941),
//             LatLng(20.83744, 37.1147),
//             LatLng(19.80796, 37.48179),
//             LatLng(18.61409, 37.86276),
//             LatLng(18.36786, 38.41009),
//             LatLng(17.998307, 37.904),
//             LatLng(17.42754, 37.16747),
//             LatLng(17.26314, 36.85253),
//             LatLng(16.95655, 36.75389),
//             LatLng(16.29186, 36.32322),
//             LatLng(14.82249, 36.42951),
//             LatLng(14.42211, 36.27022),
//             LatLng(13.56333, 35.86363),
//             LatLng(12.57828, 35.26049),
//             LatLng(12.08286, 34.83163),
//             LatLng(11.31896, 34.73115),
//             LatLng(10.63009, 34.25745),
//             LatLng(9.58358, 33.96162),
//             LatLng(9.464285, 33.963393), // Closing the polygon
//           ];
final palestinePolygon = [
        LatLng(32.393992, 35.545665),
        LatLng(32.532511, 35.18393),
        LatLng(31.866582, 34.974641),
        LatLng(31.754341, 35.225892),
        LatLng(31.616778, 34.970507),
        LatLng(31.353435, 34.927408),
        LatLng(31.489086, 35.397561),
        LatLng(31.782505, 35.545252),
        LatLng(32.393992, 35.545665),
      ];

// Israel Polygon
final israelPolygon = [
  LatLng(32.709192, 35.719918),
  LatLng(32.393992, 35.545665),
  LatLng(32.532511, 35.18393),
  LatLng(31.866582, 34.974641),
  LatLng(31.754341, 35.225892),
  LatLng(31.616778, 34.970507),
  LatLng(31.353435, 34.927408),
  LatLng(31.489086, 35.397561),
  LatLng(31.100066, 35.420918),
  LatLng(29.501326, 34.922603),
  LatLng(31.219361, 34.265433),
  LatLng(31.548824, 34.556372),
  LatLng(31.605539, 34.488107),
  LatLng(32.072926, 34.752587),
  LatLng(32.827376, 34.955417),
  LatLng(33.080539, 35.098457),
  LatLng(33.0909, 35.126053),
  LatLng(33.08904, 35.460709),
  LatLng(33.264275, 35.552797),
  LatLng(33.277426, 35.821101),
  LatLng(32.868123, 35.836397),
  LatLng(32.716014, 35.700798),
  LatLng(32.709192, 35.719918), // Closing the polygon
];

final iraqPolygon = [
  LatLng(35.977546, 45.420618),
  LatLng(35.677383, 46.07634),
  LatLng(35.093259, 46.151788),
  LatLng(34.748138, 45.64846),
  LatLng(33.967798, 45.416691),
  LatLng(33.017287, 46.109362),
  LatLng(32.469155, 47.334661),
  LatLng(31.709176, 47.849204),
  LatLng(30.984853, 47.685286),
  LatLng(30.985137, 48.004698),
  LatLng(30.452457, 48.014568),
  LatLng(29.926778, 48.567971),
  LatLng(29.975819, 47.974519),
  LatLng(30.05907, 47.302622),
  LatLng(29.099025, 46.568713),
  LatLng(29.178891, 44.709499),
  LatLng(31.190009, 41.889981),
  LatLng(31.889992, 40.399994),
  LatLng(32.161009, 39.195468),
  LatLng(33.378686, 38.792341),
  LatLng(34.419372, 41.006159),
  LatLng(35.628317, 41.383965),
  LatLng(36.358815, 41.289707),
  LatLng(36.605854, 41.837064),
  LatLng(37.229873, 42.349591),
  LatLng(37.385264, 42.779126),
  LatLng(37.256228, 43.942259),
  LatLng(37.001514, 44.293452),
  LatLng(37.170445, 44.772699),
  LatLng(35.977546, 45.420618), // Closing the polygon
];

// Yemen Polygon
final yemenPolygon = [
  LatLng(16.651051, 53.108573),
  LatLng(16.382411, 52.385206),
  LatLng(15.938433, 52.191729),
  LatLng(15.59742, 52.168165),
  LatLng(15.17525, 51.172515),
  LatLng(14.708767, 49.574576),
  LatLng(14.003202, 48.679231),
  LatLng(13.94809, 48.238947),
  LatLng(14.007233, 47.938914),
  LatLng(13.59222, 47.354454),
  LatLng(13.399699, 46.717076),
  LatLng(13.347764, 45.877593),
  LatLng(13.290946, 45.62505),
  LatLng(13.026905, 45.406459),
  LatLng(12.953938, 45.144356),
  LatLng(12.699587, 44.989533),
  LatLng(12.721653, 44.494576),
  LatLng(12.58595, 44.175113),
  LatLng(12.6368, 43.482959),
  LatLng(13.22095, 43.222871),
  LatLng(13.767584, 43.251448),
  LatLng(14.06263, 43.087944),
  LatLng(14.802249, 42.892245),
  LatLng(15.213335, 42.604873),
  LatLng(15.261963, 42.805015),
  LatLng(15.718886, 42.702438),
  LatLng(15.911742, 42.823671),
  LatLng(16.347891, 42.779332),
  LatLng(16.66689, 43.218375),
  LatLng(17.08844, 43.115798),
  LatLng(17.579987, 43.380794),
  LatLng(17.319977, 43.791519),
  LatLng(17.410359, 44.062613),
  LatLng(17.433329, 45.216651),
  LatLng(17.333335, 45.399999),
  LatLng(17.233315, 46.366659),
  LatLng(17.283338, 46.749994),
  LatLng(16.949999, 47.000005),
  LatLng(17.116682, 47.466695),
  LatLng(18.166669, 48.183344),
  LatLng(18.616668, 49.116672),
  LatLng(19.000003, 52.00001),
  LatLng(17.349742, 52.782184),
  LatLng(16.651051, 53.108573), // Closing the polygon
];




