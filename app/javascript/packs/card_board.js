import React from 'react'
import { render } from 'react-dom'
import { Provider } from 'react-redux'

import configureStore from 'store'
import actions from 'card_board/actions'
import Grid from 'card_board/containers/grid'

const store = configureStore()

render(
  <Provider store={store}>
    <Grid />
  </Provider>,
  document.getElementById('react_root')
)

store.dispatch(actions[0]);
