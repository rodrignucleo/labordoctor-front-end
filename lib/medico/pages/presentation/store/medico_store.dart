import 'package:flutter/material.dart';
import 'package:myapp/medico/data/model/medico_model.dart';
import 'package:myapp/medico/data/repositories/medico_repository.dart';

class MedicoStore{
  final IMedicoRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  final ValueNotifier<List<MedicoModel>> state = 
    ValueNotifier<List<MedicoModel>>([]);
  
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  MedicoStore({required this.repository});

  void getMedicos() async {
    isLoading.value = true;

    try {
      final result = await repository.getMedico();
      state.value = result;

    } catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
    
  }
}