defmodule FinancingSystemTest do
  use ExUnit.Case

  test "get info of a User Test" do
    user_test = %{:uuid => "a003be1f-a993-4743-a1e5-efd512b5c1e4", :name => "User Name", :balance => 1200.000, :money_pattern => 986}
    assert {:ok, "User name: User Name, account balace: 1200"} == FinancingSystem.get_info_user(user_test)
  end

  test "deposit 100 to account" do
    user_test = %{:uuid => "9fa7802b-79f5-4588-9a5e-396068756129", :name => "User Name", :balance => 1200.000, :money_pattern => 986}
    assert {:ok, %{:uuid => "9fa7802b-79f5-4588-9a5e-396068756129" , :name => "User Name", :balance => 1300.000, :money_pattern => 986}} == FinancingSystem.deposit(user_test, 100)
  end

  test "deposit -100 to account" do
    model = %{:uuid => "b499de09-a081-4987-8585-c7539e8cee17", :name => "User Name", :balance => 1200.000, :money_pattern => 986}
    assert FinancingSystem.deposit(model, -100) == "invalid operation!"
  end

end