
import 'package:flutter/material.dart';
import 'package:mobile_app_theraphy/ui/therapy/body-selector/src/body_part_selector.dart';
import 'package:mobile_app_theraphy/ui/therapy/body-selector/src/model/body_parts.dart';
import 'package:mobile_app_theraphy/ui/therapy/body-selector/src/model/body_side.dart';
import 'package:rotation_stage/rotation_stage.dart';

export 'package:rotation_stage/rotation_stage.dart';
class BodyPartSelectorTurnable extends StatelessWidget {
  const BodyPartSelectorTurnable({
    super.key,
    required this.bodyParts,
    this.onSelectionUpdated,
    this.mirrored = false,
    this.padding = EdgeInsets.zero,
    this.labelData,
  });

  final BodyParts bodyParts;
  final Function(BodyParts)? onSelectionUpdated;
  final bool mirrored;
  final EdgeInsets padding;
  final RotationStageLabelData? labelData;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 600.0,  // Puedes ajustar este valor según tus necesidades
      ),
      child: RotationStage(
        contentBuilder: (index, side, page) => Padding(
          padding: padding,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BodyPartSelector(
              side: side.map(
                front: BodySide.front,
                left: BodySide.left,
                back: BodySide.back,
                right: BodySide.right,
              ),
              bodyParts: bodyParts,
              onSelectionUpdated: onSelectionUpdated,
              mirrored: mirrored,
            ),
          ),
        ),
        labels: labelData,
      ),
    );
  }
}