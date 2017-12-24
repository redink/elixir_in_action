-module('Elixir.CompileDataBeam_1').

-compile(no_auto_import).

-export(['__info__'/1, test_beam_data/0]).

-spec '__info__'(attributes | compile | functions |
		 macros | md5 | module | deprecated) -> atom() |
							[{atom(), any()} |
							 {atom(), byte(),
							  integer()}].

'__info__'(module) -> 'Elixir.CompileDataBeam_1';
'__info__'(functions) -> [{test_beam_data, 0}];
'__info__'(macros) -> [];
'__info__'(attributes) ->
    erlang:get_module_info('Elixir.CompileDataBeam_1',
			   attributes);
'__info__'(compile) ->
    erlang:get_module_info('Elixir.CompileDataBeam_1',
			   compile);
'__info__'(md5) ->
    erlang:get_module_info('Elixir.CompileDataBeam_1', md5);
'__info__'(deprecated) -> [].

test_beam_data() -> #{a => <<"a">>, b => <<"b">>}.
