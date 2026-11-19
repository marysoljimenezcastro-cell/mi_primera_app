import 'package:flutter/material.dart';

import '../models/curso.dart';

class DetailView extends StatefulWidget {
  final Curso curso;

  const DetailView({super.key, required this.curso});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  bool _inscrito = false;

  void _alternarInscripcion() {
    setState(() {
      _inscrito = !_inscrito;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _inscrito
              ? 'Inscrito en ${widget.curso.nombre}'
              : 'Inscripción cancelada',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final curso = widget.curso;
    return Scaffold(
      appBar: AppBar(
        title: Text(curso.nombre),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Center(
            child: CircleAvatar(
              radius: 48,
              child: Icon(Icons.menu_book, size: 48),
            ),
          ),
          const SizedBox(height: 24),
          Text(curso.nombre, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.person),
              const SizedBox(width: 8),
              Text(curso.instructor),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.schedule),
              const SizedBox(height: 12),
              Chip(
                avatar: const Icon(Icons.school),
                label: Text(curso.modalidad),
              ),
              const SizedBox(width: 8),
              Text('${curso.horas} horas'),
            ],
          ),
          const Divider(height: 32),
          Text(curso.descripcion, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 32),
          FilledButton.icon(
            onPressed: _alternarInscripcion,
            icon: Icon(_inscrito ? Icons.check : Icons.add),
            label: Text(_inscrito ? 'Inscrito' : 'Inscribirme'),
          ),
        ],
      ),
    );
  }
}
