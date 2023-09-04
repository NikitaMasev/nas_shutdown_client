import 'dart:io';

import 'package:iot_internal/iot_internal.dart';

final portNas = int.parse(Platform.environment['PORT_NAS'] ?? '5080');
final portClients = int.parse(Platform.environment['PORT_CLIENTS'] ?? '5090');
final ipNas = Platform.environment['IP_NAS'] ?? 'localhost';
final ipClients = Platform.environment['IP_CLIENTS'] ?? 'localhost';
final usernameNas = Platform.environment['USERNAME_NAS'] ?? 'username';
final passwordNas = Platform.environment['PASSWORD_NAS'] ?? 'password';
final _keyClients = Platform.environment['KEY_CLIENTS'] ?? '0123456789561011';
final _ivClients = Platform.environment['IV_CLIENTS'] ?? '0123456789561011';
final nameDevice = Platform.environment['NAME_DEVICE'] ?? 'nas_shutdown';

final cryptoClients = CryptoImpl(key: _keyClients, iv: _ivClients);
