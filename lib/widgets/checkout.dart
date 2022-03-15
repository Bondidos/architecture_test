import 'package:architecture_test/state_model/app_state_container.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppStateContainerState? appState = AppStateContainer.of(context, rebuild: true);

    return Container(
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).secondaryHeaderColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Price: ${appState?.state.calculateBill()}'),
          ElevatedButton(
            onPressed: () => appState?.clearCard(),
            child: const Text('CheckOut'),
          )
        ],
      ),
    );
  }
}
