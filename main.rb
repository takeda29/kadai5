# coding: utf-8
require 'dxruby'

require_relative 'arm'
require_relative 'player'
require_relative 'enemy'

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
bullets = []
Arm.init

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

  player.update
  player.draw

  if Input.key_push?(K_SPACE)
    bullets << Arm.new(player.x, player.y, bu_img)
    Arm.set
  end

  if Arm.ref
    Sprite.update(bullets)
    Sprite.draw(bullets)
  end

  # 当たり判定
  Sprite.check(player, enemies)
  if Arm.ref
    Sprite.check(bullets, enemies)
  end

  score = Arm.score
  life = player.showlife
  Window.draw_font(0, 0, "Score:#{score}", font)
  Window.draw_font(720, 0, "Life:#{life}", font)
  if life < 0
    break
  end
end

Window.loop do
  break if Input.keyPush?(K_ESCAPE)

  Window.draw_font(200, 200, "GAME FINISH:Push escape", font)
end
