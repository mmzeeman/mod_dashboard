{% with margin|default:3 as margin %}
{% with height - margin - margin  as bg_height %}
{% with width - margin - margin as bg_width %}
<svg class="bullet-graph" width="{{ width }}" height="{{ height }}">
    <g class="container-group" transform="translate({{ margin }},{{ margin }})">
        {% if ranges %}
        <g class="ranges-group ranges">
            {% for r in ranges %}
                <rect class="range s{{ forloop.counter0 }}" 
                    width="{{ r|scale_linear:range:[0,bg_width]}}" 
                    height="{{ bg_height }}" x="0"></rect>
            {% endfor %}
        </g>
        {% endif %}
        <rect class="measure s0" 
            width="{{ measure|scale_linear:range:[0,bg_width] }}" 
            height="{{ bg_height / 3 }}" 
            x="0" 
            y="{{ bg_height / 3 }}"></rect>
        {% if markers %}
        <g class="markers-group markers">
            {% for m in markers %}
                {% with m|scale_linear:range:[0,bg_width] as marker_pos %}
                <line class="marker" 
                    x1="{{ marker_pos }}" x2="{{ marker_pos }}" 
                    y1="{{ bg_height / 6 }}" 
                    y2="{{ bg_height * 5 / 6}}"></line>
                {% endwith %}
            {% endfor %}
        {% endif %}
    </g>
</svg>
{% endwith %}
{% endwith %}
{% endwith %}