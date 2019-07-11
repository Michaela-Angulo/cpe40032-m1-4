--This form is for the selection
--between AI and multiplayer
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
    
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.setFont(smallFont)
    love.graphics.printf('Press A for the AI MODE!', 0, VIRTUAL_HEIGHT/2 - 10 , VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press M for the MULTIPLAYER MODE!', 0, VIRTUAL_HEIGHT/2 + 5, VIRTUAL_WIDTH, 'center')
    
    
    love.graphics.rectangle('fill', 120, 95 , 3, 50)
    love.graphics.rectangle('fill', 120, 95 , 190, 3)
    love.graphics.rectangle('fill', 310, 95 , 3, 53)
    love.graphics.rectangle('fill', 120, 145 , 190, 3)

    
    love.graphics.rectangle('fill', 110, 95 , 3, 53)
    love.graphics.rectangle('fill', 120, 85 , 193, 3)
    love.graphics.rectangle('fill', 320, 95 , 3, 53)
    love.graphics.rectangle('fill', 120, 155 , 193, 3)
    
    push:finish()
end
function love.keypressed(key)
    
    if key == 'a' then
        require 'ai'
    elseif key == 'm' then
        require 'multiplayer'
    elseif  key == 'escape' then
        love.event.quit()
    end

end



