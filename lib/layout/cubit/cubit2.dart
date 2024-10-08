import 'package:akhbarna/layout/cubit/states2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/network/local/cache_helper.dart';

class DarkCubit extends Cubit<DarkStates> {
  DarkCubit() : super(InitialDarkState());

  static DarkCubit get(context) => BlocProvider.of(context);

  bool isDark = true;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeAppMode());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(ChangeAppMode());
      });
    }
  }
}
