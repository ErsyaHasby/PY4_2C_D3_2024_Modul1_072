/// CounterController - Handles business logic for the counter
/// Following Single Responsibility Principle (SRP)
class CounterController {
  int _counter = 0;
  int _step = 1;

  /// Get current counter value
  int get counter => _counter;

  /// Get current step value
  int get step => _step;

  /// Increment counter by step value
  void increment() {
    _counter += _step;
  }

  /// Decrement counter by step value
  void decrement() {
    _counter -= _step;
  }

  /// Set the step value
  void setStep(int newStep) {
    if (newStep > 0) {
      _step = newStep;
    }
  }

  /// Reset counter to zero
  void reset() {
    _counter = 0;
  }
}
