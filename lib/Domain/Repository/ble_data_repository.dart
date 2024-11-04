import 'package:cuddle_care/Domain/Entity/pulse_weight.dart';
import 'package:cuddle_care/Domain/Failure/get_pulse_weight_failure.dart';
import 'package:cuddle_care/Domain/Failure/set_pulse_weight_failure.dart';
import 'package:dartz/dartz.dart';

abstract class BleDataRepository{
  Future<Either< GetPulseWeightFailure , PulseWeight >> getPulseWeight();

  Future<Either<SetPulseWeightFailure, bool>> setPulse(double pulse, double weight);
}