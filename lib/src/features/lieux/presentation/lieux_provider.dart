import 'package:borrowbetter/src/features/lieux/data/source_lieux.dart';
import 'package:borrowbetter/src/features/lieux/domain/lieux.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lieuxProvider = FutureProvider<List<Gouvernorat>>(
  (ref) => chargerLieux(),
);
