# Knights Travails

Shows the least number of moves needed for a chess knight to move from one position to another.

## Installation and Usage

```
$ git clone https://github.com/adlersantos/knights_travails.git
$ cd knights_travails
```

Now run your favorite Ruby interpreter and do the following:
```
> load './lib/knights_travails.rb'
> KnightsTravails.find_path([6, 7], [7, 1])
=> [[6, 7], [7, 5], [6, 3], [7, 1]]
```

The chessboard is represented as a 8 x 8 grid with x- and y-values ranging from 0 to 7. The method `KnightsTravails.find_path(start, end)` will give you the shortest path a knight can take from start to end.

## Contributing

1. Fork it ( http://github.com/adlersantos/knights_travails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
