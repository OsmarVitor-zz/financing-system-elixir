defmodule MoneyUtils do
  @moduledoc """
  Documentation for `MoneyUtils`.
  This module is intended to format user values
  """

  @doc """
  format_money.

  ## Examples

      iex> MoneyUtils.format_money(2550.00)
      :2550

      iex> MoneyUtils.format_money(1350)
      :1350

      iex> MoneyUtils.format_money(1.1e3)
      :1100
  """
   
  require Decimal
   
  def format_money(money) do
    if Decimal.is_decimal(money) do
      money
    else
      trunc(money)
    end
  end
end
   