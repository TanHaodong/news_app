import 'package:localstorage/localstorage.dart';
import 'package:news_app/common/values/values.dart';

/// 本地储存
/// 单例 StorageUtil().getItem('key')
class StorageUtil {
  // static final StorageUtil _singleton = StorageUtil().internal();
  static late final StorageUtil _singleton;
  LocalStorage? _storage;

  factory StorageUtil() {
    return getInstance();
  }

  static StorageUtil getInstance() {
    _singleton = StorageUtil._internal();

    return _singleton;
  }

  StorageUtil._internal() {
    _storage = LocalStorage(STORAGE_MASTER_KEY);
  }

  // 获取数据
  String getItem(String key) {
    return _storage?.getItem(key);
  }

  // 建立数据
  Future<void> setItem(String key, String val) async {
    await _storage?.setItem(key, val);
  }
}
