# coding: utf-8

class Player < Sprite
  def init
    @score = 0
    @@life = 3
  end
  def update
    self.x += Input.x * 1.5
    # Playerは画面内にとどまる
    if self.x >= Window.width - self.image.width
      self.x = Window.width - self.image.width
    elsif self.x <= 0
      self.x = 0
    end

    # Playerは画面内にとどまる
    self.y += Input.y * 1.5
    if self.y >= Window.height - self.image.height
      self.y = Window.height - self.image.height
    elsif self.y <= 0
      self.y = 0
    end
  end

  # 他のオブジェクトと衝突した際に呼ばれるメソッド
  def shot(obj)
    @score += 1
    @@life -= 1
  end
  
  def show
    font = Font.new(32)
    Window.draw_font(0, 0, "score:#{@score}", font)
  end

  def showlife
    @@life
  end
end