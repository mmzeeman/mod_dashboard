%%
%%
%%

-module(filter_tick_step).

-include_lib("zotonic.hrl").

-export([
    tick_step/3,
    get_tick_step/3
]).

-define(E10, 7.0710678118654755). % sqrt(50)
-define(E5, 3.1622776601683795). % sqrt(10)
-define(E2, 1.4142135623730951). %  sqrt(2)

-define(LN10, 2.302585092994046).

tick_step([Start, Stop], Count, _Context) ->
    get_tick_step(Start, Stop, Count).

get_tick_step(Start, Stop, Count) ->
    ?DEBUG({Start, Stop, Count}),
    case abs(Stop - Start) / lists:max([0, Count]) of
        0 -> 1;
        0.0 -> 1.0;
        Step0 ->
            Step1 = math:pow(10, filter_domain:floor(math:log(Step0) / ?LN10)),
            Step = step(Step0, Step1),
            case Stop < Start of
                true -> -Step;
                false -> Step 
            end
    end.

%%
%% Helpers
%%

step(Step0, 0) -> 0;
step(Step0, Step1) ->
    case Step0 / Step1 of
        Error when Error >= ?E10 -> Step1 * 10;
        Error when Error >= ?E5 -> Step1 * 5;
        Error when Error >= ?E2 -> Step1 * 2;
        _ -> Step1 
    end.

    