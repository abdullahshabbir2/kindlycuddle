
class BluetoothDeviceInfo{
  final String? id;
  final String? name;
  final String? rssi;
  BluetoothDeviceInfo({
    this.id,
    this.name,
    this.rssi
  });

  BluetoothDeviceInfo copyWith({
    String? id,
    String? name,
    String? rssi
  }) => BluetoothDeviceInfo(
      id: id ?? this.id,
      rssi: rssi ?? this.rssi,
      name: name ?? this.name
  );

  const BluetoothDeviceInfo.empty() :
        id = '',
        name = '',
        rssi = ''
  ;

}