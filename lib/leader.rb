#
# = 開発リーダークラスです。
#
require './lib/base'

class Leader
  include Base
  attr_accessor :tired_point
  #Dir.glob("./lib/*.rb"){|file| require file}

  HEALTHY = 1
  TIRED = 2
  REST = 3
  HEALTHY_MESSAGE = "元気はつらつオロナミンC"
  TIRED_MESSAGE = "疲れました。シンドイDESU・・・"
  REST_MESSAGE = "今日はやすみます。探さないでください。。。"

  #
  # = 製品を開発します。リーダーなので能力が高いです。
  #
  def execute
    tweet
    return if tired_point == REST

    product = Product.instance

    if product.progress < 100
      product.progress += 2
      product.quality += 2
    else
      p "やっとおわりました！！(^^ゞ"
    end
  end

  # メンバーの状況をヒアリング
  def houkoku(product)
    tweet
    return unless tired_point == REST
  end

  private
  #  リーダのつぶやき
  def tweet
    case tired_point
    when HEALTHY
      p HEALTHY_MESSAGE
    when TIRED
      p TIRED_MESSAGE
    else REST
      p REST_MESSAGE
    end
  end
  
  #
  # プロジェクトマネージャー の連絡先を知っています
  # == プログラマーの連絡先を知っています
  #
  def project_manager
    @project_manager ||= ProjectManager.new
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

  def product
    Product.instance
  end

  def tired_point
    @tired_point ||= rand(HEALTHY..REST)
  end
end
