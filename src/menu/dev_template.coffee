# ∴

`import { app, BrowserWindow } from 'electron'

export var devTemplate = {
  label: 'Development',
  submenu: [{
    label: 'Reload',
    accelerator: 'CmdOrCtrl+R',
    click: function () {
      BrowserWindow.getFocusedWindow().webContents.reloadIgnoringCache()
    }
  }, {
    label: 'Toggle Developer Tools',
    accelerator: 'Alt+CmdOrCtrl+I',
    click: function () {
      BrowserWindow.getFocusedWindow().toggleDevTools()
    }
  }, {
    label: 'Quit',
    accelerator: 'CmdOrCtrl+Q',
    click: function () {
      app.quit()
    }
  }]
}`