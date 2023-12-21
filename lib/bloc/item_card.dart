import 'package:bloc/bloc.dart';

class ItemCard extends Cubit<int> {
  ItemCard({this.total = 1}) : super(total);

  var total = 1;

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}
