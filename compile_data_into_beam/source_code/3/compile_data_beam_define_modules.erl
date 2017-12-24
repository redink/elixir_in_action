-module('Elixir.CompileDataBeamDefineModules').

-compile(no_auto_import).

-export(['__info__'/1, get/1]).

-spec '__info__'(attributes | compile | functions |
		 macros | md5 | module | deprecated) -> atom() |
							[{atom(), any()} |
							 {atom(), byte(),
							  integer()}].

'__info__'(module) ->
    'Elixir.CompileDataBeamDefineModules';
'__info__'(functions) -> [{get, 1}];
'__info__'(macros) -> [];
'__info__'(attributes) ->
    erlang:get_module_info('Elixir.CompileDataBeamDefineModules',
			   attributes);
'__info__'(compile) ->
    erlang:get_module_info('Elixir.CompileDataBeamDefineModules',
			   compile);
'__info__'(md5) ->
    erlang:get_module_info('Elixir.CompileDataBeamDefineModules',
			   md5);
'__info__'(deprecated) -> [].

get(Vk@1) ->
    erlang:apply(module_name(erlang:phash2(Vk@1, 16)), get,
		 [Vk@1]).

module_name(0) ->
    'Elixir.CompileDataBeamDefineModules.0';
module_name(1) ->
    'Elixir.CompileDataBeamDefineModules.1';
module_name(2) ->
    'Elixir.CompileDataBeamDefineModules.2';
module_name(3) ->
    'Elixir.CompileDataBeamDefineModules.3';
module_name(4) ->
    'Elixir.CompileDataBeamDefineModules.4';
module_name(5) ->
    'Elixir.CompileDataBeamDefineModules.5';
module_name(6) ->
    'Elixir.CompileDataBeamDefineModules.6';
module_name(7) ->
    'Elixir.CompileDataBeamDefineModules.7';
module_name(8) ->
    'Elixir.CompileDataBeamDefineModules.8';
module_name(9) ->
    'Elixir.CompileDataBeamDefineModules.9';
module_name(10) ->
    'Elixir.CompileDataBeamDefineModules.10';
module_name(11) ->
    'Elixir.CompileDataBeamDefineModules.11';
module_name(12) ->
    'Elixir.CompileDataBeamDefineModules.12';
module_name(13) ->
    'Elixir.CompileDataBeamDefineModules.13';
module_name(14) ->
    'Elixir.CompileDataBeamDefineModules.14';
module_name(15) ->
    'Elixir.CompileDataBeamDefineModules.15'.
