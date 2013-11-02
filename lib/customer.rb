require './lib/tester'
require './lib/sales'
require './lib/project_manager'
require './lib/leader'

#
# = 顧客クラスです。あらぶっています。
#   クレバーな顧客なので、要因の連絡先をそれぞれ知っています。
#
require './lib/base'

class Customer
  include Base
  attr_accessor :angry_mater
  #
  # == 営業を呼び出してクレームをする
  # 
  
  def initialize
    @angry_mater = 20
  end
  
  def claim

    project_manager.claim self

    insults ||= Array.new

    #怒り度合い
    if (@angry_mater < 50)

      #進捗に関するクライム
      if  product.progress < 20
        insults << "嘘だよね・・土下座してもらおう！"
      elsif product.progress < 50
        insults << "開発スピード、遅くね？　金もらってるんだから、ちゃんとやれよ、このハゲ！"
      else 
        insults << "スケジュール通りにやってくだだい！"
      end

      #品質に関するクライム
      if  product.quality < 50
        insults << "このシステムって子供に作らせた？？Quality低すぎるやん"
      end

    else
      raise ArgumentError.new('お前、死にたいのよね・・・俺を怒らせるってこと死にたいよね・・逃がさないぞ！！')
    end

    return  insults.each { |mess| puts mess ; sleep 2 }

  end

  #
  # == 進捗が遅いとおいかり
  #    各所に当たり散らします
  def angry
    "信じられない、このやる気のなさ・・別の開発会社にお願いしようかな" if @angry_mater > 60
  end

  #
  # == 発狂中、プログラマーに直接電話します
  #
  def panic!
    (product.progress < 50) ? "大変！今すぐリーダーを呼んでください" : "HAaaaAAaAAaAAAaAAAAAAA" 
    programmer.call_from_customer
  end

  #
  # == 納品物を受け取ります
  #
  def execute
    if product.progress > 100 && product.qualify > 80
      happy!
    else
      claim
    end
  end


  private

  #
  # == 納品すると喜びます
  #
  def happy!
    p "ありがとう！！！"
  end

  #
  # == プログラマーの連絡先を知っています
  #
  def programmer
    @programmer ||= Programmer.new
  end

  #
  # == リーダーの連絡先を知っています
  #
  def leader
    @leader ||= Leader.new
  end

  #
  # == 営業の連絡先を知っています
  #
  def sales
    @sales ||= Sales.new
  end

  #
  # == PMの連絡先を知っています
  #
  def project_manager
    @project_manager ||= ProjectManager.new
  end

  #
  # == Testerの連絡先を知っています
  #
  def tester
    @tester ||= Tester.new
  end

  def product
    Product.instance
  end
end

