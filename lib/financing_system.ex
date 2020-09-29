defmodule FinancingSystem do
  @moduledoc """
  Documentation for `FinancingSystem`.
  This module is intended for financial operations
  """

  @doc """
  get_info_user.

  ## Example

      iex> FinancingSystem.get_info_user((%{:uuid => "a003be1f-a993-4743-a1e5-efd512b5c1e4", :name => "User Name Test", :balance => 1200.000, :money_pattern => 986})
      {:ok, "User name: User Name Test, account balace: 1200"}
  
  get_info_user.

  ## Examples

    iex> FinancingSystem.deposit((%{:uuid => "a003be1f-a993-4743-a1e5-efd512b5c1e4", :name => "User Name Test", :balance => 1200.000, :money_pattern => 986}), 100)
    {:ok, %{balance: 1300, money_pattern: 986, name: "User Name Test", uuid: "a003be1f-a993-4743-a1e5-efd512b5c1e4"}}

    iex> FinancingSystem.deposit((%{:uuid => "a003be1f-a993-4743-a1e5-efd512b5c1e4", :name => "User Name Test", :balance => 1200.000, :money_pattern => 986}), -20)
    {:error, "invalid operation!"}

  payment.

  ## Examples

    iex> FinancingSystem.payment((%{:uuid => "a003be1f-a993-4743-a1e5-efd512b5c1e4", :name => "User Name Test", :balance => 1200.000, :money_pattern => 986}), 100)
    {:ok, %{balance: 1100, money_pattern: 986, name: "User Name Test", uuid: "a003be1f-a993-4743-a1e5-efd512b5c1e4"}}

    iex> FinancingSystem.payment((%{:uuid => "a003be1f-a993-4743-a1e5-efd512b5c1e4", :name => "User Name Test", :balance => 1200.000, :money_pattern => 986}), -20)
    {:error, "invalid operation!"}

  transfer_money.

  ## Examples

    iex> FinancingSystem.transfer_money(user_to_transfer, 100, %{balance: 1200, money_pattern: 986, name: "User Test 2",uuid: "a003be1f-a993-4743-a1e5-efd512b5c1e4"})
    {:ok, %{balance: 1300, money_pattern: 986, name: "User Test 2",uuid: "a003be1f-a993-4743-a1e5-efd512b5c1e4"}}

    iex> FinancingSystem.transfer_money(user_to_transfer, -20, %{:uuid => "a003be1f-a993-4743-a1e5-efd512b5c1e4", :name => "User Name Test", :balance => 1200.000, :money_pattern => 986})
    {:error, "invalid operation!"}

  exchange_money.

  ## Examples

    iex> FinancingSystem.exchange_money(%{balance: 1200, money_pattern: 986, name: "User Test 2",uuid: "a003be1f-a993-4743-a1e5-efd512b5c1e4"}, "dollar")
    {:ok, %{balance: 240.0, money_pattern: 986, name: "User Test 2", uuid: "a003be1f-a993-4743-a1e5-efd512b5c1e4"}}

    iex> FinancingSystem.exchange_money(%{balance: 1200, money_pattern: 986, name: "User Test 2",uuid: "a003be1f-a993-4743-a1e5-efd512b5c1e4"}, "euro")
    {:ok, %{balance: 200.0, money_pattern: 986, name: "User Test 2", uuid: "a003be1f-a993-4743-a1e5-efd512b5c1e4"}}
  """

  def get_info_user(user_info),
  do: {:ok, "User name: #{user_info.name}, account balace: #{MoneyUtils.format_money(user_info.balance)}"}

  def deposit(user, deposit_value) do
    if deposit_value > 0 do
      {:ok, Map.update!(user, :balance, &(MoneyUtils.format_money(&1) + MoneyUtils.format_money(deposit_value)))}
    else
      {:error, "invalid operation!"}
    end
  end

  def payment(user, payment_value) do
    if payment_value > 0 do
      {:ok, Map.update!(user, :balance, &(MoneyUtils.format_money(&1) - MoneyUtils.format_money(payment_value)))}
    else
      {:error, "invalid operation!"}
    end
   end 

   def transfer_money(user_to_transfer, money_to_transfer, user_to_receive) do
    if money_to_transfer < 0 or user_to_transfer.balance < 0 do
      {:error, "invalid operation!"}
    else
      {:ok, Map.update!(user_to_receive, :balance, &(MoneyUtils.format_money(&1) + MoneyUtils.format_money(money_to_transfer)))}
    end
   end

   def exchange_money(user, money_to_exchange) do
    currency = %{dollar: 5.00, euro: 6.00}
    verify_currency = currency[String.to_atom(money_to_exchange)]
    if(verify_currency != nil) do
      {:ok, Map.update!(user, :balance, &(MoneyUtils.format_money(&1) / MoneyUtils.format_money(currency[String.to_atom(money_to_exchange)])))}
    else
      {:error, "invalid operation!"}
    end
  end
end
