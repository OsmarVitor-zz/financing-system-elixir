defmodule MoneyUtilsTest do
    use ExUnit.Case

    test "format integer money value" do
        money = 1200
        assert 1200 == MoneyUtils.format_money(money)
      end
    
      test "format decimal money value" do
        money = 1200.10
        assert 1200 == MoneyUtils.format_money(money)
      end

end