import 'package:flutter/material.dart';

enum NavigationDestinationWithArgsExampleScreenType {
  profile,
  purchase,
  unknown;
}

sealed class NavigationDestinationWithArgsExampleScreenArgs {
  final int id;
  const NavigationDestinationWithArgsExampleScreenArgs(this.id);
}

class ProfileNavigationDestinationWithArgsExampleScreenArgs extends NavigationDestinationWithArgsExampleScreenArgs {
  final String name;
  final String hobbies;
  const ProfileNavigationDestinationWithArgsExampleScreenArgs(
    super.id, {
    required this.name,
    required this.hobbies,
  });

  @override
  String toString() => "Profile{id: ${super.id}, name: $name, hobbies: $hobbies}";
}

class PurchaseNavigationDestinationWithArgsExampleScreenArgs extends NavigationDestinationWithArgsExampleScreenArgs {
  final String productId;
  final String notes;
  const PurchaseNavigationDestinationWithArgsExampleScreenArgs(
    super.id, {
    required this.productId,
    required this.notes,
  });

  @override
  String toString() => "Purchase{id: ${super.id}, productId: $productId, hobbies: $notes}";
}

class UnknownNavigationDestinationWithArgsExampleScreenArgs extends NavigationDestinationWithArgsExampleScreenArgs {
  final Map<String, String> queryParams;
  const UnknownNavigationDestinationWithArgsExampleScreenArgs(super.id, {required this.queryParams});
  @override
  String toString() => "Unknown{id: ${super.id}, queryParams: $queryParams }";
}

/*

* route/:id ==> route/42

*/
// https://canopas.com/how-to-implement-type-safe-navigation-with-go-router-in-flutter-b11315bd183b
// https://github.com/cp-pratik-k/type-safe-navigation-flutter/blob/main/lib/navigation/routes.dart
class NavigationDestinationWithArgsExampleScreen extends StatelessWidget {
  final NavigationDestinationWithArgsExampleScreenArgs args;
  const NavigationDestinationWithArgsExampleScreen({
    super.key,
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Navigation DestinationWithArgs"),
      ),
      body: Column(
        children: [
          const Text("Args:"),
          Text(args.toString()),
        ],
      ),
    );
  }
}
