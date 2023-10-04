import 'package:equatable/equatable.dart';
import 'package:myapp/horario/data/model/horario.dart';
import 'package:myapp/medico/data/model/medico.dart';

import '../../paciente/data/model/paciente.dart';

// ignore: must_be_immutable
class ConsultaEntity extends Equatable {
  late int? consultaId;
  final int pacienteId;
  final int medicoId;
  final int horarioId;
  final PacienteModel paciente;
  final MedicoModel medico;
  final HorarioModel horario;
  final bool status;

  ConsultaEntity({
    this.consultaId,
    required this.medicoId,
    required this.medico,
    required this.pacienteId,
    required this.paciente,
    required this.horarioId,
    required this.horario,
    required this.status,
  });

  @override
  List<Object?> get props => [consultaId];
}
