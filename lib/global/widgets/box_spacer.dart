import 'package:flutter/material.dart';

import '../units.dart';

class DSBoxSpacer extends SizedBox {
  const DSBoxSpacer({super.key}) : super.square(dimension: DSUnits.medium);

  const DSBoxSpacer.xxSmall({super.key})
      : super.square(dimension: DSUnits.xxSmall);

  const DSBoxSpacer.xSmall({super.key})
      : super.square(dimension: DSUnits.xSmall);

  const DSBoxSpacer.small({super.key})
      : super.square(dimension: DSUnits.small);

  const DSBoxSpacer.large({super.key})
      : super.square(dimension: DSUnits.large);

}
