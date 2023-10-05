class MedicoModel {
  late int? id_medico;
  final String nome;
  final String crm;
  final String cpf;
  final String especilidade;
  final String telefone;
  final String email;

  MedicoModel({
    this.id_medico,
    required this.nome,
    required this.crm,
    required this.cpf,
    required this.especilidade,
    required this.telefone,
    required this.email,
  });

  factory MedicoModel.fromMap(Map<String, dynamic> map){
    return MedicoModel(
      id_medico: map['id_medico'],
      nome: map['nome'],
      crm: map['crm'],
      cpf: map['cpf'],
      especilidade: map['especilidade'],
      telefone: map['telefone'],
      email: map['email'],
    );
  }
}
