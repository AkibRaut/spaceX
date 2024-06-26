import 'dart:convert';

class RocketModel {
  Diameter? height;
  Diameter? diameter;
  Mass? mass;
  FirstStage? firstStage;
  SecondStage? secondStage;
  Engines? engines;
  LandingLegs? landingLegs;
  List<PayloadWeights>? payloadWeights;
  List<dynamic>? flickrImages;
  List<dynamic>? flickrImages2;
  String? name;
  String? type;
  String? active;
  String? stages;
  String? heightFeet;
  String? diameterFeet;
  String? boosters;
  String? costPerLaunch;
  String? successRatePct;
  String? firstFlight;
  String? country;
  String? company;
  String? wikipedia;
  String? description;
  String? id;

  RocketModel(
      {this.height,
      this.diameter,
      this.mass,
      this.firstStage,
      this.secondStage,
      this.engines,
      this.landingLegs,
      this.payloadWeights,
      this.flickrImages,
      this.name,
      this.type,
      this.heightFeet,
      this.diameterFeet,
      this.active,
      this.stages,
      this.boosters,
      this.costPerLaunch,
      this.successRatePct,
      this.firstFlight,
      this.country,
      this.company,
      this.wikipedia,
      this.description,
      this.id});

  RocketModel.fromJson(Map<String, dynamic> json) {
    height = json['height'] != null ? Diameter.fromJson(json['height']) : null;
    diameter =
        json['diameter'] != null ? Diameter.fromJson(json['diameter']) : null;
    mass = json['mass'] != null ? Mass.fromJson(json['mass']) : null;
    firstStage = json['first_stage'] != null
        ? FirstStage.fromJson(json['first_stage'])
        : null;
    secondStage = json['second_stage'] != null
        ? SecondStage.fromJson(json['second_stage'])
        : null;
    engines =
        json['engines'] != null ? Engines.fromJson(json['engines']) : null;
    landingLegs = json['landing_legs'] != null
        ? LandingLegs.fromJson(json['landing_legs'])
        : null;
    if (json['payload_weights'] != null) {
      payloadWeights = <PayloadWeights>[];
      json['payload_weights'].forEach((v) {
        payloadWeights!.add(PayloadWeights.fromJson(v));
      });
    }
    flickrImages2 = json['flickrimages'] != null
        ? List<String>.from(jsonDecode(json['flickrimages']))
        : null;
    flickrImages = json['flickr_images'];
    name = json['name'];
    type = json['type'];
    heightFeet = json['heightFeet'];
    diameterFeet = json['diameterFeet'];
    active = json['active'].toString();
    stages = json['stages'].toString();
    boosters = json['boosters'].toString();
    costPerLaunch = json['cost_per_launch'].toString();
    successRatePct = json['success_rate_pct'].toString();
    firstFlight = json['first_flight'];
    country = json['country'];
    company = json['company'];
    wikipedia = json['wikipedia'];
    description = json['description'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (height != null) {
      data['height'] = height!.toJson();
    }
    if (diameter != null) {
      data['diameter'] = diameter!.toJson();
    }
    if (mass != null) {
      data['mass'] = mass!.toJson();
    }
    if (firstStage != null) {
      data['first_stage'] = firstStage!.toJson();
    }
    if (secondStage != null) {
      data['second_stage'] = secondStage!.toJson();
    }
    if (engines != null) {
      data['engines'] = engines!.toJson();
    }
    if (landingLegs != null) {
      data['landing_legs'] = landingLegs!.toJson();
    }
    if (payloadWeights != null) {
      data['payload_weights'] = payloadWeights!.map((v) => v.toJson()).toList();
    }
    data['flickr_images'] = flickrImages;
    data['name'] = name;
    data['type'] = type;
    data['active'] = active;
    data['stages'] = stages;
    data['boosters'] = boosters;
    data['cost_per_launch'] = costPerLaunch;
    data['success_rate_pct'] = successRatePct;
    data['first_flight'] = firstFlight;
    data['country'] = country;
    data['company'] = company;
    data['wikipedia'] = wikipedia;
    data['description'] = description;
    data['id'] = id;
    return data;
  }
}

class Height {
  String? meters;
  String? feet;

  Height({this.meters, this.feet});

  Height.fromJson(Map<String, dynamic> json) {
    meters = json['meters'].toString();
    feet = json['feet'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['meters'] = meters;
    data['feet'] = feet;
    return data;
  }
}

class Diameter {
  String? meters;
  String? feet;

  Diameter({this.meters, this.feet});

  Diameter.fromJson(Map<String, dynamic> json) {
    meters = json['meters'].toString();
    feet = json['feet'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['meters'] = meters;
    data['feet'] = feet;
    return data;
  }
}

class Mass {
  String? kg;
  String? lb;

  Mass({this.kg, this.lb});

  Mass.fromJson(Map<String, dynamic> json) {
    kg = json['kg'].toString();
    lb = json['lb'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kg'] = kg;
    data['lb'] = lb;
    return data;
  }
}

class FirstStage {
  ThrustSeaLevel? thrustSeaLevel;
  ThrustSeaLevel? thrustVacuum;
  String? reusable;
  String? engines;
  String? fuelAmountTons;
  String? burnTimeSec;

  FirstStage(
      {this.thrustSeaLevel,
      this.thrustVacuum,
      this.reusable,
      this.engines,
      this.fuelAmountTons,
      this.burnTimeSec});

  FirstStage.fromJson(Map<String, dynamic> json) {
    thrustSeaLevel = json['thrust_sea_level'] != null
        ? ThrustSeaLevel.fromJson(json['thrust_sea_level'])
        : null;
    thrustVacuum = json['thrust_vacuum'] != null
        ? ThrustSeaLevel.fromJson(json['thrust_vacuum'])
        : null;
    reusable = json['reusable'].toString();
    engines = json['engines'].toString();
    fuelAmountTons = json['fuel_amount_tons'].toString();
    burnTimeSec = json['burn_time_sec'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (thrustSeaLevel != null) {
      data['thrust_sea_level'] = thrustSeaLevel!.toJson();
    }
    if (thrustVacuum != null) {
      data['thrust_vacuum'] = thrustVacuum!.toJson();
    }
    data['reusable'] = reusable;
    data['engines'] = engines;
    data['fuel_amount_tons'] = fuelAmountTons;
    data['burn_time_sec'] = burnTimeSec;
    return data;
  }
}

class ThrustSeaLevel {
  String? kN;
  String? lbf;

  ThrustSeaLevel({this.kN, this.lbf});

  ThrustSeaLevel.fromJson(Map<String, dynamic> json) {
    kN = json['kN'].toString();
    lbf = json['lbf'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kN'] = kN;
    data['lbf'] = lbf;
    return data;
  }
}

class SecondStage {
  ThrustSeaLevel? thrust;
  Payloads? payloads;
  String? reusable;
  String? engines;
  String? fuelAmountTons;
  String? burnTimeSec;

  SecondStage(
      {this.thrust,
      this.payloads,
      this.reusable,
      this.engines,
      this.fuelAmountTons,
      this.burnTimeSec});

  SecondStage.fromJson(Map<String, dynamic> json) {
    thrust =
        json['thrust'] != null ? ThrustSeaLevel.fromJson(json['thrust']) : null;
    payloads =
        json['payloads'] != null ? Payloads.fromJson(json['payloads']) : null;
    reusable = json['reusable'].toString();
    engines = json['engines'].toString();
    fuelAmountTons = json['fuel_amount_tons'].toString();
    burnTimeSec = json['burn_time_sec'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (thrust != null) {
      data['thrust'] = thrust!.toJson();
    }
    if (payloads != null) {
      data['payloads'] = payloads!.toJson();
    }
    data['reusable'] = reusable;
    data['engines'] = engines;
    data['fuel_amount_tons'] = fuelAmountTons;
    data['burn_time_sec'] = burnTimeSec;
    return data;
  }
}

class Payloads {
  CompositeFairing? compositeFairing;
  String? option1;

  Payloads({this.compositeFairing, this.option1});

  Payloads.fromJson(Map<String, dynamic> json) {
    compositeFairing = json['composite_fairing'] != null
        ? CompositeFairing.fromJson(json['composite_fairing'])
        : null;
    option1 = json['option_1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (compositeFairing != null) {
      data['composite_fairing'] = compositeFairing!.toJson();
    }
    data['option_1'] = option1;
    return data;
  }
}

class CompositeFairing {
  Diameter? height;
  Diameter? diameter;

  CompositeFairing({this.height, this.diameter});

  CompositeFairing.fromJson(Map<String, dynamic> json) {
    height = json['height'] != null ? Diameter.fromJson(json['height']) : null;
    diameter =
        json['diameter'] != null ? Diameter.fromJson(json['diameter']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (height != null) {
      data['height'] = height!.toJson();
    }
    if (diameter != null) {
      data['diameter'] = diameter!.toJson();
    }
    return data;
  }
}

class Engines {
  Isp? isp;
  ThrustSeaLevel? thrustSeaLevel;
  ThrustSeaLevel? thrustVacuum;
  String? number;
  String? type;
  String? version;
  String? layout;
  String? engineLossMax;
  String? propellant1;
  String? propellant2;
  String? thrustToWeight;

  Engines(
      {this.isp,
      this.thrustSeaLevel,
      this.thrustVacuum,
      this.number,
      this.type,
      this.version,
      this.layout,
      this.engineLossMax,
      this.propellant1,
      this.propellant2,
      this.thrustToWeight});

  Engines.fromJson(Map<String, dynamic> json) {
    isp = json['isp'] != null ? Isp.fromJson(json['isp']) : null;
    thrustSeaLevel = json['thrust_sea_level'] != null
        ? ThrustSeaLevel.fromJson(json['thrust_sea_level'])
        : null;
    thrustVacuum = json['thrust_vacuum'] != null
        ? ThrustSeaLevel.fromJson(json['thrust_vacuum'])
        : null;
    number = json['number'].toString();
    type = json['type'];
    version = json['version'];
    layout = json['layout'];
    engineLossMax = json['engine_loss_max'].toString();
    propellant1 = json['propellant_1'];
    propellant2 = json['propellant_2'];
    thrustToWeight = json['thrust_to_weight'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (isp != null) {
      data['isp'] = isp!.toJson();
    }
    if (thrustSeaLevel != null) {
      data['thrust_sea_level'] = thrustSeaLevel!.toJson();
    }
    if (thrustVacuum != null) {
      data['thrust_vacuum'] = thrustVacuum!.toJson();
    }
    data['number'] = number;
    data['type'] = type;
    data['version'] = version;
    data['layout'] = layout;
    data['engine_loss_max'] = engineLossMax;
    data['propellant_1'] = propellant1;
    data['propellant_2'] = propellant2;
    data['thrust_to_weight'] = thrustToWeight;
    return data;
  }
}

class Isp {
  String? seaLevel;
  String? vacuum;

  Isp({this.seaLevel, this.vacuum});

  Isp.fromJson(Map<String, dynamic> json) {
    seaLevel = json['sea_level'].toString();
    vacuum = json['vacuum'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sea_level'] = seaLevel;
    data['vacuum'] = vacuum;
    return data;
  }
}

class LandingLegs {
  String? number;
  String? material;

  LandingLegs({this.number, this.material});

  LandingLegs.fromJson(Map<String, dynamic> json) {
    number = json['number'].toString();
    material = json['material'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['material'] = material;
    return data;
  }
}

class PayloadWeights {
  String? id;
  String? name;
  String? kg;
  String? lb;

  PayloadWeights({this.id, this.name, this.kg, this.lb});

  PayloadWeights.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    kg = json['kg'].toString();
    lb = json['lb'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['kg'] = kg;
    data['lb'] = lb;
    return data;
  }
}
