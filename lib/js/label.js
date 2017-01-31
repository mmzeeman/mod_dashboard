(function(d3) {
    d3.zviz = d3.zviz ? d3.zviz : {};

    d3.zviz.label = function module() {
        var klass = "";
            getText = function(d) { return d.text };

        function exports(_selection) {
            _selection.each(function(_data) {
                 var label = d3.select(this)
                    .selectAll(tag)
                    .data([_data]);

                label.enter().append(tag)
                    .transition()
                    .attr("class", klass)
                    .text(function(d) { return getText(d) });
            });
        };

        exports.class = function(_klass) {
            if(!arguments.length) return klass;
            klass = _klass;
            return this;
        }

        exports.text = function(_getText) {
            if(!arguments.length) return getText;
            getText = _getText;
            return this;
        }

        return exports;
    }
})(d3);