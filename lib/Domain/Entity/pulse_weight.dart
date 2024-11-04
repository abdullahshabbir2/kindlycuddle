
class PulseWeight{
  final double? pulse;
  final double? weight;
  PulseWeight({
    this.pulse,
    this.weight
  });

  PulseWeight copyWith({
    double? pulse,
    double? weight,
  }) => PulseWeight(
      pulse: pulse ?? this.pulse,
      weight:weight ?? this.weight,
  );

  const PulseWeight.empty() :
        pulse = 0,
        weight = 0
  ;

}