import 'package:flutter/material.dart';
import 'package:myapp/medico/data/http/http_client.dart';
import 'package:myapp/medico/data/repositories/medico_repository.dart';
import 'package:myapp/medico/pages/presentation/store/medico_store.dart';

import '../../../shared/widgets/mylisttile.dart';

class MedicoList extends StatefulWidget {
  const MedicoList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MedicoPageState createState() => _MedicoPageState();
}

class _MedicoPageState extends State<MedicoList> {
  final MedicoStore store = MedicoStore(
    repository: MedicoRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    store.getMedicos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicos'),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge(
          [
            store.state,
            store.isLoading,
            store.erro,
          ],
        ),
        builder: (context, child) {
          if (store.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (store.erro.value.isNotEmpty) {
            return Center(
              child: Text(store.erro.value),
            );
          }

          if (store.state.value.isEmpty) {
            return const Center(
              child: Text('Nenhum medico cadastrado'),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 32,
              ),
              padding: const EdgeInsets.all(16),
              itemCount: store.state.value.length,
              itemBuilder: (_, index) { 
                final medico = store.state.value[index];
                return MyListTile(
                  title: medico.nome,
                  line01Text: medico.especilidade,
                  line02Text: medico.crm,
                );
              },
            );
          }
        },
      ),
    );
  }
}
