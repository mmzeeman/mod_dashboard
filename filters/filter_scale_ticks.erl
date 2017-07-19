%%
%%
%%

-module(filter_scale_ticks).

-export([
    scale_ticks/4
]).

-include_lib("zotonic.hrl").

scale_ticks(ScaleModule, NrTicks, Domain, _Context) ->
    ticks(ScaleModule, NrTicks, Domain).

ticks(Module, NrTicks, Domain) ->
    ?DEBUG({Module, NrTicks, Domain}),
    Module:ticks(NrTicks, Domain).
