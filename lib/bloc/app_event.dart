part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class InitiatePaymentEvent extends AppEvent{}
class InitiateUpi extends AppEvent{}
class VerifyUpiPin extends AppEvent{}
class FloatingButtonPressed extends AppEvent{}
class PTP extends AppEvent{}
