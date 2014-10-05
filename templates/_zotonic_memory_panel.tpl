<h4 class="text-muted">Erlang VM Memory</h4>
<table>
    <tr>
        <td class="text-muted" colspan="2">Last 3 Hours</td>
        <td class="text-muted">Metric</td>
    </tr>
    <tr>
        <td id="memory_processes"></td>
        <td id="memory_processes_alert"></td>
        <td>Processes</td>
        <td id="memory_processes_bullet"></td>
        <td>34%</td>
    </tr>
    <tr>
        <td id="memory_ets"></td>
        <td id="memory_ets_alert"></td>
        <td>Ets</td>
        <td id="memory_ets_bullet"></td>
        <td>12%</td>
    </tr>
    <tr>
        <td id="memory_binary"></td>
        <td id="memory_binary_alert"></td>
        <td>Binary</td>
        <td id="memory_binary_bullet"></td>
        <td>12%</td>
    </tr>
    <tr>
        <td id="memory_atom"></td>
        <td id="memory_atom_alert"></td>
        <td>Atom</td>
        <td id="memory_atom_bullet"></td>
        <td>12%</td>
    </tr>
    <tr>
        <td id="memory_code"></td>
        <td id="memory_code_alert"></td>
        <td>Code</td>
        <td id="memory_code_bullet"></td>
        <td>12%</td>
    </tr>
    <tr>
        <td id="memory_total"></td>
        <td id="memory_total_alert"></td>
        <td>Total</td>
        <td id="memory_total_bullet"></td>
        <td>12%</td>
    </tr>
</table>
{% javascript %}


        _line = d3.zviz.sparkline().width(150).height(18).hilite_last(false);
        var data = [ {x:  0, y: 145},
                     {x:  1, y: 136},
                     {x:  2, y: 145},
                     {x:  3, y: 136},
                     {x:  4, y: 127},
                     {x:  5, y: 136},
                     {x:  6, y: 145},
                     {x:  7, y: 136},
    {x:  8, y: 136},
    {x:  9, y: 172},
    {x: 10, y: 127},
    {x: 11, y: 136},
    {x: 12, y: 127},
    {x: 13, y: 127},
    {x: 14, y: 172},
    {x: 15, y: 172},
    {x: 16, y: 181},
    {x: 17, y: 172},
    {x: 18, y: 200},
    {x: 19, y: 127},
    {x: 20, y: 136},
    {x: 21, y: 118},
    {x: 22, y: 109},
    {x: 23, y: 100},
    {x: 24, y: 128}
];
    d3.select("#memory_processes").datum(data).call(_line);

    var memory_processes_bullet = d3.zviz.bullet_graph().show_axis(false);
    var bullet_data = [{
        ranges: [0, 10, 20, 100],
        markers: [40],
        measures: [75]
    }];
    d3.select("#memory_processes_bullet")
        .datum(bullet_data[0])
        .call(memory_processes_bullet);

    var memory_ets_alert = d3.zviz.alert_indicator();
    d3.select("#memory_ets_alert").datum([1.6]).call(memory_ets_alert);

    var memory_ets_bullet = d3.zviz.bullet_graph().show_axis(false);
    var bullet_data = [{
        ranges: [0, 10, 20, 100],
        markers: [40],
        measures: [23]
    }];
    d3.select("#memory_ets_bullet")
        .datum(bullet_data[0])
        .call(memory_ets_bullet);
{% endjavascript %}
