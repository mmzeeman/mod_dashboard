%%
%%
%%

-module(filter_flatten).

-export([flatten/2]).

flatten(undefined, _Context) -> undefined;
flatten(ListOfLists, _Context) -> lists:flatten(ListOfLists).