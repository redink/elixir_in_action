## define modules

As we can see, the beam file of `Elixir.CompileDataBeamDefineFunctions.beam` takes up 3.7M, it is too big for EVM. It can easily lead to compile and load problems. Now that we can define functions, why not define mulit-modules?

### implementation through hash keys

We can split the keys into given number blocks through hash the keys, just like:
