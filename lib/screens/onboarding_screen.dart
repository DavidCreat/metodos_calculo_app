import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import '../theme/colorblind_themes.dart';

class OnboardingScreen extends StatefulWidget {
  final void Function(ColorBlindMode) onFinish;
  const OnboardingScreen({super.key, required this.onFinish});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

enum ColorBlindMode { normal, protanopia, deuteranopia, tritanopia }

const colorBlindDescriptions = {
  ColorBlindMode.normal: 'Colores estándar. Para personas sin daltonismo.',
  ColorBlindMode.protanopia: 'Protanopía: dificultad para distinguir el rojo. Esquema optimizado.',
  ColorBlindMode.deuteranopia: 'Deuteranopía: dificultad para distinguir el verde. Esquema optimizado.',
  ColorBlindMode.tritanopia: 'Tritanopía: dificultad para distinguir azul/amarillo. Esquema optimizado.'
};

class _OnboardingScreenState extends State<OnboardingScreen> {
  ColorBlindMode? selectedMode;

  Widget _buildPreview(ColorBlindMode mode) {
    final theme = ColorBlindThemes.getTheme(mode);
    return Container(
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: selectedMode == mode ? theme.colorScheme.primary : Colors.grey.shade300,
          width: selectedMode == mode ? 2.5 : 1.0,
        ),
        boxShadow: [
          if (selectedMode == mode)
            BoxShadow(color: theme.colorScheme.primary.withOpacity(0.15), blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: theme.colorScheme.primary,
                radius: 14,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  _modeName(mode),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(colorBlindDescriptions[mode]!, style: const TextStyle(fontSize: 13)),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Botón principal'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: theme.colorScheme.primary,
                    side: BorderSide(color: theme.colorScheme.primary),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Secundario'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  String _modeName(ColorBlindMode mode) {
    switch (mode) {
      case ColorBlindMode.normal:
        return 'Normal';
      case ColorBlindMode.protanopia:
        return 'Protanopía';
      case ColorBlindMode.deuteranopia:
        return 'Deuteranopía';
      case ColorBlindMode.tritanopia:
        return 'Tritanopía';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bienvenido a Solucionador de Ecuaciones',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.info_outline_rounded),
                tooltip: '¿Qué es el daltonismo?',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Accesibilidad para Daltonismo'),
                      content: const Text(
                        'El daltonismo afecta la percepción de colores. Esta app permite elegir un esquema de colores optimizado para distintos tipos de daltonismo, mejorando la experiencia visual y la accesibilidad para todos.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cerrar'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Selecciona el modo de color que mejor se adapte a tu visión. Puedes cambiarlo después en ajustes.',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ...ColorBlindMode.values.map((mode) => GestureDetector(
                    onTap: () => setState(() => selectedMode = mode),
                    child: _buildPreview(mode),
                  )),
              const SizedBox(height: 28),
              PrimaryButton(
                text: 'Continuar',
                onPressed: selectedMode != null
                    ? () => widget.onFinish(selectedMode!)
                    : () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
