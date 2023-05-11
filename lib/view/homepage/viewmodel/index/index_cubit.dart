import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class IndexCubit extends Cubit<int> {
  IndexCubit() : super(0);

  setIndex(int index) => emit(index);
}
