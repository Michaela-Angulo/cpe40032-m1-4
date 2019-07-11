--This form is for the  selection
--between being player 1 or player 2

push = require 'push'

Class = require 'class'

require 'Paddle'

require 'Ball'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 250

function love.load()

    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setTitle('Pong')

    math.randomseed(os.time())

    smallFont = love.graphics.newFont('font.ttf', 8)
    largeFont = love.graphics.newFont('font.ttf', 16)
    scoreFont = love.graphics.newFont('font.ttf', 32)
    love.graphics.setFont(smallFont)

    sounds = {
        ['paddle_hit'] = love.audio.newSource('sounds/paddle_hit.wav', 'static'),
        ['score'] = love.audio.newSource('sounds/score.wav', 'static'),
        ['wall_hit'] = love.audio.newSource('sounds/wall_hit.wav', 'static')
    }

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true,
        canvas = false
    })

    player1 = Paddle(10, 30, 5, 20)
    player2 = Paddle(VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 30, 5, 20)

    ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)

    player1Score = 0
    player2Score = 0

    servingPlayer = 1

    winningPlayer = 0

    gameState = 'start'
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.draw()
    push:start()

    love.graphics.clear(40, 45, 52, 255)
    love.graphics.setFont(smallFont)
    love.graphics.printf('Welcome to Pong - AI MODE!', 0, VIRTUAL_HEIGHT/2 - 30, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press (R) to play as PLAYER 2 - UP, DOWN for Controls!', 0, VIRTUAL_HEIGHT/2 - 10, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press (L) to play as PLAYER 1 - W,S for Controls!', 0, VIRTUAL_HEIGHT/2 - 20, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press (B) for AI vs. AI!', 0, VIRTUAL_HEIGHT/2 , VIRTUAL_WIDTH, 'center')
    

    love.graphics.rectangle('fill', 80, 85 , 3, 45)
    love.graphics.rectangle('fill', 80, 85 , 272, 3)
    love.graphics.rectangle('fill', 350, 85 , 3, 45)
    love.graphics.rectangle('fill', 80, 130 , 273, 3)

    love.graphics.rectangle('fill', 70, 85 , 3, 48)
    love.graphics.rectangle('fill', 80, 75 , 272, 3)
    love.graphics.rectangle('fill', 360, 85 , 3, 48)
    love.graphics.rectangle('fill', 80, 140 , 273, 3)

    


    push:finish()
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit ()
    
    elseif key == 'l' then
        require 'Lai'
    
    elseif key == 'r' then
        require 'Rai'

    elseif key == 'b' then
        require 'bai'
        
    end

end


