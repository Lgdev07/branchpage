defmodule BranchPage.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: System.get_env("MIX_ENV") == :prod,
      deps: deps()
    ]
  end

  defp deps do
    []
  end
end
