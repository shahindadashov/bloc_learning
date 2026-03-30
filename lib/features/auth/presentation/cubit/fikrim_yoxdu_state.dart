part of 'fikrim_yoxdu_cubit.dart';

@immutable
sealed class FikrimYoxduState {}

final class FikrimYoxduInitial extends FikrimYoxduState {}

final class BiometricsChecking extends FikrimYoxduState {}

final class BiometricsSuccess extends FikrimYoxduState {}

final class BiometricsFailed extends FikrimYoxduState {}
