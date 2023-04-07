library core;

import 'package:get_it/get_it.dart';

export 'package:equatable/equatable.dart';
export 'package:dartz/dartz.dart' show Either, Right, Left;
export 'package:get_it/get_it.dart';
export 'package:formz/formz.dart';

export 'package:auto_route/auto_route.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'src/failure.dart';
export 'src/usecase.dart';
export 'src/entities/account_type.dart';

// screens
export 'src/screens/not_found_404.dart';

final locator = GetIt.instance;
