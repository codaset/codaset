import React from 'react'
import { Grid } from 'semantic-ui-react'

export default (column) => (
  <Grid.Column>
    <div className="ui label">
      {column.state_display_name} <div className="detail">{column.card_count}</div>
    </div>
  </Grid.Column>
)
