import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../realm/model/app.dart';
import '../../realm/realm_manager.dart';

part 'favorite_control.g.dart';

@riverpod
class FavoriteControl extends _$FavoriteControl {
  @override
  Future<List<FavoriteRealm>> build() async {
    return RealmManager().retrieveFavorites();
  }
}
