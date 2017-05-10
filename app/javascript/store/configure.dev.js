import { createStore, applyMiddleware } from 'redux'
import { createLogger } from 'redux-logger'
import { composeWithDevTools } from 'redux-devtools-extension';
import axios from 'axios'
import axiosMiddleware from 'redux-axios-middleware'

import reducer from 'card_board/reducers'

export default () => {
  const client = axios.create({
    responseType: 'json',
    headers: {
      'Accept': 'application/json'
    }
  })

  return createStore(
    reducer,
    composeWithDevTools(
      applyMiddleware(axiosMiddleware(client), createLogger())
    )
  )
}