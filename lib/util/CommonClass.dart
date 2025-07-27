class CalculatorModel {
  final int id;
  final String name;
  final String description;

  CalculatorModel({
    required this.id,
    required this.name,
    required this.description,
  });
}

class Operation {
  final int id;
  final String name;
  final String description;

  Operation({
    required this.id,
    required this.name,
    required this.description,
  });
}

class TutorialStep {
  final int id;
  final String stepText;
  final String stepImage; // Can be path or asset name
  final int stepOrder;
  final int calculatorModelId; // FK to CalculatorModel
  final int operationId; // FK to Operation

  TutorialStep({
    required this.id,
    required this.stepText,
    required this.stepImage,
    required this.stepOrder,
    required this.calculatorModelId,
    required this.operationId,
  });
}
