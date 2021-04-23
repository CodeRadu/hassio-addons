const express = require('express')
const app = express()
const {readFileSync: rfs, existsSync} = require('fs')
const path=process.argv[2]
console.log(`Web dir is ${path}`)

app.use((req, res, next) =>{
  res.setHeader('X-Addon', 'Express web server addon')
  next()
})

app.get('/', (req, res) => {
  if(existsSync(`${path}index.html`)){
    const page=rfs(`${path}index.html`, 'utf8')
    res.send(page)
  }
  else {
    res.status(500).send('index.html page not found')
  }
})

app.get('/:page', (req, res) =>{
  if(existsSync(`${path}${req.params.page}`)){
    const page=rfs(`${path}${req.params.page}`, 'utf8')
    res.send(page)
  }
  else {
    res.status(404).send('Page not found')
  }
})

console.log('Web server running')
app.listen(80)