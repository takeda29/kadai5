# coding: utf-8

class Player < Sprite
  def init
    @life = 3
    @k_flag = false
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
    @life -= 1
  end

  def showlife
    @life
  end
end
