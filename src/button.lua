-- button.lua
local Button = {}
Button.__index = Button

function Button.new(x, y, text, action)
    local self = setmetatable({}, Button)
    self.x = x
    self.y = y
    self.text = text
    self.action = action
    self.font = love.graphics.newFont(14)
    love.graphics.setFont(self.font)
    self.paddingX = 12
    self.paddingY = 6

    local textWidth = self.font:getWidth(text)
    local textHeight = self.font:getHeight()
    self.width = textWidth + self.paddingX * 2
    self.height = textHeight + self.paddingY * 2

    -- Click state
    self.isPressed = false

    return self
end

function Button:draw()
    -- Change size when pressed
    local buttonHeight = self.isPressed and self.height - 2 or self.height

    -- Background color based on pressed state
    love.graphics.setColor(0.7, 0.7, 0.7) -- light gray
    love.graphics.rectangle("fill", self.x, self.y, self.width, buttonHeight, 4, 4)

    -- Inner shadow effect for pressed look
    love.graphics.setColor(0.9, 0.9, 0.9) -- slightly lighter
    love.graphics.rectangle("fill", self.x + 1, self.y + 1, self.width - 2, buttonHeight - 2, 4, 4)

    -- Border
    love.graphics.setColor(0.5, 0.5, 0.5) -- gray border
    love.graphics.setLineWidth(1)
    love.graphics.rectangle("line", self.x, self.y, self.width, buttonHeight, 4, 4)

    -- Text
    love.graphics.setFont(self.font)
    love.graphics.setColor(0, 0, 0) -- black text
    love.graphics.print(self.text,
        self.x + (self.width - self.font:getWidth(self.text)) / 2,
        self.y + (buttonHeight - self.font:getHeight()) / 2
    )
end

function Button:mousepressed(mx, my, button)
    if button == 1 and
       mx >= self.x and mx <= self.x + self.width and
       my >= self.y and my <= self.y + self.height then
        self.isPressed = true
        self.action()
    end
end

function Button:mousereleased(mx, my, button)
    if button == 1 and self.isPressed then
        self.isPressed = false
    end
end

return Button
