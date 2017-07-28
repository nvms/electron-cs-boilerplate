# ∴

'use babel'

import React from 'react'
import styles from './clock-styles'

`export default class Clock extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      date: new Date()
    }
  }
  componentDidMount () {
    this.timerID = setInterval(
            () => this.tick(),
            1000
        )
  }
  componentWillUnmount () {
    return clearInterval(this.timerID)
  }
  tick () {
    return this.setState({
      date: new Date()
    })
  }
  render () {
    return (
      <span style={styles.root}>{this.state.date.toLocaleTimeString()}</span>
    )
  }
}`