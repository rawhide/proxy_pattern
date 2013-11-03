# encoding: utf-8

#
# = 営業クラスです。顧客がおこると出てきたり、出てこなかったり・・
#
require './lib/base'

class Sales
  include Base

  def execute(customer)
    case customer.angry_mater
    when customer.angry_mater > 100
      gyakugire
    when 100
      dogeza
    when 90..99
      ayamaru
    when 80..90
      kakunin
    when 70..80
      tyousei
    when 60..70
      iiwake
    when 50..60
      mataseru
    when 40..50
      ukagau
    when 30..40
      monadainashi
    when 20..30
      #irusu
    when 10..20
      mushi
    else
      puts "世界は平和です"
    end
  end

  private

  def gyakugire
    puts "ふざけろ(#ﾟДﾟ)"
    customer.angry_mater += 10
  end

  def dogeza
    puts "申し訳ございません ＿|￣|○"
    customer.angry_mater -= 30
  end

  def ayamaru
    puts "すみません m(_ _)m"
    customer.angry_mater -= 20
  end

  def kakunin
    puts "確認します、少々お待ちください(・ω・)"
    customer.angry_mater -= 10
  end

  def tyousei
    puts "開発チームと調整します、( ｰ`дｰ´)"
    customer.angry_mater -= 10
  end

  def iiwake
    puts "いやーなんとかなりますから＾＾；"
    customer.angry_mater += 5
  end

  def mataseru
    puts "もう少しです。ホントもう少しです。(・∀・)"
    customer.angry_mater += 5
  end

  def ukagau
    puts "ちょっと伺いますね(^_^)"
    customer.angry_mater += 5
  end

  def monadainashi
    puts "ただいま席を外しております"
    customer.angry_mater += 10
  end

  def monadainashi
    puts "開発チームを信じて待って下さい"
  end

  def mushi
    puts "・・・・・・・"
    customer.angry_mater += 100
  end

end
