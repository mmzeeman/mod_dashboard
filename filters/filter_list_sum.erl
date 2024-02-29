%%
%%
%%

-module(filter_list_sum).

-export([ 
    list_sum/2
]).

-include_lib("zotonic.hrl").

%%
list_sum(#search_result{result=List}, Context) ->
    list_sum(List, Context);
list_sum(List,  _Context) ->
    lists:sum(List).


