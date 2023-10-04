import 'package:equatable/equatable.dart';
import 'package:myapp/medico/data/model/medico.dart';

// ignore: must_be_immutable
class HorarioEntity extends Equatable {
  late int? horarioId;
  final int medicoId;
  final MedicoModel medico;
  final DateTime data;
  final bool status;

  HorarioEntity({
    this.horarioId,
    required this.medicoId,
    required this.medico,
    required this.data,
    required this.status,
  });

  @override
  List<Object?> get props => [horarioId];
}
