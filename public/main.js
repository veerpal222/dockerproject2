const express = require('express')
const path = require('path')

const app = express()

const port = process.env.PORT || 3000

app.use(express.static('public'))


app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname + '/public/game.html'))
})

app.listen(port, (req, res) => console.log('SERVER STARTED'))