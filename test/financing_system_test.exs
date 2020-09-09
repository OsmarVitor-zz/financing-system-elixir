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

  test "not deposit -100 to account" do
    user_test = %{:uuid => "b499de09-a081-4987-8585-c7539e8cee17", :name => "User Name", :balance => 1200.000, :money_pattern => 986}
    assert FinancingSystem.deposit(user_test, -100) == "invalid operation!"
  end

  test "payment of 350" do
    user_test = %{:uuid => "8e4cc219-2750-4375-a3ee-c38dcd64e4b7", :name => "User Name", :balance => 1200.00, :money_pattern => 986}
    assert {:ok, %{:uuid => "8e4cc219-2750-4375-a3ee-c38dcd64e4b7", :name => "User Name", :balance => 850.00, :money_pattern => 986}} == FinancingSystem.payment(user_test, 350)
  end

  test "not payment of -350" do
    user_test = %{:uuid => "e3a7661b-c457-4f30-82a2-16854516c4d6", :name => "User Name", :balance => 1200.00, :money_pattern => 986}
    assert FinancingSystem.payment(user_test, -200) == "invalid operation!"
  end

end