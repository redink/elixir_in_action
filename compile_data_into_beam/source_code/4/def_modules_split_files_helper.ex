defmodule CompileDataBeamSplitFiles.Generator do

  def generate_multi_files(n) do
    for i <- 0..(n - 1) do
      content = EEx.eval_file("def_modules_split_files.eex", number: i, total: n)
      filename = "def_modules_split_files_#{i}.ex"
      File.write!(filename, content)
    end
  end
end
