defmodule PaperTrail.Mixfile do
  use Mix.Project

  def project do
    [
      app: :paper_trail,
      version: "0.7.7",
      elixir: "~> 1.4",
      description: description(),
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      elixirc_paths: elixirc_paths(Mix.env),
      package: package(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:logger, :postgrex, :ecto]
    ]
  end

  defp deps do
    [
      {:ecto, ">= 2.1.0"},
      {:poison, ">= 3.1.0 or >= 2.0.0"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:postgrex, "~> 0.13.0"}
    ]
  end

  defp description do
     """
     Track and record all the changes in your database. Revert back to anytime in history.
     """
  end

  defp package do
    [
      name: :paper_trail,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Izel Nakri"],
      licenses: ["MIT License"],
      links: %{
        "GitHub" => "https://github.com/izelnakri/paper_trail",
        "Docs" => "https://hexdocs.pm/paper_trail/PaperTrail.html"
      }
    ]
  end
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
