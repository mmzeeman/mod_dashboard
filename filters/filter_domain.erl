%%
%%
%%

-module(filter_domain).

-export([
    domain/2,
    domain/3
]).

-export([
    ceil/1,
    floor/1
]).

-include_lib("zotonic.hrl").

domain([Min, Max], _Context) ->
    domain1(Min, Max, 10).

domain([Min, Max], Count, _Context) ->
    domain1(Min, Max, Count).

domain1(Start, Stop, Count) when is_float(Start) ->
    domain1(floor(Start), Stop, Count);
domain1(Start, Stop, Count) when is_float(Stop) ->
    domain1(Start, ceil(Stop), Count);
domain1(Start, Stop, Count) ->
    case filter_tick_step:get_tick_step(Start, Stop, Count) of
        0 -> [Start, Stop];
        0.0 -> [Start, Stop];
        Step ->
            Start1 = floor(Start/Step) * Step,
            Stop1 = ceil(Stop/Step) * Step,

            Step1 = filter_tick_step:get_tick_step(Start1, Stop1, Count),
            [floor(Start / Step1) * Step1, ceil(Stop / Step1) * Step1]
    end.


ceil(X) ->
     T = trunc(X),
      if X > T -> T + 1
      ; true  -> T
     end.

floor(X) ->
     T = trunc(X),
     if X < T -> T - 1
      ; true  -> T
     end.