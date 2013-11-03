#
# = プログラマクラスです。製品の進捗率を上げることが出来ます。
#
require './lib/base'

class Programmer
  include Base

  #
  # == 製品を開発します
  #
  attr_accessor :tired_point_programmer #テスター疲労度
  def initialize
    @tired_point_programmer ||= 1
  end

  def execute(product)
    @tired_point_programmer += 1
    product.progress += 1
    if @tired_point_programmer == 0
      p "【プログラマーが発言している】"
      p "すいません、休んだ分取り返します！"
    elsif @tired_point_programmer < 5
      p "【プログラマーが発言している。】"
      p "まだまだ楽勝です！"
    elsif @tired_point_programmer < 10
      p "【プログラマーが発言している】"
      p "ちょっときついです。。。"
    elsif @tired_point_programmer < 15
      p "【プログラマーの様子が。。。】"
      p "う、お腹が痛い。。。"
    elsif @tired_point_programmer < 20
      p "【プログラマーからメールがあった。】"
      p "体調不良で今日休みます。。。"
      @tired_point_programmer = 0
      product.progress -= 1
    end
  end
 
  def call_from_customer
    p "ごめんなさい直します。。。"
    product.quality -= 3
    product.progress -= 1
    @tired_point_programmer += 3
  end

  def product
    Product.instance
  end
end
