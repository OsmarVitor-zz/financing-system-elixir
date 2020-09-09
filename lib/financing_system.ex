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
    "invalid operation!"
  """

  def get_info_user(user_info),
  do: {:ok, "User name: #{user_info[:name]}, account balace: #{MoneyUtils.format_money(user_info[:balance])}"}

  def deposit(user, deposit_value) do
    if deposit_value > 0 do
      {:ok, Map.update!(user, :balance, &(MoneyUtils.format_money(&1) + MoneyUtils.format_money(deposit_value)))}
    else
      "invalid operation!"
    end
  end

end
