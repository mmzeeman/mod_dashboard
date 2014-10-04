(function(d3) {
    d3.zviz = d3.zviz ? d3.zviz : {};

    d3.zviz.bullet_graph = function module() {
        var margin = {top: 3, right: 6, bottom: 3, left: 6},
            width = 120, 
            height = 18,
            duration = 500,
            ticks = 7,
            show_axis = true,
            ease = "bounce";

        function exports(_selection) {
            _selection.each(function(_data) {
                var bg_width = width - margin.left - margin.right;
                var bg_height = height - margin.top - margin.bottom;

                var ranges = _data.ranges.slice().sort(d3.descending);
                var markers = _data.markers.slice().sort(d3.descending);
                var measures = _data.measures.slice().sort(d3.descending);
                
                console.log(measures);

                var x1 = d3.scale.linear()
                    .domain(d3.extent(ranges))
                    .range([0, bg_width]);

                var w1 = bulletWidth(x1);

                var axis = d3.svg.axis()
                    .scale(x1)
                    .ticks(ticks)
                    .orient('bottom');

                var svg = d3.select(this)
                    .selectAll(".bullet-graph")
                    .data([_data]);

                var container = svg.enter()
                   .append("svg").classed("bullet-graph", true)
                   .append("g").classed("container-group", true);
                
                var ranges_container = container.append("g").classed("ranges-group ranges", true);
                container.append("g").classed("axis-group axis", true);

                svg.transition().attr({width: width, height: height});

                svg.select(".container-group")
                    .transition()
                    .attr({transform: "translate(" + margin.left + "," + margin.top + ")"});

                if(show_axis) {
                    svg.select('.axis-group.axis')
                        .transition()
                        .ease(ease)
                        .attr({transform: 'translate(0,' + (bg_height) + ')'})
                        .call(axis);
                }

                // Update the range rects.
                var group = svg.select(".ranges-group");
                var range = group.selectAll("rect.range")
                    .data(ranges);

                range.enter().append("rect")
                    .attr("class", function(d, i) { return "range s" + i; })
                    .attr("width", w1)
                    .attr("height", bg_height)
                    .attr("x", 0)

                range.transition()
                    .duration(duration)
                    .attr("x", 0)
                    .attr("width", w1)
                    .attr("height", bg_height); 

                // Update the measure rects.
                var measure = group.selectAll("rect.measure")
                    .data(measures);

                measure.enter().append("rect")
                    .attr("class", function(d, i) { return "measure s" + i; })
                    .attr("width", w1)
                    .attr("height", bg_height / 3 )
                    .attr("x", 0)
                    .attr("y", bg_height / 3);

                measure.transition()
                    .duration(duration)
                    .attr("width", w1)
                    .attr("height", bg_height / 3)
                    .attr("x", 0)
                    .attr("y", bg_height / 3);

                // Update the marker lines.
                var marker = group.selectAll("line.marker")
                    .data(markers);

                marker.enter().append("line")
                    .attr("class", "marker")
                    .attr("x1", x1)
                    .attr("x2", x1)
                    .attr("y1", bg_height / 6)
                    .attr("y2", bg_height * 5 / 6)

                marker.transition()
                    .duration(duration)
                    .attr("x1", x1)
                    .attr("x2", x1)
                    .attr("y1", bg_height / 6)
                    .attr("y2", bg_height * 5 / 6); 
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

        exports.ticks = function(_v) {
            if(!arguments.length) return ticks;
            ticks = _v;
            return this;
        }

        exports.reverse = function(_v) {
            if(!arguments.length) return reverse;
            reverse = _v;
            return this;
        }

        exports.show_axis = function(_v) {
            if(!arguments.length) return show_axis;
            show_axis = _v;
            return this;
        }

        function bulletWidth(x) {
            var x0 = x(0);
            return function(d) {
                return Math.abs(x(d) - x0);
            };
        }

        return exports;
    }
})(d3);
