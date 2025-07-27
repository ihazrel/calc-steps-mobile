import 'package:calc_steps_mobile/util/CommonClass.dart';

final List<CalculatorModel> calculatorModels = [
  CalculatorModel(
    id: 1,
    name: "CS-570X",
    description: "A scientific calculator inspired by the Casio FX-570EX.",
  ),
  CalculatorModel(
    id: 2,
    name: "CS-570M",
    description: "A scientific calculator inspired by the Casio FX-570MS.",
  ),
  /*CalculatorModel(
    id: 3,
    name: "CS-570E",
    description: "A scientific calculator inspired by the Casio FX-570ES.",
  ),*/
];

final List<Operation> operations = [
  Operation(
    id: 1,
    name: "Factorization",
    description: "Factorizes a polynomial expression.",
  ),
  Operation(
    id: 2,
    name: "Roots",
    description: "Finds the roots of a polynomial expression.",
  ),
  Operation(
    id: 3,
    name: "Exponentiation",
    description: "Raises a number to the power of another.",
  ),
];

final List<TutorialStep> tutorialSteps = [
  // 570X Factorization Tutorial Steps
  TutorialStep(
    id: 1,
    stepText: "Press the SETUP button.",
    stepImage: "../../image/ex/factorize/1.png",
    stepOrder: 1,
    calculatorModelId: 1,
    operationId: 1,
  ),
  TutorialStep(
    id: 2,
    stepText: "Press the (-) button to select Equation.",
    stepImage: "../../image/ex/factorize/2.png",
    stepOrder: 2,
    calculatorModelId: 1,
    operationId: 1,
  ),
  TutorialStep(
    id: 3,
    stepText: "Press 2 to choose a Polynomial equation.",
    stepImage: "../../image/ex/factorize/3.png",
    stepOrder: 3,
    calculatorModelId: 1,
    operationId: 1,
  ),
  TutorialStep(
    id: 4,
    stepText:
        "Choose the highest power (degree) of your equation (e.g., 2 for quadratic).",
    stepImage: "../../image/ex/factorize/4.png",
    stepOrder: 4,
    calculatorModelId: 1,
    operationId: 1,
  ),
  TutorialStep(
    id: 5,
    stepText: "Input the values for a, b, and c.",
    stepImage: "../../image/ex/factorize/5.png",
    stepOrder: 5,
    calculatorModelId: 1,
    operationId: 1,
  ),
  TutorialStep(
    id: 6,
    stepText: "Press = to view the solutions for x1 and x2.",
    stepImage: "../../image/ex/factorize/6.png",
    stepOrder: 6,
    calculatorModelId: 1,
    operationId: 1,
  ),

  // 570X Roots Tutorial Steps
  TutorialStep(
    id: 7,
    stepText: "Enter a number for root value.",
    stepImage: "../../image/ex/root/1.png",
    stepOrder: 1,
    calculatorModelId: 1,
    operationId: 2,
  ),
  TutorialStep(
    id: 8,
    stepText: "Press SHIFT and 'ϰ' button.",
    stepImage: "../../image/ex/root/2.png",
    stepOrder: 2,
    calculatorModelId: 1,
    operationId: 2,
  ),
  TutorialStep(
    id: 9,
    stepText: "Enter the number you desired.",
    stepImage: "../../image/ex/root/3.png",
    stepOrder: 3,
    calculatorModelId: 1,
    operationId: 2,
  ),
  TutorialStep(
    id: 10,
    stepText: "Press '=' button for the value.",
    stepImage: "../../image/ex/root/4.png",
    stepOrder: 4,
    calculatorModelId: 1,
    operationId: 2,
  ),

  // 570X Exponentiation Tutorial Steps
  TutorialStep(
    id: 11,
    stepText: "Enter a number for base 2.",
    stepImage: "../../image/ex/exponentiation/1.png",
    stepOrder: 1,
    calculatorModelId: 1,
    operationId: 3,
  ),
  TutorialStep(
    id: 12,
    stepText: "Press 'ϰ' button.",
    stepImage: "../../image/ex/exponentiation/2.png",
    stepOrder: 2,
    calculatorModelId: 1,
    operationId: 3,
  ),
  TutorialStep(
    id: 13,
    stepText: "Enter the number for power.",
    stepImage: "../../image/ex/exponentiation/3.png",
    stepOrder: 3,
    calculatorModelId: 1,
    operationId: 3,
  ),
  TutorialStep(
    id: 14,
    stepText: "Press '=' button for the value.",
    stepImage: "../../image/ex/exponentiation/4.png",
    stepOrder: 4,
    calculatorModelId: 1,
    operationId: 3,
  ),

  // 570M Factorization Tutorial Steps
  TutorialStep(
    id: 15,
    stepText: "Press MODE button 3 times",
    stepImage: "../../image/ms/factorize/1.png",
    stepOrder: 1,
    calculatorModelId: 2,
    operationId: 1,
  ),
  TutorialStep(
    id: 16,
    stepText: "Press '1' for EQN",
    stepImage: "../../image/ms/factorize/2.png",
    stepOrder: 2,
    calculatorModelId: 2,
    operationId: 1,
  ),
  TutorialStep(
    id: 17,
    stepText: "Press RIGHT button to next page",
    stepImage: "../../image/ms/factorize/3.png",
    stepOrder: 3,
    calculatorModelId: 2,
    operationId: 1,
  ),
  TutorialStep(
    id: 18,
    stepText: "Press the highest power of equation",
    stepImage: "../../image/ms/factorize/4.png",
    stepOrder: 4,
    calculatorModelId: 2,
    operationId: 1,
  ),
  TutorialStep(
    id: 19,
    stepText: "Enter value for a, b, and c",
    stepImage: "../../image/ms/factorize/5.png",
    stepOrder: 5,
    calculatorModelId: 2,
    operationId: 1,
  ),
  TutorialStep(
    id: 20,
    stepText: "Press '=' button for 1st and 2nd value",
    stepImage: "../../image/ms/factorize/6.png",
    stepOrder: 6,
    calculatorModelId: 2,
    operationId: 1,
  ),

  // 570M Roots Tutorial Steps
  TutorialStep(
    id: 21,
    stepText: "Enter a number for root value",
    stepImage: "../../image/ms/root/1.png",
    stepOrder: 1,
    calculatorModelId: 2,
    operationId: 2,
  ),
  TutorialStep(
    id: 22,
    stepText: "Press SHIFT and '∧' button",
    stepImage: "../../image/ms/root/2.png",
    stepOrder: 2,
    calculatorModelId: 2,
    operationId: 2,
  ),
  TutorialStep(
    id: 23,
    stepText: "Enter the number you desired",
    stepImage: "../../image/ms/root/3.png",
    stepOrder: 3,
    calculatorModelId: 2,
    operationId: 2,
  ),
  TutorialStep(
    id: 24,
    stepText: "Press '=' button for the value",
    stepImage: "../../image/ms/root/4.png",
    stepOrder: 4,
    calculatorModelId: 2,
    operationId: 2,
  ),

  // 570M Exponentiation Tutorial Steps
  TutorialStep(
    id: 25,
    stepText: "Enter a number for base",
    stepImage: "../../image/ms/exponentiation/1.png",
    stepOrder: 1,
    calculatorModelId: 2,
    operationId: 3,
  ),
  TutorialStep(
    id: 26,
    stepText: "Press '∧' button",
    stepImage: "../../image/ms/exponentiation/2.png",
    stepOrder: 2,
    calculatorModelId: 2,
    operationId: 3,
  ),
  TutorialStep(
    id: 27,
    stepText: "Enter the number for power",
    stepImage: "../../image/ms/exponentiation/3.png",
    stepOrder: 3,
    calculatorModelId: 2,
    operationId: 3,
  ),
  TutorialStep(
    id: 28,
    stepText: "Press '=' button for the value",
    stepImage: "../../image/ms/exponentiation/4.png",
    stepOrder: 4,
    calculatorModelId: 2,
    operationId: 3,
  ),
];
