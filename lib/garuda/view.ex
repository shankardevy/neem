defmodule Garuda.View do
  defmacro __using__(opts) do
    path = Keyword.fetch!(opts, :path)
    for template <- Path.wildcard(path <> "/*.eex") do
      base_path =  Path.basename(template, ".eex")
      template_content = File.read!(template)
      quote bind_quoted: [base_path: base_path,
            template: template_content] do
        def render(unquote(base_path), var!(assigns)) do
          EEx.eval_string(unquote(template), var!(assigns))
        end
      end
    end
  end
end
