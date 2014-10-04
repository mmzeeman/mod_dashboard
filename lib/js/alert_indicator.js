(function(d3) {
    d3.zviz = d3.zviz ? d3.zviz : {};

    d3.zviz.alert_indicator = function module() {
        var margin = {top: 2, right: 2, bottom: 2, left: 2},
            width = 18, 
            height = 18,
            radius = 6,
            color = d3.hsl("red");

        function exports(_selection) {
            _selection.each(function(_data) {
                var alert_width = width - margin.left - margin.right;
                var alert_height = height - margin.top - margin.bottom;

                var x = d3.scale.linear().range([0, alert_width]);
                var y = d3.scale.linear().range([alert_width, 0]);

                x.domain([0,100]);
                y.domain([0,100]);

                var svg = d3.select(this)
                    .selectAll(".alert-indicator")
                    .data([_data]);

                var container = svg.enter()
                   .append("svg").classed("alert-indicator", true)
                   .append("g");

                svg.transition().attr({width: width, height: height});

                svg.select("g")
                    .transition()
                    .attr({transform: "translate(" + margin.left + "," + margin.top + ")"});

                var indicator = svg.select("g")
                    .selectAll(".indicator")
                    .data(_data);

                indicator.enter().append("circle")
                    .classed("indicator", true)
                    .attr("r", radius)
                    .style({'stroke': 'none', 'fill': color});

                indicator.exit().remove();

                indicator.attr("cx", x(50))
                    .attr("cy", x(50))
                    .style('fill', function(d) { return color.brighter(d) });
            })
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

        exports.radius = function(_v) {
            if(!arguments.length) return radius;
            radius = _v;
            return this;
        }

        return exports;
    }
})(d3);
