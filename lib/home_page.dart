import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Example App'),
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Text(
                  '${ref.watch(counterProvider)}',
                  textScaleFactor: 5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      ref.watch(counterProvider.notifier).state++;
                    },
                    backgroundColor: Colors.green,
                    child: const Icon(
                      Icons.plus_one,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      ref.watch(counterProvider.notifier).state--;
                    },
                    backgroundColor: Colors.red,
                    child: const Icon(
                      Icons.exposure_minus_1,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      ref.invalidate(counterProvider); // Option 1
                      //ref.watch(counterProvider.notifier).state = 0; // Option 2
                      //ref.refresh(counterProvider); // Option 3
                    },
                    backgroundColor: Colors.grey,
                    child: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
