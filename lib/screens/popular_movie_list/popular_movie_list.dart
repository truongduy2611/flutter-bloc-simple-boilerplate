import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple_boilerplate/common/widgets/widgets.dart';
import 'package:flutter_bloc_simple_boilerplate/models/movie.dart';
import 'package:flutter_bloc_simple_boilerplate/repositories/movie/movie_repository.dart';
import 'package:flutter_bloc_simple_boilerplate/screens/popular_movie_list/bloc/popular_movie_bloc.dart';
import 'package:flutter_bloc_simple_boilerplate/utils/ui_helpers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'popular_movie_list_container.dart';
part 'popular_movie_list_page.dart';
part 'widgets/movie_card.dart';
