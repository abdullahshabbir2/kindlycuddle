import 'package:cuddle_care/Domain/Entity/pulse_weight.dart';
import 'package:cuddle_care/Domain/Failure/get_pulse_weight_failure.dart';
import 'package:cuddle_care/Domain/Failure/set_pulse_weight_failure.dart';
import 'package:cuddle_care/Domain/Repository/ble_data_repository.dart';
import 'package:cuddle_care/Service/Shared%20Preference%20Service/shared_preference_service.dart';
import 'package:dartz/dartz.dart';

class SharedPreferenceBleDataRepository implements BleDataRepository{
  final SharedPreferenceService service;
  SharedPreferenceBleDataRepository(this.service);
  @override
  Future<Either<GetPulseWeightFailure, PulseWeight>> getPulseWeight() {
    // TODO: implement getPulseWeight
    return service.getPulseWeight();
  }

  @override
  Future<Either<SetPulseWeightFailure, bool>> setPulse(double pulse, double weight) {
    // TODO: implement setPulse
    return service.setPulseWeight(pulse , weight);
  }



}