# solucionador_flutter

# Solucionador de Ecuaciones

![App Screenshot](assets/screenshots/app_screenshot.png)

El Solucionador de Ecuaciones es una aplicación Flutter moderna y accesible diseñada para resolver ecuaciones matemáticas utilizando diferentes métodos numéricos. La aplicación proporciona una interfaz intuitiva y profesional para resolver ecuaciones usando los métodos de Bisección, Newton-Raphson y Secante.

## Características Principales

### 📈 Métodos Numéricos Implementados

#### Método de Bisección
- Algoritmo iterativo que divide el intervalo por la mitad
- Requiere un intervalo inicial [a, b] donde f(a) * f(b) < 0
- Garantiza convergencia si la función es continua
- Ideal para funciones con cambio de signo
- Parámetros:
  - Intervalo inicial: a y b
  - Tolerancia (ε): Precisión deseada
  - Máximo de iteraciones: Límite de iteraciones

#### Método de Newton-Raphson
- Método de convergencia cuadrática
- Utiliza la derivada de la función
- Requiere un punto inicial x₀ cercano a la raíz
- Muy eficiente cuando se tiene un punto inicial bueno
- Parámetros:
  - Punto inicial: x₀
  - Tolerancia (ε): Precisión deseada
  - Máximo de iteraciones: Límite de iteraciones

#### Método de la Secante
- Alternativa al método de Newton-Raphson
- No requiere derivadas explícitas
- Utiliza dos puntos iniciales para aproximar la derivada
- Convergencia superlineal
- Parámetros:
  - Dos puntos iniciales: x₀ y x₁
  - Tolerancia (ε): Precisión deseada
  - Máximo de iteraciones: Límite de iteraciones

### 🎨 Interfaz de Usuario Moderna

#### Diseño y Tipografía
- Interfaz limpia y minimalista
- Uso de Google Fonts para una mejor legibilidad
- Tipografía profesional que facilita la lectura de fórmulas matemáticas
- Diseño responsive que se adapta a diferentes tamaños de pantalla

#### Soporte para Visión Croma
- **Protanopia**: Esquema de colores optimizado para personas con deficiencia en la visión del rojo
- **Deuteranopia**: Paleta de colores diseñada para personas con deficiencia en la visión del verde
- **Tritanopia**: Colores especialmente seleccionados para personas con deficiencia en la visión del azul
- **Normal**: Esquema de colores estándar para usuarios sin deficiencias de visión

#### Accesibilidad
- Contraste optimizado para mejor legibilidad
- Tamaños de texto ajustables
- Botones y controles con feedback visual
- Soporte para lectores de pantalla
- Navegación intuitiva y consistente
- Interfaz intuitiva y fácil de usar
- Soporte para múltiples plataformas (iOS, Android, Web, Desktop)

### 📊 Visualización de Resultados

#### Tabla de Iteraciones
- Muestra paso a paso el proceso de cálculo
- Columnas:
  - Número de iteración
  - Valor de aproximación
  - Error absoluto
  - Error relativo
  - Valor de la función

#### Gráficas Generadas
- Gráfica de la función original
- Puntos de aproximación en cada iteración
- Líneas de tendencia
- Zoom interactivo
- Exportación de gráficas

#### Resumen de Resultados
- Raíz encontrada
- Número de iteraciones realizadas
- Error final
- Tiempo de ejecución
- Convergencia alcanzada

#### Comparación de Métodos
- Tabla comparativa de rendimiento
- Gráfica de convergencia comparativa
- Análisis de eficiencia
- Recomendaciones basadas en el caso de uso

### 🛠️ Características Técnicas

#### Arquitectura
- Patrón de diseño limpio y modular
- Separación clara de responsabilidades
- Código reutilizable y mantenible
- Pruebas unitarias integradas
- Documentación técnica completa

#### Integración Backend
- API RESTful para cálculos numéricos
- Manejo asíncrono de operaciones
- Caché de resultados
- Logging detallado
- Seguridad en las comunicaciones

#### Manejo de Errores
- Validación de entrada robusta
- Manejo de casos especiales
- Mensajes de error descriptivos
- Sistema de logging
- Recuperación de errores

#### Soporte Matemático
- Parser de expresiones matemáticas
- Soporte para funciones complejas
- Gestión de precisión numérica
- Manejo de números complejos
- Optimización de cálculos

#### Optimización
- Carga adaptativa para diferentes dispositivos
- Cache de resultados
- Optimización de memoria
- Rendimiento optimizado
- Carga asíncrona de recursos

## Requisitos del Sistema

### Software
- Flutter SDK ^3.7.2
- Dart SDK ^3.7.2
- IDE compatible con Flutter (VSCode, Android Studio, IntelliJ)
- Git para control de versiones
- Python 3.8+ para el backend (opcional)

### Hardware
- Dispositivo con al menos 4GB de RAM
- Procesador moderno
- Conexión a internet para la primera instalación
- Espacio en disco para el SDK y dependencias

### Dependencias Principales
- `flutter` (SDK)
- `google_fonts` ^6.1.0
- `http` ^1.2.1
- `cupertino_icons` ^1.0.8
- `flutter_lints` ^5.0.0

## Instalación

### 1. Configuración del Entorno
```bash
# Instalar Flutter SDK
flutter doctor

# Verificar instalación
flutter --version
```

### 2. Clonar Repositorio
```bash
git clone https://github.com/DavidCreat/metodos_calculo_app.git
cd solucionador_flutter
```

### 3. Instalar Dependencias
```bash
flutter pub get
```

### 4. Configurar Backend (opcional)
```bash
# Navegar al directorio del backend
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements.txt
python app.py
```

### 5. Ejecutar la Aplicación
```bash
# Para Android
flutter run -d android

# Para iOS
flutter run -d ios

# Para Web
flutter run -d chrome

# Para Desktop
flutter run -d windows  # o macos/linux según el sistema
```

## Uso Detallado

### 1. Configuración Inicial
- Al iniciar la aplicación, se mostrará la pantalla de onboarding
- Selecciona tu modo de visión preferido:
  - Normal: Esquema de colores estándar
  - Protanopia: Optimizado para deficiencia en la visión del rojo
  - Deuteranopia: Optimizado para deficiencia en la visión del verde
  - Tritanopia: Optimizado para deficiencia en la visión del azul

### 2. Ingresar la Ecuación
- Usa la sintaxis matemática estándar
- Soporta funciones trigonométricas (sin, cos, tan)
- Soporta funciones exponenciales y logarítmicas
- Usa 'x' como variable independiente
- Ejemplo: 'x^2 - 3*x + 2'

### 3. Seleccionar Método Numérico
- **Bisección**: 
  - Requiere intervalo [a, b]
  - La función debe cambiar de signo en el intervalo
  - Garantiza convergencia

- **Newton-Raphson**:
  - Requiere punto inicial x₀
  - Necesita derivada de la función
  - Convergencia rápida si x₀ está cerca de la raíz

- **Secante**:
  - Requiere dos puntos iniciales x₀ y x₁
  - No necesita derivada explícita
  - Buena alternativa cuando la derivada es compleja

### 4. Configurar Parámetros
- **Tolerancia (ε)**: 
  - Precisión deseada del resultado
  - Valor por defecto: 1e-6
  - Afecta el tiempo de ejecución

- **Máximo de Iteraciones**:
  - Límite para evitar bucles infinitos
  - Valor por defecto: 100
  - Puede ajustarse según necesidad

### 5. Ejecutar y Analizar Resultados
- Presiona "Resolver" para iniciar el cálculo
- La aplicación mostrará:
  - Tabla de iteraciones paso a paso
  - Gráfica de la función y aproximaciones
  - Resumen de resultados con errores
  - Tiempo de ejecución
  - Comparación con otros métodos (si aplica)

## Soporte para Visión Croma

### Modos de Visión Disponibles

#### Protanopia
- Optimizado para personas con deficiencia en la visión del rojo
- Esquema de colores:
  - Primario: Azul profundo (#0072B2)
  - Secundario: Amarillo brillante (#F0E442)
  - Fondo: Gris claro (#F5F7FA)

#### Deuteranopia
- Optimizado para personas con deficiencia en la visión del verde
- Esquema de colores:
  - Primario: Verde oscuro (#009E73)
  - Secundario: Naranja fuerte (#D55E00)
  - Fondo: Gris claro (#F5F7FA)

#### Tritanopia
- Optimizado para personas con deficiencia en la visión del azul
- Esquema de colores:
  - Primario: Rosa pálido (#CC79A7)
  - Secundario: Azul profundo (#0072B2)
  - Fondo: Gris claro (#F5F7FA)

#### Normal
- Esquema de colores estándar
- Ideal para usuarios sin deficiencias de visión
- Balance entre estética y legibilidad

### Características de Accesibilidad
- Contraste optimizado para mejor legibilidad
- Tamaños de texto ajustables
- Botones y controles con feedback visual
- Soporte para lectores de pantalla
- Navegación intuitiva y consistente
- Paleta de colores validada para WCAG 2.1

## Contribución

¡Las contribuciones son bienvenidas! Si deseas contribuir, por favor:

1. Crea una rama para tu característica (`git checkout -b feature/AmazingFeature`)
2. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
3. Push a la rama (`git push origin feature/AmazingFeature`)
4. Abre un Pull Request

## Licencia

Este proyecto está bajo la Licencia MIT - consulta el archivo LICENSE para más detalles.

## Contacto

- Email: david.fonseca12p@gmail.com
- GitHub: [DavidCreat](https://github.com/DavidCreat)

## Agradecimientos

- A todos los contribuidores que han ayudado a mejorar este proyecto
- A la comunidad Flutter por su excelente documentación y herramientas
- A los usuarios que han proporcionado feedback valioso
