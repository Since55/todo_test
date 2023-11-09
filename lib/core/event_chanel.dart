import 'dart:async';

final eventChannel = EventChannel()..on().listen(print);

class EventChannel {
  final StreamController _streamController;

  EventChannel({bool sync = false})
      : _streamController = StreamController.broadcast(sync: sync);

  EventChannel.customController(StreamController controller)
      : _streamController = controller;

  FutureOr<dynamic> fire<T extends Event>(T event) {
    _streamController.add(event);
    return event is AsyncEvent ? event.resolver.future : null;
  }

  Stream<T> on<T>() {
    if (T == dynamic) {
      return _streamController.stream as Stream<T>;
    } else {
      return _streamController.stream.where((event) => event is T).cast<T>();
    }
  }

  void destroy() {
    _streamController.close();
  }
}

abstract class Event {}

class AsyncEvent extends Event {
  final resolver = Completer();
  
  void resolve<T>([T? effect]) {
    if (resolver.isCompleted) return;
    resolver.complete(effect);
  }
}