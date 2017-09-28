# coding: utf-8

class Arm < Sprite
  def update
    self.y -= 2
      if self.y <= 0
        self.vanish
      end
  end

  def flag_set
    @a_flag = true
  end

  def flag_check
    @a_flag
  end

  # アイテムと衝突した際に呼ばれるメソッド
  def eneen(obj)
    $score += 1
    self.vanish
  end

  # 他のオブジェクトと衝突した際に呼ばれるメソッド
  def normal(obj)
    self.vanish
  end
end
