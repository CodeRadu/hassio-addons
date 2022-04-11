const express = require('express')
const app = express()
const server = require('http').createServer(app)
const fs = require('fs')
const path = require('path')

const isFile = (name) => {
  return fs.existsSync(path.join(`${__dirname}/frontend/build`, name))
}

app.use((req, res) => {
  if (req.url == '/') {
    res.sendFile(path.join(`${__dirname}/frontend/build`, 'index.html'))
    return
  }
  if (isFile(req.url)) {
    res.sendFile(path.join(`${__dirname}/frontend/build`, req.url))
  } else {
    res.sendFile(path.join(`${__dirname}/frontend/build`, 'index.html'))
  }
})

fs.writeFileSync('/var/run/editor.lock', '')
server.listen(3000)
