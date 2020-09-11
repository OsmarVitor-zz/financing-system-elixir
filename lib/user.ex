defmodule User do
    @enforce_keys [:uuid, :name, :balance, :money_pattern]
    defstruct [:uuid, :name, :balance, :money_pattern]
end