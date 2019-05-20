defmodule Tddex.MixProject do
  use Mix.Project

  def project do
    [
      app: :tddex,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
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
      {:file_system, "~> 0.2"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
