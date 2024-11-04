import 'package:cuddle_care/Domain/Entity/pulse_weight.dart';
import 'package:cuddle_care/Domain/Failure/get_pulse_weight_failure.dart';
import 'package:cuddle_care/Domain/Failure/set_pulse_weight_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService{
  Future<Either<GetPulseWeightFailure, PulseWeight>> getPulseWeight() async {
    try{
      final prefs = await SharedPreferences.getInstance();

      // Get an integer
      double? pulse = prefs.getDouble('pulse') ?? 0;
      double? weight = prefs.getDouble('weight') ?? 0;

      PulseWeight data = PulseWeight(pulse: pulse , weight:  weight);

      return right(data);
    }catch(e){
      return left(GetPulseWeightFailure(e.toString()));
    }
  }

  Future<Either<SetPulseWeightFailure, bool>> setPulseWeight(double pulse, double weight) async {
    try{
      final prefs = await SharedPreferences.getInstance();
      prefs.setDouble('pulse', pulse);
      prefs.setDouble('weight', weight);

      return right(true);

    }catch(e){
      return left(SetPulseWeightFailure(e.toString()));
    }
  }



}