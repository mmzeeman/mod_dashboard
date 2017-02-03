%%
%%
%%

-module(filter_ticks).

-export([
    ticks/4
]).

-include_lib("zotonic.hrl").

ticks(Start, End, Step, _Context) -> 
    ticks(Start, End, Step).

ticks(Start, End, _Step) when Start =:= undefined orelse End =:= undefined -> [];
ticks(Start, End, Step) when Step =:= 0 orelse Step =:= 0.0 -> [Start, End];
ticks(Start, End, Step) when End >= Start andalso Step > 0 -> seq(Start, End, Step);
ticks(Start, End, Step) when End =< Start andalso Step < 0 -> lists:reverse(seq(End, Start, -Step));
ticks(Start, End, _Step) -> [Start, End].

seq(Start, Stop, Step) ->
    seq(Start, Stop, Step, []).

seq(Start, Stop, _Step, Acc) when Start > Stop -> lists:reverse(Acc);
seq(Start, Stop, Step, Acc) -> 
    ?DEBUG({Start, Stop, Step}),
    seq(Start + Step, Stop, [Start|Acc]).



