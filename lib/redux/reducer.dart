import 'package:architecture_test/redux/state/state.dart';
import 'package:redux/redux.dart';
import 'actions/add_item_to_card_action.dart';

final appStateReducer = combineReducers<AppState>({
    TypedReducer<AppState,ActionAddItemToCard>(_addItemToCard),
    TypedReducer<AppState,ActionRemoveItemFromCard>(_removeItemFromCard),
    TypedReducer<AppState,ActionCompleteOrder>(_completeOrder),
});

AppState _addItemToCard(AppState appState,ActionAddItemToCard action){

    List<int> ids = [];
    ids.addAll(appState.orderItems);
    ids.add(action.itemId);

    return appState.copyWith(orderItems: ids);
}

AppState _removeItemFromCard(AppState appState,ActionRemoveItemFromCard action){

    List<int> ids = [];
    ids.addAll(appState.orderItems);
    ids.remove(action.itemId);

    return appState.copyWith(orderItems: ids);
}

AppState _completeOrder(AppState appState,ActionCompleteOrder action){

    return appState.copyWith(orderItems: []);
}