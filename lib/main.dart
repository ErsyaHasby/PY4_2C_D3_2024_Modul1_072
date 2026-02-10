import 'package:flutter/material.dart';
import 'counter_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Step Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterView(),
    );
  }
}

/// CounterView - Handles UI presentation
/// Following Single Responsibility Principle (SRP)
class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  // Create instance of CounterController
  final CounterController _controller = CounterController();

  void _incrementCounter() {
    setState(() {
      _controller.increment();
    });
  }

  void _decrementCounter() {
    setState(() {
      _controller.decrement();
    });
  }

  void _updateStep(double value) {
    setState(() {
      _controller.setStep(value.toInt());
    });
  }

  void _resetCounter() {
    setState(() {
      _controller.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Multi-Step Counter'),
        actions: [
          IconButton(
            onPressed: _resetCounter,
            icon: const Icon(Icons.refresh),
            tooltip: 'Reset',
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Counter Display
                const Text('Counter Value:', style: TextStyle(fontSize: 20)),
                const SizedBox(height: 16),
                Text(
                  '${_controller.counter}',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 48),

                // Increment and Decrement Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: _decrementCounter,
                      heroTag: 'decrement',
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(width: 24),
                    FloatingActionButton(
                      onPressed: _incrementCounter,
                      heroTag: 'increment',
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),

                const SizedBox(height: 48),
                const Divider(),
                const SizedBox(height: 24),

                // Step Control Section
                const Text(
                  'Step Value:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Text(
                  '${_controller.step}',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
                const SizedBox(height: 16),

                // Slider for Step Control
                Slider(
                  value: _controller.step.toDouble(),
                  min: 1,
                  max: 20,
                  divisions: 19,
                  label: '${_controller.step}',
                  onChanged: _updateStep,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('1'), Text('20')],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Adjust the slider to change step value',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
