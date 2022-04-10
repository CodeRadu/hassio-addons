const express = require('express')
const app = express()
const {readFileSync: rfs, existsSync} = require('fs')
const server=require('http').Server(app)
const path=process.argv[2]
const external=process.argv[3]
console.log(`Web dir is ${path}`)

app.use((req, res, next) =>{
  res.setHeader('X-Addon', 'Express web server addon')
  next()
})
app.set('view engine', 'ejs')

app.use('/expressrawpage', (req, res)=>{
  if(req.path=='/'){
    if(existsSync(`${path}index.html`)){
      const page=rfs(`${path}index.html`, 'utf8')
      res.send(page)
    }
    else {
      res.status(500).send('index.html page not found')
    }
  }
  else {
    if(existsSync(`${path}${req.path}`)){
      const page=rfs(`${path}${req.path}`, 'utf8')
      res.send(page)
    }
    else {
      res.status(404).send('Page not found')
    }
  }
})

app.use('/', (req, res)=>{
  if(req.path=='/jquery.js'){
    const jquery=rfs('jquery.js', 'utf8')
    res.send(jquery)
    return
  }
  if(req.path=='/check.js'){
    const check=rfs('check.js', 'utf8')
    res.send(check)
    return
  }
  const p=req.path
  res.render('index', {path: p})
})


console.log('Web server running')
app.listen(80)
