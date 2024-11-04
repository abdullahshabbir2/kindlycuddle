import 'package:cuddle_care/Domain/Failure/set_pulse_weight_failure.dart';
import 'package:cuddle_care/Domain/Repository/ble_data_repository.dart';
import 'package:dartz/dartz.dart';

class SetPulseWeightUseCase{
  final BleDataRepository repository;
  SetPulseWeightUseCase(this.repository);

  Future<Either< SetPulseWeightFailure , bool >> execute(double pulse , double weight){
    return repository.setPulse(pulse , weight);
  }

}