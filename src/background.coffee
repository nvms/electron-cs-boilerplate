# ∴

import { Menu, app } from 'electron'

import createWindow from './helpers/window'
import { devTemplate } from './menu/dev_template'
import path from 'path'
import url from 'url'

mainWindow = null

throwAway = ->
  menus = [ devTemplate ]
  Menu.setApplicationMenu Menu.buildFromTemplate(menus)
  return

app.on 'ready', ->
  mainWindow = createWindow('main',
    width: 350
    height: 250
    show: false)
  mainWindow.loadURL url.format(
    pathname: path.join(__dirname, 'main.html')
    protocol: 'file:'
    slashes: true)
  mainWindow.once 'ready-to-show', -> # prevents flickering on load
    mainWindow.show()
    return
  return
app.on 'window-all-closed', ->
  app.quit()
  return
