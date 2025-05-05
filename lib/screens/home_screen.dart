import 'package:flutter/material.dart';
import 'package:solucionador_flutter/widgets/custom_input.dart';
import 'package:solucionador_flutter/widgets/primary_button.dart';
import 'package:solucionador_flutter/services/api_service.dart';
import 'package:solucionador_flutter/models/api_response.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController ecuacionCtrl = TextEditingController();
  final TextEditingController aCtrl = TextEditingController();
  final TextEditingController bCtrl = TextEditingController();
  final TextEditingController x0Ctrl = TextEditingController();
  final TextEditingController x1Ctrl = TextEditingController();
  final TextEditingController tolCtrl = TextEditingController(text: '1e-6');
  final TextEditingController maxIterCtrl = TextEditingController(text: '100');

  String metodo = 'biseccion';
  bool loading = false;
  String? errorMsg;

  void _resolver() async {
    setState(() {
      loading = true;
      errorMsg = null;
    });
    try {
      final params = <String, dynamic>{
        'ecuacion': ecuacionCtrl.text,
        'metodo': metodo,
        'tol': tolCtrl.text,
        'max_iter': maxIterCtrl.text,
      };
      if (metodo == 'biseccion') {
        params['a'] = aCtrl.text;
        params['b'] = bCtrl.text;
      } else if (metodo == 'newton-raphson') {
        params['x0'] = x0Ctrl.text;
      } else if (metodo == 'secante') {
        params['x0'] = x0Ctrl.text;
        params['x1'] = x1Ctrl.text;
      }
      final apiResponse = await ApiService.resolverEcuacion(params);
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(response: apiResponse),
        ),
      );
    } catch (e) {
      setState(() {
        errorMsg = e.toString();
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  String _getUserFriendlyError(String raw) {
    if (metodo == 'biseccion') {
      if (raw.contains('ecuacion')) return 'Falta la ecuación para Bisección';
      if (raw.contains('a') || raw.contains('b')) return 'Faltan los parámetros a y b (intervalo inicial)';
      if (raw.contains('tol')) return 'Falta la tolerancia para Bisección';
      if (raw.contains('max_iter')) return 'Faltan las iteraciones máximas para Bisección';
      return 'Datos incompletos para el método de Bisección';
    } else if (metodo == 'newton-raphson') {
      if (raw.contains('ecuacion')) return 'Falta la ecuación para Newton-Raphson';
      if (raw.contains('x0')) return 'Falta el valor inicial x₀ para Newton-Raphson';
      if (raw.contains('tol')) return 'Falta la tolerancia para Newton-Raphson';
      if (raw.contains('max_iter')) return 'Faltan las iteraciones máximas para Newton-Raphson';
      return 'Datos incompletos para el método de Newton-Raphson';
    } else if (metodo == 'secante') {
      if (raw.contains('ecuacion')) return 'Falta la ecuación para Secante';
      if (raw.contains('x0')) return 'Falta el valor x₀ para Secante';
      if (raw.contains('x1')) return 'Falta el valor x₁ para Secante';
      if (raw.contains('tol')) return 'Falta la tolerancia para Secante';
      if (raw.contains('max_iter')) return 'Faltan las iteraciones máximas para Secante';
      return 'Datos incompletos para el método de Secante';
    }
    return 'Datos incompletos o incorrectos';
  }

  String _getErrorExplanation(String raw) {
    if (metodo == 'biseccion') {
      if (raw.contains('ecuacion')) return 'Debes escribir la ecuación que deseas resolver usando Bisección.';
      if (raw.contains('a') || raw.contains('b')) return 'Para Bisección, debes ingresar los valores de a y b que forman el intervalo inicial.';
      if (raw.contains('tol')) return 'Indica la tolerancia (ejemplo: 1e-6) para el criterio de parada en Bisección.';
      if (raw.contains('max_iter')) return 'Indica el número máximo de iteraciones permitidas en Bisección.';
      return 'Verifica que todos los campos requeridos para Bisección estén completos y sean correctos.';
    } else if (metodo == 'newton-raphson') {
      if (raw.contains('ecuacion')) return 'Debes escribir la ecuación que deseas resolver usando Newton-Raphson.';
      if (raw.contains('x0')) return 'Para Newton-Raphson, debes ingresar el valor inicial x₀.';
      if (raw.contains('tol')) return 'Indica la tolerancia (ejemplo: 1e-6) para el criterio de parada en Newton-Raphson.';
      if (raw.contains('max_iter')) return 'Indica el número máximo de iteraciones permitidas en Newton-Raphson.';
      return 'Verifica que todos los campos requeridos para Newton-Raphson estén completos y sean correctos.';
    } else if (metodo == 'secante') {
      if (raw.contains('ecuacion')) return 'Debes escribir la ecuación que deseas resolver usando Secante.';
      if (raw.contains('x0')) return 'Para Secante, debes ingresar el valor inicial x₀.';
      if (raw.contains('x1')) return 'Para Secante, debes ingresar el valor inicial x₁.';
      if (raw.contains('tol')) return 'Indica la tolerancia (ejemplo: 1e-6) para el criterio de parada en Secante.';
      if (raw.contains('max_iter')) return 'Indica el número máximo de iteraciones permitidas en Secante.';
      return 'Verifica que todos los campos requeridos para Secante estén completos y sean correctos.';
    }
    return 'Verifica que todos los campos requeridos estén completos y sean correctos.';
  }

  Widget _buildMetodoDescription() {
    Color accent = Theme.of(context).colorScheme.primary;
    String title = '';
    String desc = '';
    IconData icon = Icons.info_outline_rounded;
    switch (metodo) {
      case 'biseccion':
        title = '¿Qué es el método de Bisección?';
        desc = 'Divide el intervalo [a, b] en dos partes y selecciona la subparte donde cambia el signo de la función. Repite hasta encontrar la raíz con la precisión deseada. Es simple, robusto y siempre converge si la función es continua y cambia de signo.';
        icon = Icons.call_split_rounded;
        break;
      case 'newton-raphson':
        title = '¿Qué es el método de Newton-Raphson?';
        desc = 'Usa la derivada para aproximar la raíz de una función. A partir de un valor inicial x₀, genera una sucesión que converge rápidamente si la función es suave y la estimación inicial es buena.';
        icon = Icons.trending_flat_rounded;
        break;
      case 'secante':
        title = '¿Qué es el método de la Secante?';
        desc = 'Aproxima la raíz usando dos valores iniciales (x₀ y x₁) y una recta secante en vez de la derivada. Es más rápido que Bisección y no requiere conocer la derivada.';
        icon = Icons.show_chart_rounded;
        break;
    }
    return Card(
      color: accent.withOpacity(0.09),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: accent.withOpacity(0.17),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(icon, color: accent, size: 32),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                    style: TextStyle(
                      color: accent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(desc,
                    style: TextStyle(
                      color: accent.withOpacity(0.93),
                      fontSize: 14.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solucionador de Ecuaciones',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Text(
              'Ingresa la ecuación y los parámetros',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            CustomInput(label: 'Ecuación', controller: ecuacionCtrl, hintText: 'Ej: x^3 - x - 2', required: true),
            DropdownButtonFormField<String>(
              value: metodo,
              decoration: const InputDecoration(labelText: 'Método'),
              items: const [
                DropdownMenuItem(value: 'biseccion', child: Text('Bisección')),
                DropdownMenuItem(value: 'newton-raphson', child: Text('Newton-Raphson')),
                DropdownMenuItem(value: 'secante', child: Text('Secante')),
              ],
              onChanged: (value) {
                setState(() {
                  metodo = value ?? 'biseccion';
                });
              },
            ),
            if (metodo == 'biseccion') ...[
              CustomInput(label: 'a', controller: aCtrl, keyboardType: TextInputType.number, required: true),
              CustomInput(label: 'b', controller: bCtrl, keyboardType: TextInputType.number, required: true),
            ],
            if (metodo == 'newton-raphson')
              CustomInput(label: 'x0', controller: x0Ctrl, keyboardType: TextInputType.number, required: true),
            if (metodo == 'secante') ...[
              CustomInput(label: 'x0', controller: x0Ctrl, keyboardType: TextInputType.number, required: true),
              CustomInput(label: 'x1', controller: x1Ctrl, keyboardType: TextInputType.number, required: true),
            ],
            CustomInput(label: 'Tolerancia', controller: tolCtrl, keyboardType: TextInputType.text),
            CustomInput(label: 'Iteraciones máximas', controller: maxIterCtrl, keyboardType: TextInputType.number),
            const SizedBox(height: 24),
            if (errorMsg != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Material(
                  color: Theme.of(context).colorScheme.error.withOpacity(0.09),
                  borderRadius: BorderRadius.circular(10),
                  child: ListTile(
                    leading: Icon(Icons.warning_amber_rounded, color: Theme.of(context).colorScheme.error),
                    title: Text(_getUserFriendlyError(errorMsg!),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )),
                    subtitle: Text(_getErrorExplanation(errorMsg!),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 13,
                        )),
                  ),
                ),
              ),
            PrimaryButton(
              text: loading ? 'Calculando...' : 'Resolver',
              onPressed: _resolver,
              loading: loading,
            ),
            const SizedBox(height: 18),
            _buildMetodoDescription(),
          ],
        ),
      ),
    );
  }
}
