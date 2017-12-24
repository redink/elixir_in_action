-module(big_big_transform).

-export([parse_transform/2]).

parse_transform(AST, _) ->
    io:format("--- erlang term byte: ~p~n", [erlang_term:byte_size(AST)]),
    AST.
