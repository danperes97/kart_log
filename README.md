# F1Championship

## Description
This is an Elixir application, to read a race log and give results about it.

## Installation

You should have Elixir installed in your machine, for more informations how to do it
go to the official documentation: https://elixir-lang.org/install.html

## Configuration

First you have to compile the project.
```
  cd f1_championship
  mix compile
```

After compiled, you can run
```
  iex -S mix
```

This will open the REPL of Elixir language.
Inside of it, you can run the F1Championship Features.

## Features

To check the final results of the race you can do:
```elixir
  RaceAnalyzer.results
```

This will bring to you all the results.

To check who completed the race
```elixir
  RaceAnalyzer.race_completed
  
  [
  %{
    average: 44.321,
    id: 38,
    lap_number: 4,
    lap_time: ~N[0000-01-01 00:01:02.787],
    name: "F.MASSA",
    time: ~N[0000-01-01 23:52:17.003]
  },
  %{
    average: 44.118,
    id: 2,
    lap_number: 4,
    lap_time: ~N[0000-01-01 00:01:03.076],
    name: "K.RAIKKONEN",
    time: ~N[0000-01-01 23:52:22.12]
  },...
  ]
```

And for uncompleted one's
```elixir
  RaceAnalyzer.race_uncompleted
  
  [
  %{
    average: 28.435,
    id: 11,
    lap_number: 2,
    lap_time: ~N[0000-01-01 00:01:37.864],
    name: "S.VETTEL",
    time: ~N[0000-01-01 23:53:39.66]
  }
]
```

You can check total time of especific driver, just passing your id, it will give to you in seconds.
```elixir
  RaceAnalyzer.driver_total_time(38)
  128
```

You also can find out who made the best lap of the race, (And yeah it returns R.Barrichello haha)
```elixir
  RaceAnalyzer.best_lap(:race)
  %{
    average: 43.48,
    id: 33,
    lap_number: 2,
    lap_time: ~N[0000-01-01 00:01:04.002],
    name: "R.BARRICHELLO",
    time: ~N[0000-01-01 23:50:14.86]
  }

```

You can find out the best lap of each driver
```elixir
  RaceAnalyzer.best_lap(:drivers)
  
  [
  %{
    average: 43.48,
    id: 33,
    lap_number: 2,
    lap_time: ~N[0000-01-01 00:01:04.002],
    name: "R.BARRICHELLO",
    time: ~N[0000-01-01 23:50:14.86]
  },
  %{
    average: 41.528,
    id: 15,
    lap_number: 2,
    lap_time: ~N[0000-01-01 00:01:07.011],
    name: "F.ALONSO",
    time: ~N[0000-01-01 23:50:37.987]
  },
  %{
    average: 44.118,
    id: 2,
    lap_number: 4,
    lap_time: ~N[0000-01-01 00:01:03.076],
    name: "K.RAIKKONEN",
    time: ~N[0000-01-01 23:52:22.12]
  },...
  ]
  
```

You can find out the average per driver
```elixir
RaceAnalyzer.total_average(:drivers)
[
  %{name: "F.MASSA", total_average: 176.98},
  %{name: "R.BARRICHELLO", total_average: 173.87},
  %{name: "K.RAIKKONEN", total_average: 174.51},
  %{name: "M.WEBBER", total_average: 172.77},
  %{name: "F.ALONSO", total_average: 152.26},
  %{name: "S.VETTEL", total_average: 77.24}
]

```

Time after winner
```elixir
RaceAnalyzer.time_after_winner(:drivers)
[
  %{name: "K.RAIKKONEN", time_after_winner: "5 sec"},
  %{name: "R.BARRICHELLO", time_after_winner: "5 sec"},
  %{name: "F.ALONSO", time_after_winner: "49 sec"},
  %{name: "M.WEBBER", time_after_winner: "8 sec"},
  %{name: "S.VETTEL", time_after_winner: "82 sec"}
]
```

And of course, the winner
```elixir
  RaceAnalyzer.winner
```

## To Do
- Complete automatized tests
- Refactor code
- Add a parameter to choose other log file.
