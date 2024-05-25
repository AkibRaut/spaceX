import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spacex/models/rocket_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHandeler {
  Database? _database;

//database creation function
  Future<Database> databasseCreate() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'my_database.db');
    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE rocketTable (
            id TEXT PRIMARY KEY,
            heightMeters TEXT,
            heightFeet TEXT,
            diameterMeters TEXT,
            diameterFeet TEXT,
            massKg TEXT,
            massLb TEXT,
            firstStageThrustSeaLevelKN TEXT,
            firstStageThrustSeaLevelLbf TEXT,
            firstStageThrustVacuumKN TEXT,
            firstStageThrustVacuumLbf TEXT,
            firstStageReusable INTEGER,
            firstStageEngines TEXT,
            firstStageFuelAmountTons TEXT,
            firstStageBurnTimeSec TEXT,
            secondStageThrustKN TEXT,
            secondStageThrustLbf TEXT,
            secondStageReusable INTEGER,
            secondStageEngines TEXT,
            secondStageFuelAmountTons TEXT,
            secondStageBurnTimeSec TEXT,
            enginesNumber TEXT,
            enginesType TEXT,
            enginesVersion TEXT,
            enginesLayout TEXT,
            enginesEngineLossMax TEXT,
            enginesPropellant1 TEXT,
            enginesPropellant2 TEXT,
            enginesThrustToWeight TEXT,
            landingLegsNumber TEXT,
            landingLegsMaterial TEXT,
            flickrimages TEXT,
            name TEXT,
            type TEXT,
            active INTEGER,
            stages TEXT,
            boosters TEXT,
            cost_per_launch TEXT,
            success_rate_pct TEXT,
            firstFlight TEXT,
            country TEXT,
            company TEXT,
            wikipedia TEXT,
            description TEXT
          )
        ''');
      },
    );

    return database;
  }

//get database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await databasseCreate();
    return _database!;
  }

//insert data in sqflite
  Future<void> insertData(RocketModel rocketModel) async {
    final db = await database;
    List<dynamic> base64Images = [];
    for (String imageUrl in rocketModel.flickrImages!) {
      base64Images.add(await imageUrlToBase64(imageUrl));
    }
    Map<String, dynamic> data = {
      'id': rocketModel.id.toString(),
      'heightMeters': rocketModel.height!.meters == "null"
          ? ""
          : rocketModel.height!.meters.toString(),
      'heightFeet': rocketModel.height!.feet == "null"
          ? ""
          : rocketModel.height!.feet.toString(),
      'diameterMeters': rocketModel.diameter!.meters == "null"
          ? ""
          : rocketModel.diameter!.meters.toString(),
      'firstStageEngines': rocketModel.firstStage!.engines.toString(),
      'firstStageFuelAmountTons':
          rocketModel.firstStage!.fuelAmountTons.toString(),
      'firstStageBurnTimeSec': rocketModel.firstStage!.burnTimeSec == "null"
          ? ""
          : rocketModel.firstStage!.burnTimeSec.toString(),
      'secondStageThrustKN': rocketModel.secondStage!.thrust!.kN.toString(),
      'secondStageThrustLbf': rocketModel.secondStage!.thrust!.lbf.toString(),
      'secondStageReusable': rocketModel.secondStage!.reusable.toString(),
      'secondStageEngines': rocketModel.secondStage!.engines.toString(),
      'secondStageFuelAmountTons':
          rocketModel.secondStage!.fuelAmountTons.toString(),
      'secondStageBurnTimeSec': rocketModel.secondStage!.burnTimeSec == "null"
          ? ""
          : rocketModel.secondStage!.burnTimeSec.toString(),
      'enginesNumber': rocketModel.engines!.number.toString(),
      'enginesType': rocketModel.engines!.type.toString(),
      'enginesVersion': rocketModel.engines!.version.toString(),
      'enginesLayout': rocketModel.engines!.layout == "null"
          ? ""
          : rocketModel.engines!.layout.toString(),
      'enginesEngineLossMax': rocketModel.engines!.engineLossMax == "null"
          ? ""
          : rocketModel.engines!.engineLossMax.toString(),
      'enginesPropellant1': rocketModel.engines!.propellant1.toString(),
      'enginesPropellant2': rocketModel.engines!.propellant2.toString(),
      'enginesThrustToWeight': rocketModel.engines!.thrustToWeight.toString(),
      'landingLegsNumber': rocketModel.landingLegs!.number.toString(),
      'landingLegsMaterial': rocketModel.landingLegs!.material == "null"
          ? ""
          : rocketModel.landingLegs!.material.toString(),
      'flickrimages': jsonEncode(base64Images),
      'name': rocketModel.name.toString(),
      'diameterFeet': rocketModel.diameter!.feet.toString(),
      'type': rocketModel.type.toString(),
      'active': rocketModel.active.toString(),
      'stages': rocketModel.stages.toString(),
      'boosters': rocketModel.boosters.toString(),
      'cost_per_launch': rocketModel.costPerLaunch.toString(),
      'success_rate_pct': rocketModel.successRatePct.toString(),
      'firstFlight': rocketModel.firstFlight.toString(),
      'country': rocketModel.country.toString(),
      'company': rocketModel.company.toString(),
      'wikipedia': rocketModel.wikipedia.toString(),
      'description': rocketModel.description.toString(),
    };
    await db.insert(
      'rocketTable',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

//listen data from sqflite
  Future<List<RocketModel>> readdata() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query('rocketTable');
      if (maps.isEmpty) {
        return [];
      } else {
        return List.generate(maps.length, (i) {
          List<String> flickrImages =
              List<String>.from(jsonDecode(maps[i]['flickrimages']));
          return RocketModel.fromJson({
            ...maps[i],
            'flickrImages': flickrImages,
          });
        });
      }
    } catch (e) {
      return [];
    }
  }

//convert image to base64 format
  Future<String> imageUrlToBase64(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      return base64Encode(response.bodyBytes);
    } else {
      throw Exception('Failed to load image');
    }
  }
}
