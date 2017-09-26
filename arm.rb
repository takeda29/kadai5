# coding: utf-8

class Arm < Sprite
  def update
    self.y -= 1
    if self.y <= 0
      self.vanish
    end
  end

  # 他のオブジェクトと衝突した際に呼ばれるメソッド
  def shot(obj)
    self.vanish
  end
end