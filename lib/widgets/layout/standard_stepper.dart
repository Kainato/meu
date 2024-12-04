import 'package:flutter/material.dart';
import 'package:myapp/core/theme_colors.dart';

class StandardStepper extends StatelessWidget {
  /// Índice do passo atual.
  final int currentStep;

  /// Física do `Stepper`. Determina como o `Stepper` responde a rolagem da tela
  /// ao usuário interagindo com ele.
  final ScrollPhysics physics;

  /// Passos do `Stepper`.
  final List<Step> steps;

  /// `StandardStepper` é um widget que exibe um `Stepper` com um estilo padrão.
  ///
  /// ### Alertas!
  /// O `Stepper` não possui botões de navegação padrão, então é necessário
  /// passar as funções `onStepCancel` e `onStepContinue` para controlar a
  /// navegação entre os passos.
  ///
  /// ### Parâmetros:
  /// - `currentStep` é o índice do passo atual.
  /// - `physics` é a física do `Stepper`.
  /// - `steps` são os passos do `Stepper`.
  const StandardStepper({
    super.key,
    required this.currentStep,
    this.physics = const ClampingScrollPhysics(),
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Stepper(
      elevation: 8,
      connectorThickness: 2,
      type: StepperType.horizontal,
      margin: const EdgeInsets.all(0),
      physics: physics,
      currentStep: currentStep,
      steps: _customStep(context, currentStep: currentStep, steps: steps),
      controlsBuilder: (BuildContext context, ControlsDetails details) =>
          const SizedBox.shrink(),
    );
  }
}

List<Step> _customStep(
  BuildContext context, {
  required int currentStep,
  required List<Step> steps,
}) {
  return steps
      .map(
        (step) => Step(
          title: step.title,
          subtitle: Text('Passo 0${steps.indexOf(step) + 1}'),
          state: currentStep > steps.indexOf(step)
              ? StepState.complete
              : currentStep == steps.indexOf(step)
                  ? StepState.editing
                  : StepState.indexed,
          isActive: currentStep == steps.indexOf(step),
          stepStyle: StepStyle(
            color: currentStep > steps.indexOf(step)
                ? ThemeColors.primary
                : currentStep == steps.indexOf(step)
                    ? ThemeColors.secondary
                    : ThemeColors.primaryContainer,
          ),
          content: step.content,
        ),
      )
      .toList();
}
