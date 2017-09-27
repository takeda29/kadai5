# coding: utf-8

class Arm < Sprite
  def self.init
    @a_flag = false
    @@score = 0
  end

  def self.set
    @a_flag = true
  end

  def self.ref
    @a_flag
  end

  def self.score
    @@score
  end

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

  # 他のオブジェクトと衝突した際に呼ばれるメソッド
  def shot(obj)
    @@score += 1
    self.vanish
  end
end
