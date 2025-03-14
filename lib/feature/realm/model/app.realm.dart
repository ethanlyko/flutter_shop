// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ProductRealm extends _ProductRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  ProductRealm(
    int id,
    String title,
    int price,
    String description, {
    int quantity = 1,
    String? orderId,
    Iterable<String?> images = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<ProductRealm>({
        'quantity': 1,
      });
    }
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'quantity', quantity);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'orderId', orderId);
    RealmObjectBase.set<RealmList<String?>>(
        this, 'images', RealmList<String?>(images));
  }

  ProductRealm._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  int get price => RealmObjectBase.get<int>(this, 'price') as int;
  @override
  set price(int value) => RealmObjectBase.set(this, 'price', value);

  @override
  int get quantity => RealmObjectBase.get<int>(this, 'quantity') as int;
  @override
  set quantity(int value) => RealmObjectBase.set(this, 'quantity', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  String? get orderId =>
      RealmObjectBase.get<String>(this, 'orderId') as String?;
  @override
  set orderId(String? value) => RealmObjectBase.set(this, 'orderId', value);

  @override
  RealmList<String?> get images =>
      RealmObjectBase.get<String?>(this, 'images') as RealmList<String?>;
  @override
  set images(covariant RealmList<String?> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<ProductRealm>> get changes =>
      RealmObjectBase.getChanges<ProductRealm>(this);

  @override
  Stream<RealmObjectChanges<ProductRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ProductRealm>(this, keyPaths);

  @override
  ProductRealm freeze() => RealmObjectBase.freezeObject<ProductRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'title': title.toEJson(),
      'price': price.toEJson(),
      'quantity': quantity.toEJson(),
      'description': description.toEJson(),
      'orderId': orderId.toEJson(),
      'images': images.toEJson(),
    };
  }

  static EJsonValue _toEJson(ProductRealm value) => value.toEJson();
  static ProductRealm _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'title': EJsonValue title,
        'price': EJsonValue price,
        'description': EJsonValue description,
      } =>
        ProductRealm(
          fromEJson(id),
          fromEJson(title),
          fromEJson(price),
          fromEJson(description),
          quantity: fromEJson(ejson['quantity'], defaultValue: 1),
          orderId: fromEJson(ejson['orderId']),
          images: fromEJson(ejson['images']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ProductRealm._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, ProductRealm, 'ProductRealm', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('price', RealmPropertyType.int),
      SchemaProperty('quantity', RealmPropertyType.int),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('orderId', RealmPropertyType.string, optional: true),
      SchemaProperty('images', RealmPropertyType.string,
          optional: true, collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class OrderRealm extends _OrderRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  OrderRealm(
    String? id,
    int status,
    String uid, {
    DateTime? dateTime,
    Iterable<ProductRealm> items = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'dateTime', dateTime);
    RealmObjectBase.set(this, 'status', status);
    RealmObjectBase.set(this, 'uid', uid);
    RealmObjectBase.set<RealmList<ProductRealm>>(
        this, 'items', RealmList<ProductRealm>(items));
  }

  OrderRealm._();

  @override
  String? get id => RealmObjectBase.get<String>(this, 'id') as String?;
  @override
  set id(String? value) => RealmObjectBase.set(this, 'id', value);

  @override
  DateTime? get dateTime =>
      RealmObjectBase.get<DateTime>(this, 'dateTime') as DateTime?;
  @override
  set dateTime(DateTime? value) => RealmObjectBase.set(this, 'dateTime', value);

  @override
  int get status => RealmObjectBase.get<int>(this, 'status') as int;
  @override
  set status(int value) => RealmObjectBase.set(this, 'status', value);

  @override
  String get uid => RealmObjectBase.get<String>(this, 'uid') as String;
  @override
  set uid(String value) => RealmObjectBase.set(this, 'uid', value);

  @override
  RealmList<ProductRealm> get items =>
      RealmObjectBase.get<ProductRealm>(this, 'items')
          as RealmList<ProductRealm>;
  @override
  set items(covariant RealmList<ProductRealm> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<OrderRealm>> get changes =>
      RealmObjectBase.getChanges<OrderRealm>(this);

  @override
  Stream<RealmObjectChanges<OrderRealm>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<OrderRealm>(this, keyPaths);

  @override
  OrderRealm freeze() => RealmObjectBase.freezeObject<OrderRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'dateTime': dateTime.toEJson(),
      'status': status.toEJson(),
      'uid': uid.toEJson(),
      'items': items.toEJson(),
    };
  }

  static EJsonValue _toEJson(OrderRealm value) => value.toEJson();
  static OrderRealm _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'status': EJsonValue status,
        'uid': EJsonValue uid,
      } =>
        OrderRealm(
          fromEJson(ejson['id']),
          fromEJson(status),
          fromEJson(uid),
          dateTime: fromEJson(ejson['dateTime']),
          items: fromEJson(ejson['items']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(OrderRealm._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, OrderRealm, 'OrderRealm', [
      SchemaProperty('id', RealmPropertyType.string,
          optional: true, primaryKey: true),
      SchemaProperty('dateTime', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('status', RealmPropertyType.int),
      SchemaProperty('uid', RealmPropertyType.string),
      SchemaProperty('items', RealmPropertyType.object,
          linkTarget: 'ProductRealm', collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class FavoriteRealm extends _FavoriteRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  FavoriteRealm(
    String? uuid,
    int productId,
    String title,
    int price,
    String description, {
    Iterable<String?> images = const [],
  }) {
    RealmObjectBase.set(this, 'uuid', uuid);
    RealmObjectBase.set(this, 'productId', productId);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set<RealmList<String?>>(
        this, 'images', RealmList<String?>(images));
  }

  FavoriteRealm._();

  @override
  String? get uuid => RealmObjectBase.get<String>(this, 'uuid') as String?;
  @override
  set uuid(String? value) => RealmObjectBase.set(this, 'uuid', value);

  @override
  int get productId => RealmObjectBase.get<int>(this, 'productId') as int;
  @override
  set productId(int value) => RealmObjectBase.set(this, 'productId', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  int get price => RealmObjectBase.get<int>(this, 'price') as int;
  @override
  set price(int value) => RealmObjectBase.set(this, 'price', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  RealmList<String?> get images =>
      RealmObjectBase.get<String?>(this, 'images') as RealmList<String?>;
  @override
  set images(covariant RealmList<String?> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<FavoriteRealm>> get changes =>
      RealmObjectBase.getChanges<FavoriteRealm>(this);

  @override
  Stream<RealmObjectChanges<FavoriteRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<FavoriteRealm>(this, keyPaths);

  @override
  FavoriteRealm freeze() => RealmObjectBase.freezeObject<FavoriteRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'uuid': uuid.toEJson(),
      'productId': productId.toEJson(),
      'title': title.toEJson(),
      'price': price.toEJson(),
      'description': description.toEJson(),
      'images': images.toEJson(),
    };
  }

  static EJsonValue _toEJson(FavoriteRealm value) => value.toEJson();
  static FavoriteRealm _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'uuid': EJsonValue uuid,
        'productId': EJsonValue productId,
        'title': EJsonValue title,
        'price': EJsonValue price,
        'description': EJsonValue description,
      } =>
        FavoriteRealm(
          fromEJson(ejson['uuid']),
          fromEJson(productId),
          fromEJson(title),
          fromEJson(price),
          fromEJson(description),
          images: fromEJson(ejson['images']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(FavoriteRealm._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, FavoriteRealm, 'FavoriteRealm', [
      SchemaProperty('uuid', RealmPropertyType.string,
          optional: true, primaryKey: true),
      SchemaProperty('productId', RealmPropertyType.int),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('price', RealmPropertyType.int),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('images', RealmPropertyType.string,
          optional: true, collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
