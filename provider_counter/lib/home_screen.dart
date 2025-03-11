import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:empty/car_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Car List')),
      body: Consumer<CarProvider>(
        builder: (context, carProvider, child) {
          if (carProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (carProvider.error != null) {
            return Center(child: Text('Error: ${carProvider.error}'));
          }
          if (carProvider.cars.isEmpty) {
            return const Center(child: Text('No cars found'));
          }

          return ListView.builder(
            itemCount: carProvider.cars.length,
            itemBuilder: (context, index) {
              final car = carProvider.cars[index];
              return ListTile(
                title: Text('${car.make} ${car.model}'),
                subtitle: Text('Year: ${car.year} - Type: ${car.type}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Crida a `fetchCars()` quan premem el botó
          context.read<CarProvider>().fetchCars();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
