# coding: utf-8

class Player < Sprite
  def init
    @life = 3
    @k_flag = false
    @speed = 1.0
  end

  def update
    self.x += Input.x * @speed
    # Playerは画面内にとどまる
    if self.x >= Window.width - self.image.width
      self.x = Window.width - self.image.width
    elsif self.x <= 0
      self.x = 0
    end

    # Playerは画面内にとどまる
    self.y += Input.y * @speed
    if self.y >= Window.height - self.image.height
      self.y = Window.height - self.image.height
    elsif self.y <= 0
      self.y = 0
    end
  end

  # 他のオブジェクトと衝突した際に呼ばれるメソッド
  def shot(obj)
      @life -= 1
      @speed = 1.0
  end

  # 加速アイテムを取得時に呼ばれるメソッド
  def upspeed
    @speed += 0.5
  end

  # 減速アイテムを取得時に呼ばれるメソッド
  def downspeed
    @speed -= 0.5
    if @speed <= 0
      @speed = 1.0
    end
  end

  # ライフを返すメソッド
  def showlife
    @life
  end
end
