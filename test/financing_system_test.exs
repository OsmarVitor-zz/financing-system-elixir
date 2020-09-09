defmodule FinancingSystemTest do
  use ExUnit.Case

  test "get info of a User Test" do
    user_test = %{:uuid => "a003be1f-a993-4743-a1e5-efd512b5c1e4", :name => "User Name", :balance => 1200.000, :money_pattern => 986}
    assert {:ok, "User name: User Name, account balace: 1200"} == FinancingSystem.get_info_user(user_test)
  end

end