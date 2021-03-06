{module, 'Elixir.CompileDataBeam_1'}.  %% version = 0

{exports, [{'__info__',1},{module_info,0},{module_info,1},{test_beam_data,0}]}.

{attributes, []}.

{labels, 15}.


{function, '__info__', 1, 2}.
  {label,1}.
    {line,[{location,"compile_data_beam_1.erl",13}]}.
    {func_info,{atom,'Elixir.CompileDataBeam_1'},{atom,'__info__'},1}.
  {label,2}.
    {test,is_atom,{f,1},[{x,0}]}.
    {select_val,{x,0},
                {f,1},
                {list,[{atom,functions},
                       {f,3},
                       {atom,md5},
                       {f,4},
                       {atom,compile},
                       {f,5},
                       {atom,attributes},
                       {f,6},
                       {atom,module},
                       {f,7},
                       {atom,macros},
                       {f,8},
                       {atom,deprecated},
                       {f,8}]}}.
  {label,3}.
    {move,{literal,[{test_beam_data,0}]},{x,0}}.
    return.
  {label,4}.
    {move,{atom,md5},{x,1}}.
    {move,{atom,'Elixir.CompileDataBeam_1'},{x,0}}.
    {line,[{location,"compile_data_beam_1.erl",23}]}.
    {call_ext_only,2,{extfunc,erlang,get_module_info,2}}.
  {label,5}.
    {move,{atom,compile},{x,1}}.
    {move,{atom,'Elixir.CompileDataBeam_1'},{x,0}}.
    {line,[{location,"compile_data_beam_1.erl",20}]}.
    {call_ext_only,2,{extfunc,erlang,get_module_info,2}}.
  {label,6}.
    {move,{atom,attributes},{x,1}}.
    {move,{atom,'Elixir.CompileDataBeam_1'},{x,0}}.
    {line,[{location,"compile_data_beam_1.erl",17}]}.
    {call_ext_only,2,{extfunc,erlang,get_module_info,2}}.
  {label,7}.
    {move,{atom,'Elixir.CompileDataBeam_1'},{x,0}}.
    return.
  {label,8}.
    {move,nil,{x,0}}.
    return.


{function, test_beam_data, 0, 10}.
  {label,9}.
    {line,[{location,"compile_data_beam_1.erl",26}]}.
    {func_info,{atom,'Elixir.CompileDataBeam_1'},{atom,test_beam_data},0}.
  {label,10}.
    {move,{literal,#{a => <<"a">>,b => <<"b">>}},{x,0}}.
    return.


{function, module_info, 0, 12}.
  {label,11}.
    {line,[]}.
    {func_info,{atom,'Elixir.CompileDataBeam_1'},{atom,module_info},0}.
  {label,12}.
    {move,{atom,'Elixir.CompileDataBeam_1'},{x,0}}.
    {line,[]}.
    {call_ext_only,1,{extfunc,erlang,get_module_info,1}}.


{function, module_info, 1, 14}.
  {label,13}.
    {line,[]}.
    {func_info,{atom,'Elixir.CompileDataBeam_1'},{atom,module_info},1}.
  {label,14}.
    {move,{x,0},{x,1}}.
    {move,{atom,'Elixir.CompileDataBeam_1'},{x,0}}.
    {line,[]}.
    {call_ext_only,2,{extfunc,erlang,get_module_info,2}}.
