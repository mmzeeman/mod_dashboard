%%
%%
%%

-module(filter_scale_linear).

-include_lib("zotonic.hrl").

-export([scale_linear/4]).

%%
scale_linear(Measure, [MinAllowed,MaxAllowed], [Min, Max],  _Context) ->
    (MaxAllowed - MinAllowed) * (Measure - Min) / (Max - Min) + MinAllowed.



