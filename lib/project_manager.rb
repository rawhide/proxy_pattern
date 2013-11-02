#
# = Project Managerクラスです。
#   各種情報のフィルタリングや顧客への回答、プログラマへの伝達などをおこないます。
require './lib/base'

class ProjectManager
  include Base

  def claim(customer)
    Sales.new.execute(customer)
  end

  def execute(customer, scenario=nil)
    raise "abstract method !!"
  end

  def leader
    @leader ||= Leader.new
  end

  def programmer
    @programmer ||= Programmer.new
  end

  def tester
    @tester = Tester.new
  end

  def product
    Product.instance
  end
end
