#
# = メイン処理クラス
#
Dir.glob("./lib/*.rb"){|file| require file}
Dir.glob("./scenarios/*.rb"){|file| require file}


class Main
  def execute
    [ Scenarios::ProtoTyping].each do |klass|
      klass.new.execute({ customer: customer, project_manager: project_manager, sales: sales })
    end
  rescue Exception => ex
    p "このプロジェクトは撤退だ！！！！！！！！！！！！！！！！！！！！！！！！！！！"
    raise ex
  end

  def customer
    @customer ||= Customer.new
  end

  def project_manager
    @project_manager ||= GoodProjectManager.new
  end

  def sales
    @sales ||= Sales.new
  end
end


Main.new.execute
