class StockListDTO {
  String? id;
  String? title;
  String? slug;
  String? code;
  Overview? overview;
  Price? price;
  General? general;

  StockListDTO(
      {this.id,
      this.title,
      this.slug,
      this.code,
      this.overview,
      this.price,
      this.general});

  StockListDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    code = json['code'];
    overview =
        json['overview'] != null ? Overview.fromJson(json['overview']) : null;
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    general =
        json['general'] != null ? General.fromJson(json['general']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['code'] = code;
    if (overview != null) {
      data['overview'] = overview!.toJson();
    }
    if (price != null) {
      data['price'] = price!.toJson();
    }
    if (general != null) {
      data['general'] = general!.toJson();
    }
    return data;
  }
}

class Overview {
  String? brand;
  String? color;
  String? edition;
  String? condition;
  String? transmission;
  String? fuel;
  String? skeleton;
  String? availability;
  String? grade;
  String? model;

  Overview(
      {this.brand,
      this.color,
      this.edition,
      this.condition,
      this.transmission,
      this.fuel,
      this.skeleton,
      this.availability,
      this.grade,
      this.model});

  Overview.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    color = json['color'];
    edition = json['edition'];
    condition = json['condition'];
    transmission = json['transmission'];
    fuel = json['fuel'];
    skeleton = json['skeleton'];
    availability = json['availability'];
    grade = json['grade'];
    model = json['model'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand'] = brand;
    data['color'] = color;
    data['edition'] = edition;
    data['condition'] = condition;
    data['transmission'] = transmission;
    data['fuel'] = fuel;
    data['skeleton'] = skeleton;
    data['availability'] = availability;
    data['grade'] = grade;
    data['model'] = model;
    return data;
  }
}

class Price {
  String? asking;
  String? purchase;
  String? fixed;
  String? additional;
  String? total;
  bool? negotiable;

  Price(
      {this.asking,
      this.purchase,
      this.fixed,
      this.additional,
      this.total,
      this.negotiable});

  Price.fromJson(Map<String, dynamic> json) {
    asking = json['asking'];
    purchase = json['purchase'];
    fixed = json['fixed'];
    additional = json['additional'];
    total = json['total'];
    negotiable = json['negotiable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['asking'] = asking;
    data['purchase'] = purchase;
    data['fixed'] = fixed;
    data['additional'] = additional;
    data['total'] = total;
    data['negotiable'] = negotiable;
    return data;
  }
}

class General {
  String? capacity;
  String? mileage;
  String? registration;
  String? manufacture;
  String? engine;
  String? chassis;

  General(
      {this.capacity,
      this.mileage,
      this.registration,
      this.manufacture,
      this.engine,
      this.chassis});

  General.fromJson(Map<String, dynamic> json) {
    capacity = json['capacity'];
    mileage = json['mileage'];
    registration = json['registration'];
    manufacture = json['manufacture'];
    engine = json['engine'];
    chassis = json['chassis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['capacity'] = capacity;
    data['mileage'] = mileage;
    data['registration'] = registration;
    data['manufacture'] = manufacture;
    data['engine'] = engine;
    data['chassis'] = chassis;
    return data;
  }
}
