%%
%%
%%

-module(filter_scale_linear).

-include_lib("zotonic.hrl").

-export([scale_linear/4]).

%%
scale_linear(Measure, [Min, Max],[MinAllowed,MaxAllowed],  _Context) ->
    case (Max - Min) + MinAllowed of
        0 -> 0;
        0.0 -> 0.0;
        Scale -> (MaxAllowed - MinAllowed) * (Measure - Min) / Scale
    end.

