%%
%%
%%

-module(filter_scale_ticks).

-export([
    scale_ticks/3
]).

-include_lib("zotonic.hrl").

scale_ticks(ScaleModule, Domain, _Context) ->
    ticks(ScaleModule, Domain).

ticks(Module, Domain) ->
    Module:ticks(Domain).
