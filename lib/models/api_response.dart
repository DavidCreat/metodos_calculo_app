class ApiResponse {
  final Map<String, dynamic> resumen;
  final List<dynamic> valoresIntermedios;
  final List<dynamic> erroresAbsolutos;
  final List<dynamic> erroresRelativos;
  final List<dynamic> detalleIteraciones;
  final String? compararMetodosResult;
  final List<dynamic> graficasGeneradas;

  ApiResponse({
    required this.resumen,
    required this.valoresIntermedios,
    required this.erroresAbsolutos,
    required this.erroresRelativos,
    required this.detalleIteraciones,
    this.compararMetodosResult,
    required this.graficasGeneradas,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      resumen: json['resumen'],
      valoresIntermedios: json['valores_intermedios'],
      erroresAbsolutos: json['errores_absolutos'],
      erroresRelativos: json['errores_relativos'],
      detalleIteraciones: json['detalle_iteraciones'],
      compararMetodosResult: json['comparar_metodos_result'],
      graficasGeneradas: json['graficas_generadas'] ?? [],
    );
  }
}
