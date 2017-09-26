# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'enemy'
require_relative 'arm'

font = Font.new(32)

Window.width  = 800
Window.height = 600

player_img = Image.load("player.png")
player_img.setColorKey([0, 0, 0])

enemy_img = Image.load("enemy.png")
enemy_img.setColorKey([0, 0, 0])

bu_img = Image.load("ring.png")
bu_img.setColorKey([0, 0, 0])

player = Player.new(400, 500, player_img)
player.init

enemies = []

count = 25
at_count = false

Window.loop do
  Window.draw_font(200, 200, "GAMESTART:Push space", font)
  break if Input.key_push?(K_SPACE)
end

Window.loop do
  break if Input.key_push?(K_ESCAPE)

  count -= 1
  if count == 0
    count = 25
    enemies << Enemy.new(rand(800), rand(200), enemy_img)
  end

  Sprite.update(enemies)
  Sprite.draw(enemies)

  player.show
  player.update
  player.draw
  
  if Input.key_push?(K_ESCAPE)
  
  
  end
  
  # 当たり判定
  Sprite.check(player, enemies)

  life = player.showlife
  Window.draw_font(730, 0, "life:#{life}", font)
  if life < 0
    break
  end
end

Window.loop do
  break if Input.keyPush?(K_ESCAPE)

  Window.draw_font(200, 200, "GAMEOVER:Push escape", font)
end
