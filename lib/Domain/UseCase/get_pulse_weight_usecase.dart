import 'package:cuddle_care/Domain/Entity/pulse_weight.dart';
import 'package:cuddle_care/Domain/Failure/get_pulse_weight_failure.dart';
import 'package:cuddle_care/Domain/Repository/ble_data_repository.dart';
import 'package:dartz/dartz.dart';

class GetPulseWeightUseCase{
  final BleDataRepository bleDataRepository;
  GetPulseWeightUseCase(this.bleDataRepository);


  Future<Either< GetPulseWeightFailure , PulseWeight >> execute(){
    return bleDataRepository.getPulseWeight();
  }

}