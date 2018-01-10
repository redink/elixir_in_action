defmodule CompileDataBeamSplitFiles.N0 do

  2
  |> CompileDataBeamSplitFiles.Help.split_map()
  |> Map.get(0)
  |> Enum.map(fn {k, v} -> def get(unquote(k)), do: unquote(v) end)

end
