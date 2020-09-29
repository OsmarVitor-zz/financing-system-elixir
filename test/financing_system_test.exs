defmodule FinancingSystemTest do
  use ExUnit.Case

  test "get info of a User Test" do
    user_test = %User{uuid: "a003be1f-a993-4743-a1e5-efd512b5c1e4", name: "User Name", balance: 1200.00, money_pattern: 986}
    assert {:ok, "User name: User Name, account balace: 1200"} == FinancingSystem.get_info_user(user_test)
  end

  test "deposit 100 to account" do
    user_test = %User{uuid: "9fa7802b-79f5-4588-9a5e-396068756129", name: "User Name", balance: 1200.00, money_pattern: 986}
    assert {:ok, %User{:uuid => "9fa7802b-79f5-4588-9a5e-396068756129" , :name => "User Name", :balance => 1300.000, :money_pattern => 986}} == FinancingSystem.deposit(user_test, 100)
  end

  test "not deposit -100 to account" do
    user_test = %User{uuid: "b499de09-a081-4987-8585-c7539e8cee17", name: "User Name", balance: 1200.00, money_pattern: 986}
    assert {:error, "invalid operation!"} == FinancingSystem.deposit(user_test, -100)
  end

  test "payment of 350" do
    user_test = %User{uuid: "8e4cc219-2750-4375-a3ee-c38dcd64e4b7", name: "User Name", balance: 1200.00, money_pattern: 986}
    assert {:ok, %User{:uuid => "8e4cc219-2750-4375-a3ee-c38dcd64e4b7", :name => "User Name", :balance => 850, :money_pattern => 986}} == FinancingSystem.payment(user_test, 350)
  end

  test "not payment of -350" do
    user_test = %{uuid: "e3a7661b-c457-4f30-82a2-16854516c4d6", name: "User Name", balance: 1200.00, money_pattern: 986}
    assert {:error, "invalid operation!"} == FinancingSystem.payment(user_test, -200)
  end

  test "transfer 100 of user1 to user2" do
    user1 = %User{uuid: "7cec4d2e-5b6d-487a-ab71-7c87083b7b9d", name: "User Test 1", balance: 1200.00, money_pattern: 986}
    user2 = %User{uuid: "a003be1f-a993-4743-a1e5-efd512b5c1e4", name: "User Test 2", balance: 1200.00, money_pattern: 986}
    assert {:ok, %User{:uuid => "a003be1f-a993-4743-a1e5-efd512b5c1e4", :name => "User Test 2", :balance => 1300.00, :money_pattern => 986}} == FinancingSystem.transfer_money(user1, 100, user2)
  end

  test "not transfer -10 of user1 to user2" do
    user1 = %User{uuid: "0d29e1ab-51af-48e6-ad2d-ea380800736c", name: "User Name", balance: 1200.00, money_pattern: 986}
    user2 = %User{uuid: "8327c9be-f12e-4134-a8dc-d2f0c018a7d3", name: "User Name", balance: 1200.00, money_pattern: 986}
    assert {:error, "invalid operation!"} == FinancingSystem.transfer_money(user1, -10, user2)
  end

  test "exchange money to dollar" do
    user = %User{uuid: "84417174-a2ae-4557-abb3-7123ba381d9b", name: "User Name", balance: 1200.00, money_pattern: 986}
    assert {:ok, %User{balance: 240.0, money_pattern: 986, name: "User Name", uuid: "84417174-a2ae-4557-abb3-7123ba381d9b"}} == FinancingSystem.exchange_money(user, "dollar")
  end

  test "exchange money to euro" do
    user = %User{uuid: "219fd035-fa1f-4864-ae3f-3e55462ac6ea", name: "User Name", balance: 1200.00, money_pattern: 986}
    assert {:ok, %User{balance: 200.0, money_pattern: 986, name: "User Name", uuid: "219fd035-fa1f-4864-ae3f-3e55462ac6ea"}} == FinancingSystem.exchange_money(user, "euro")
  end

  test "not exchange money to unsupported currency" do
    user = %User{uuid: "219fd035-fa1f-4864-ae3f-3e55462ac6ea", name: "User Name", balance: 1200.00, money_pattern: 986}
    assert {:error, "invalid operation!"} == FinancingSystem.exchange_money(user, "peso")
  end

end