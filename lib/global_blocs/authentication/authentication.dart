import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_simple_boilerplate/models/user.dart';
import 'package:flutter_bloc_simple_boilerplate/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:jwt_decode/jwt_decode.dart';

part 'authentication_bloc.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';
