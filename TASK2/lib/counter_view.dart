import 'package:flutter/material.dart';
import 'counter_controller.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});
  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  final CounterController _controller = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TASK 2: History Logger Counter"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Bagian Counter
            const Text("Total Hitungan:", style: TextStyle(fontSize: 20)),
            Text(
              '${_controller.value}',
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 20),
            const Text("Atur Step:"),
            Slider(
              value: _controller.currentStep,
              min: 1,
              max: 10,
              divisions: 9,
              label: _controller.currentStep.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _controller.setCurrentStep(value);
                });
              },
            ),
            Text(
              'Step saat ini: ${_controller.step}',
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            // Tombol kontrol
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tombol Decrement
                ElevatedButton.icon(
                  onPressed: () => setState(() => _controller.decrement()),
                  icon: const Icon(Icons.remove),
                  label: const Text('Kurang'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                // Tombol Reset
                ElevatedButton.icon(
                  onPressed: () => setState(() => _controller.reset()),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                // Tombol Increment
                ElevatedButton.icon(
                  onPressed: () => setState(() => _controller.increment()),
                  icon: const Icon(Icons.add),
                  label: const Text('Tambah'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
            const Divider(thickness: 2),

            // Bagian Riwayat
            const Text(
              "Riwayat Aktivitas (5 Terakhir):",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Tampilkan riwayat menggunakan Expanded dan ListView
            Expanded(
              child: _controller.history.isEmpty
                  ? const Center(
                      child: Text(
                        'Belum ada aktivitas',
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _controller.history.length,
                      itemBuilder: (context, index) {
                        // Tampilkan dari yang terbaru (index terbalik)
                        final reversedIndex =
                            _controller.history.length - 1 - index;
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          elevation: 2,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.deepPurple,
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text(
                              _controller.history[reversedIndex],
                              style: const TextStyle(fontSize: 14),
                            ),
                            trailing: const Icon(
                              Icons.history,
                              color: Colors.deepPurple,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
