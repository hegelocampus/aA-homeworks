import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import RootReducer from '../reducers/root_reducer';
import { composeWithDevTools } from 'redux-devtools-extension';

const configureStore = () => {
  return createStore(RootReducer, composeWithDevTools(
    applyMiddleware(thunk)
  ));
}

export default configureStore;
