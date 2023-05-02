import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class DateFilterChanged implements HomeEvent {
  final int index;
  DateFilterChanged({required this.index});

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();
}

