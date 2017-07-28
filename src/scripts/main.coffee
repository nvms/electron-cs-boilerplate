# ∴

import { SearchField, TitleBar, Toolbar } from 'react-desktop/macOs'

import Clock from '../components/clock'
import React from 'react'
import ReactDOM from 'react-dom'
import os from 'os'
import { remote } from 'electron'

app = remote.app

document.addEventListener 'DOMContentLoaded', ->
  document.getElementById('platform-info').innerHTML = os.platform()
  document.getElementById('appname').innerHTML = app.getName()

  ReactDOM.render(`
    <div>
      <Clock />
    </div>,
    document.getElementById('clock-target')
  `)

  ReactDOM.render(`
    <TitleBar inset>
      <Toolbar height='36' horizontalAlignment='right'>
        <SearchField
          placeholder="Press '&#8984;.' to search"
          defaultValue=''
          width='270'
          />
      </Toolbar>
    </TitleBar>,
    document.getElementById('topbar')
  `)

  return