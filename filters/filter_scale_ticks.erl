%%
%%
%%

-module(filter_scale_ticks).

-export([
    scale_ticks/3
]).

-include_lib("zotonic.hrl").

scale_ticks(Module, Domain, Context) ->
    Module:ticks(Domain, Context).
