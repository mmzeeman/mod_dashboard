(function(d3) {
    d3.zviz = d3.zviz ? d3.zviz : {};

    d3.zviz.sparkline = function module() {
        var margin = {top: 4, right: 4, bottom: 4, left: 4},
            width = 90, 
            height = 12,
            interpolate = "monotone",
            hilite_low = false,
            hilite_high = false,
            hilite_first = false,
            hilite_last = true,
            getX = function(d) { return d.x; },
            getY = function(d) { return d.y; },
            getData = function(d) { return d; };

        function exports(_selection) {
            _selection.each(function(_data) {
                var first_data = [],
                    last_data = [],
                    low_data = [],
                    high_data = [];

                var data = getData(_data);

                var sparkline_width = width - margin.left - margin.right;
                var sparkline_height = height - margin.top - margin.bottom;

                var x = d3.scale.linear().range([0, sparkline_width]);
                var y = d3.scale.linear().range([sparkline_height, 0]);

                var line = d3.svg.line()
                    .interpolate(interpolate)
                    .x(function(d, i) { return x(getX(d, i)); })
                    .y(function(d, i) { return y(getY(d, i)); })

                x.domain(d3.extent(data, getX));
                y.domain(d3.extent(data, getY));

                var svg = d3.select(this)
                    .selectAll("svg")
                    .data([data]);

                svg.enter().append("svg")
                    .classed("z_sparkline", true)
                    .append("g").classed("group", true)
                    .append("path").classed("sparkline", true);

                svg.attr({width: width, height: height});
                svg.select(".group")
                    .attr({transform: "translate(" + margin.left + "," + margin.top + ")"});

                /* The line */
                var sparkline = svg.select(".sparkline")
                    .attr("d", line)
                    .attr("transform", null)
                    .transition()
                        .duration(500)
                        .ease("linear")
                        .attr("transform", "translate(0,0)")


                /* Indicator for the first value */
                if(hilite_first) 
                    first_data = [{d: data[0], i: 0}];

                var first = svg.select(".group")
                    .selectAll(".spark-first")
                    .data(first_data);
                first.enter().append('circle')
                    .classed("spark-first", true).attr("r", 2);
                first.exit().remove();
                first.attr("cx", function(d) { return x(getX(d.d, d.i)); })
                    .attr("cy", function(d, i) { return y(getY(d.d, d.i)); });

                /* Indicator for the first value */
                if(hilite_last) 
                    last_data = [{d: data[data.length-1], i: data.length-1}]

                var last = svg.select(".group")
                    .selectAll(".spark-last")
                    .data(last_data);
                last.enter().append('circle')
                    .classed("spark-last", true).attr("r", 2);
                last.exit().remove();

                last.attr("cx", function(d) { return x(getX(d.d, d.i)); })
                    .attr("cy", function(d, i) { return y(getY(d.d, i.i)); });

                /* Lows */
                if(hilite_low) {
                    var i, low = y.domain()[0];
                    for(i=0; i<data.length-1; i++) {
                        if(getY(data[i], i) == low) {
                            low_data.push({d: data[i], i: i});
                        }
                    }
                }

                var lows = svg.select(".group")
                    .selectAll(".spark-low")
                    .data(low_data);
                lows.enter().append('circle')
                    .classed("spark-low", true).attr("r", 2);
                lows.exit().remove();

                lows.attr("cx", function(d) { return x(getX(d.d, d.i)); })
                    .attr("cy", function(d, i) { return y(getY(d.d, i.i)); });

                /* Highs */
                if(hilite_high) {
                    var i, high = y.domain()[1];
                    for(i=0; i<data.length-1; i++) {
                        if(getY(data[i], i) == high) {
                            low_data.push({d: data[i], i: i});
                        }
                    }
                }

                var highs = svg.select(".group")
                    .selectAll(".spark-high")
                    .data(low_data);
                highs.enter().append('circle')
                    .classed("spark-high", true).attr("r", 2);
                highs.exit().remove();

                highs.attr("cx", function(d) { return x(getX(d.d, d.i)); })
                    .attr("cy", function(d, i) { return y(getY(d.d, i.i)); });
            })
        }

        exports.x = function(_x) {
            if(!arguments.length) return getX;
            getX = _x;
            return this;
        }

        exports.y = function(_y) {
            if(!arguments.length) return getY;
            getY = _y;
            return this;
        }

        exports.data = function(_data) {
            if(!arguments.length) return getData;
            getData = _data;
            return this;
        }

        exports.width = function(_v) {
            if(!arguments.length) return width;
            width = _v;
            return this;
        }

        exports.height = function(_v) {
            if(!arguments.length) return height;
            height = _v;
            return this;
        }

        exports.hilite_first = function(_v) {
            if(!arguments.length) return hilite_first;
            hilite_first = _v;
            return this;
        }

        exports.hilite_last = function(_v) {
            if(!arguments.length) return hilite_last;
            hilite_last = _v;
            return this;
        }

        exports.hilite_high = function(_v) {
            if(!arguments.length) return hilite_high;
            hilite_high = _v;
            return this;
        }

        exports.hilite_low = function(_v) {
            if(!arguments.length) return hilite_low;
            hilite_low = _v;
            return this;
        }

        exports.interpolate = function(_interpolate) {
            if(!arguments.length) return interpolate;
            interpolate = _interpolate;
            return this;
        }

        return exports;
    }
})(d3);
