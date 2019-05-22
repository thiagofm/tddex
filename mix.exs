defmodule Tddex.MixProject do
  use Mix.Project

  def project do
    [
      app: :tddex,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: "tddex strives to make testing frictionless and ergonomic as possible, an improved Guard(ruby).",
   ]
  end

  def package do
    %{
      licenses: ["MIT"],
      links: %{github: "https://github.com/thiagofm/tddex"}
    }
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    # TODO: Notify the user about this:
    # On Linux, FreeBSD and OpenBSD you need to install inotify-tools.
    # On Macos 10.14, you need run `open /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg` to compile `mac_listener`.
    [
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:file_system, "~> 0.2"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      # TODO: maybe only test?
      {:temp, "~> 0.4"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
