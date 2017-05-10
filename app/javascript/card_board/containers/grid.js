import React from 'react'
import _ from 'lodash'
import { connect } from 'react-redux'
import { Grid } from 'semantic-ui-react'

import ColumnHead from '../components/column_head'
import ColumnBody from '../components/column_body'

class CardBoardGrid extends React.Component {
  componentDidMount() {
    window.addEventListener('resize', _.debounce(() => this.handleResize(), 500))
    this.handleResize()
  }

  componentWillUnmount() {
    window.removeEventListener('resize', () => this.handleResize())
  }

  handleResize() {
    this.props.dispatch({
      type: 'RESIZE_WINDOW',
      windowHeight: window.innerHeight
    })
  }

  render() {
    const { columns, windowHeight } = this.props

    if (typeof columns === 'undefined') return null

    return (
      <Grid columns={columns.length} id="card_board">
        <Grid.Row>
          {columns.map((column) => {
            return <ColumnHead {...column} key={column.state_name} />
          })}
        </Grid.Row>

        <Grid.Row>
          {columns.map((column) => {
            return (
              <ColumnBody cards={column.cards}
                          windowHeight={windowHeight}
                          key={column.state_name} />
            )
          })}
        </Grid.Row>
      </Grid>
    )
  }
}

const mapStateToProps = (state) => {
  return {
    columns: state.columns,
    windowHeight: state.windowHeight
  }
}

export default connect(mapStateToProps)(CardBoardGrid)
