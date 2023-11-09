import 'package:todo_drf/core/event_chanel.dart';
import 'package:todo_drf/events/events.dart';

final counterService = CounterService();

class CounterService {
  int? count;

  CounterService() {
    eventChannel.on<UpdatedTodoListEvent>().listen(_onTodoUpdated);
  }

  void _onTodoUpdated(UpdatedTodoListEvent event) {
    count = event.items.length;
  }
}
