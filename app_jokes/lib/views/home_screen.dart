import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/joke_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Joke')),
      body: Center(
        child: Consumer<JokeController>(
          builder: (context, controller, _) {
            if (controller.isLoading) {
              return const CircularProgressIndicator();
            }

            if (controller.error != null) {
              return Text(
                'Error: ${controller.error}',
                style: const TextStyle(color: Colors.red),
              );
            }

            if (controller.joke != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.joke!.setup,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    controller.joke!.punchline,
                    style: const TextStyle(
                        fontSize: 18, fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }

            return const Text(
              'Prem el botó per obtenir un acudit!',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<JokeController>().loadJoke();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
