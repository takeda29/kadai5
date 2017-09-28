# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'enemy'
require_relative 'arm'
require_relative 'item'

font = Font.new(32)

Window.width  = 800
Window.height = 600

player_img = Image.load("player.png")
player_img.setColorKey([0, 0, 0])

enemy_img = Image.load("enemy.png")
enemy_img.setColorKey([0, 0, 0])

bu_img = Image.load("ring.png")
bu_img.setColorKey([0, 0, 0])

usp_img = Image.load("speedup.png")
usp_img.setColorKey([0, 0, 0])

dsp_img = Image.load("speeddown.png")
dsp_img.setColorKey([0, 0, 0])

usc_img = Image.load("scoreup.png")
usc_img.setColorKey([0, 0, 0])

dsc_img = Image.load("scoredown.png")
dsc_img.setColorKey([0, 0, 0])

las_img = Image.load("laser.png")
las_img.setColorKey([0, 0, 0])

player = Player.new(400, 500, player_img)
player.init

enemies = []
bullets = []
laser = []
uspeed_items = []
dspeed_items = []
uscore_items = []
dscore_items = []

$score = 0

e_count = 50
usp_count = 120
dsp_count = 110
usc_count = 220
dsc_count = 210

# スタート画面
Window.loop do
  Window.draw_font(200, 200, "GAMESTART:Push space", font)
  break if Input.key_push?(K_SPACE)
end

#
Window.loop do
  break if Input.key_push?(K_ESCAPE)

  #　敵のインスタンス
  e_count -= 1
  if e_count == 0
    e_count = 50
    enemies << Enemy.new(rand(800), rand(200), enemy_img)
  end

  #　加速アイテムのインスタンス
  usp_count -= 1
  if usp_count == 0
    usp_count = 120
    uspeed_items << Item.new(rand(800), rand(200), usp_img)
  end

  #　減速アイテムのインスタンス
  dsp_count -= 1
  if dsp_count == 0
    dsp_count = 110
    dspeed_items << Item.new(rand(800), rand(200), dsp_img)
  end

  #　加点アイテムのインスタンス
  usc_count -= 1
  if usc_count == 0
    usc_count = 220
    uscore_items << Item.new(rand(800), rand(200), usc_img)
  end

  #　減点アイテムのインスタンス
  dsc_count -= 1
  if dsc_count == 0
    dsc_count = 210
    dscore_items << Item.new(rand(800), rand(200), dsc_img)
  end

  # 弾のインスタンス
  if Input.key_push?(K_SPACE)
    bullets << Arm.new(player.x, player.y, bu_img)
  end

  # 弾のインスタンス
  if Input.key_push?(K_SPACE)
    bullets << Arm.new(player.x, player.y, bu_img)
  end

  # レーザーのインスタンス
  if Input.key_down?(K_S)
    laser << Arm.new(player.x, player.y, las_img)
  end

  Sprite.update(enemies)
  Sprite.draw(enemies)

  Sprite.update(uspeed_items)
  Sprite.draw(uspeed_items)

  Sprite.update(dspeed_items)
  Sprite.draw(dspeed_items)

  Sprite.update(uscore_items)
  Sprite.draw(uscore_items)

  Sprite.update(dscore_items)
  Sprite.draw(dscore_items)

  Sprite.update(bullets)
  Sprite.draw(bullets)

  Sprite.update(laser)
  Sprite.draw(laser)

  player.update
  player.draw

  # 当たり判定
  Sprite.check(player, enemies)
  Sprite.check(player, uspeed_items, :upspeed)
  Sprite.check(player, dspeed_items, :downspeed)
  Sprite.check(player, uscore_items, :upscore)
  Sprite.check(player, dscore_items, :downscore)
  Sprite.check(bullets, enemies, :eneen)
  Sprite.check(laser, enemies, :eneen)
  Sprite.check(bullets, dspeed_items, :normal)
  Sprite.check(bullets, dscore_items, :normal)
  Sprite.check(laser, dspeed_items, :normal)
  Sprite.check(laser, dscore_items, :normal)
  Sprite.check(laser, uspeed_items, :normal)
  Sprite.check(laser, uscore_items, :normal)

  # ステータス表示
  life = player.showlife
  Window.draw_font(0, 0, "Score:#{$score}", font)
  Window.draw_font(720, 0, "Life:#{life}", font)
  if life < 0
    break
  end
end

# 終了画面
Window.loop do
  break if Input.keyPush?(K_ESCAPE)

  Window.draw_font(200, 200, "GAME FINISH:Push escape", font)
end
