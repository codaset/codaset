import React from 'react'
import { Grid } from 'semantic-ui-react'

export default ({cards, windowHeight}) => (
  <Grid.Column style={{ height: windowHeight - 140 }}>
    {cards.map(card => (
      <a className="ui card" href="#" key={card.number}>
        <div className="content">
          <div>{card.title}</div>
          <div className="meta">#{card.number}</div>
        </div>
      </a>
    ))}
  </Grid.Column>
)
