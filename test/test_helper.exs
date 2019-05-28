ExUnit.start()

Mox.defmock(Tddex.RunnerMock, for: Tddex.Runner)
Application.put_env(:tddex, :runner, Tddex.RunnerMock)
