import 'package:flutter/material.dart';
import 'package:solucionador_flutter/models/api_response.dart';

class ResultScreen extends StatelessWidget {
  final ApiResponse response;
  const ResultScreen({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    final resumen = response.resumen;
    final detalle = response.detalleIteraciones;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.primary),
          tooltip: 'Volver',
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Resultados',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Resumen', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 8),
                    Text('Método: ${resumen['metodo']}'),
                    Text('Ecuación: ${resumen['ecuacion']}'),
                    Text('Raíz encontrada: ${resumen['raiz']}'),
                    Text('f(raíz): ${resumen['f_raiz']}'),
                    Text('Iteraciones: ${resumen['iteraciones']}'),
                    Text('Error absoluto final: ${resumen['error_absoluto_final']}'),
                    Text('Error relativo final: ${resumen['error_relativo_final']}'),
                    Text('¿Convergió?: ${resumen['convergio'] ? 'Sí' : 'No'}'),
                    Text('Mensaje: ${resumen['mensaje_estado']}'),
                    Text('Tiempo de ejecución: ${resumen['tiempo_ejecucion_seg']} s'),
                    Text('Memoria usada: ${resumen['memoria_bytes']} bytes'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Detalle de iteraciones', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            SizedBox(
              height: 320,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: detalle.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, i) {
                    final it = detalle[i];
                    return ListTile(
                      leading: Text('#${it['iteracion']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      title: Text('x = ${it['valor']}'),
                      subtitle: Text('f(x) = ${it['f_x']}\nError abs: ${it['error_absoluto']}\nError rel: ${it['error_relativo']}'),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (response.compararMetodosResult != null)
              Card(
                color: Colors.indigo.shade50,
                elevation: 1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(response.compararMetodosResult!),
                ),
              ),
            if (response.graficasGeneradas.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text('Archivos de gráficas generadas: ${response.graficasGeneradas.join(', ')}'),
              ),
          ],
        ),
      ),
    );
  }
}
