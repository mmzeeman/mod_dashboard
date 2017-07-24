%%
%% TODO: push to zotonic
%%

-module(filter_to_datetime).

-export([to_datetime/2]).

to_datetime(Value, Context) ->
    z_datetime:to_datetime(Value, Context).
