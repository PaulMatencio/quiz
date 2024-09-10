class Device {
  bool device;
  bool screen;

  Device({required this.device,required this.screen});
  Map<String,bool>getDevice()  {
    Map<String,bool> dev= {
    "device" : device,
    "screen" : screen
    };
    return dev;
  }
}