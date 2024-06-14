import 'package:flutter/material.dart';

class WorkoutPlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Planejamento de Treino',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: treinos.length,
        itemBuilder: (context, index) {
          final treino = treinos[index];
          Color cardColor;

          switch (treino.resumo) {
            case 'Superiores':
              cardColor = Color.fromARGB(255, 181, 4, 197);
              break;
            case 'Inferiores':
              cardColor = Color.fromARGB(255, 153, 101, 140);
              break;
            case 'Costas e Bíceps':
              cardColor = Color.fromARGB(255, 235, 4, 177);
              break;
            default:
              cardColor = Colors.white;
          }

          return Card(
            color: cardColor,
            child: ListTile(
              title: Text(
                treino.dia,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Resumo: ${treino.resumo}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  ...treino.exercicios
                      .map((exercicio) => Text(
                            exercicio,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ))
                      .toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Treino {
  final String dia;
  final List<String> exercicios;
  final String resumo;

  Treino({required this.dia, required this.exercicios, required this.resumo});
}

final List<Treino> treinos = [
  Treino(
    dia: 'Segunda-feira',
    exercicios: [
      'Supino Reto - 4x12',
      'Supino Inclinado - 4x12',
      'Desenvolvimento com Halteres - 4x12',
      'Elevação Lateral - 4x12',
    ],
    resumo: 'Superiores',
  ),
  Treino(
    dia: 'Terça-feira',
    exercicios: [
      'Agachamento Livre - 4x12',
      'Leg Press - 4x12',
      'Extensora - 4x12',
      'Flexora - 4x12',
    ],
    resumo: 'Inferiores',
  ),
  Treino(
    dia: 'Quarta-feira',
    exercicios: [
      'Barra Fixa - 4x12',
      'Remada Curvada - 4x12',
      'Puxada Frontal - 4x12',
      'Rosca Direta - 4x12',
    ],
    resumo: 'Costas e Bíceps',
  ),
  Treino(
    dia: 'Quinta-feira',
    exercicios: [
      'Supino Reto - 4x12',
      'Supino Inclinado - 4x12',
      'Desenvolvimento com Halteres - 4x12',
      'Elevação Lateral - 4x12',
    ],
    resumo: 'Superiores',
  ),
  Treino(
    dia: 'Sexta-feira',
    exercicios: [
      'Agachamento Livre - 4x12',
      'Leg Press - 4x12',
      'Extensora - 4x12',
      'Flexora - 4x12',
    ],
    resumo: 'Inferiores',
  ),
  Treino(
    dia: 'Sábado',
    exercicios: [
      'Barra Fixa - 4x12',
      'Remada Curvada - 4x12',
      'Puxada Frontal - 4x12',
      'Rosca Direta - 4x12',
    ],
    resumo: 'Costas e Bíceps',
  ),
];
