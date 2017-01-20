%%
%%
%%

-module(filter_scale_linear).

-include_lib("zotonic.hrl").

-export([scale_linear/4]).

%%
scale_linear(Measure, [Min, Max],[MinAllowed,MaxAllowed],  _Context) ->
    (MaxAllowed - MinAllowed) * (Measure - Min) / (Max - Min) + MinAllowed.

