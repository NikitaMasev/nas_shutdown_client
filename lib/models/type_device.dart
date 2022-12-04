enum TypeDevice {
  ups,
  lamp,
  rgba,
  rgbaAddress,
  tempSensor,
  unknown,
}

enum TypeControl {
  powerOn,
  powerOff,
  rgba,
  rgbaEffects,
  changeName,
  register,
}

const mapDevicesControls = <TypeDevice, List<TypeControl>>{
  TypeDevice.ups: [
    TypeControl.changeName,
    TypeControl.register,
  ],
  TypeDevice.lamp: [
    TypeControl.powerOn,
    TypeControl.powerOff,
    TypeControl.changeName,
    TypeControl.register,
  ],
  TypeDevice.rgba: [
    TypeControl.powerOn,
    TypeControl.powerOff,
    TypeControl.rgba,
    TypeControl.changeName,
    TypeControl.register,
  ],
  TypeDevice.rgbaAddress: [
    TypeControl.powerOn,
    TypeControl.powerOff,
    TypeControl.rgba,
    TypeControl.rgbaEffects,
    TypeControl.changeName,
    TypeControl.register,
  ],
  TypeDevice.tempSensor: [
    TypeControl.changeName,
    TypeControl.register,
  ],
  TypeDevice.unknown: [],
};

const typeControlFromString = {
  'powerOn': TypeControl.powerOn,
  'powerOff': TypeControl.powerOff,
  'rgba': TypeControl.rgba,
  'rgbaEffects': TypeControl.rgbaEffects,
  'changeName': TypeControl.changeName,
  'register': TypeControl.register,
};

const typeControlToString = {
  TypeControl.powerOn: 'powerOn',
  TypeControl.powerOff: 'powerOff',
  TypeControl.rgba: 'rgba',
  TypeControl.rgbaEffects: 'rgbaEffects',
  TypeControl.changeName: 'changeName',
  TypeControl.register: 'register',
};

const typeDeviceFromString = {
  'ups': TypeDevice.ups,
  'lamp': TypeDevice.lamp,
  'rgba': TypeDevice.rgba,
  'rgbaAddress': TypeDevice.rgbaAddress,
  'tempSensor': TypeDevice.tempSensor,
  'unknown': TypeDevice.unknown,
};

const typeDeviceToString = {
  TypeDevice.ups: 'ups',
  TypeDevice.lamp: 'lamp',
  TypeDevice.rgba: 'rgba',
  TypeDevice.rgbaAddress: 'rgbaAddress',
  TypeDevice.tempSensor: 'tempSensor',
  TypeDevice.unknown: 'unknown',
};
