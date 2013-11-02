require './lib/base'
require './lib/project_manager'

class GoodProjectManager < ProjectManager
  def execute(customer, scenario=nil)
    # return product if customer.angry_mater < 100

    case scenario
    when Scenarios::ProtoTyping
      leader.execute
    when Scenarios::ProductDevelopment
      programmer.execute
    when Scenarios::Test
      tester.execute
    when Scenarios::Delivery
      leader.execute rescue nil
      programmer.execute rescue nil
      tester.execute rescue nil

      begin
        customer.execute(product)
      rescue
        raise ArgumentError.new('この金額でやってられるか!!') if
        !product.respond_to?('price') || product.price < 300_000
      end
    end

    product
  end
end
