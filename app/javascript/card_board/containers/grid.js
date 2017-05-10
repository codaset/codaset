import React from 'react'
import { connect } from 'react-redux'
import { Grid } from 'semantic-ui-react'

import ColumnHead from '../components/column_head'
import ColumnBody from '../components/column_body'

const CardBoardGrid = ({columns}) => {
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
          return <ColumnBody {...column} key={column.state_name} />
        })}
      </Grid.Row>
    </Grid>
  )
}

const mapStateToProps = (state) => {
  return {
    columns: state.columns
  }
}

export default connect(mapStateToProps)(CardBoardGrid)
