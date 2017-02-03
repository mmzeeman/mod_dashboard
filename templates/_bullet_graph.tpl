{% with margin_top|default:3, margin_bottom|default:3, 
    margin_left|default:3, margin_right|default:3 as margin_top, margin_bottom, margin_left, margin_right  %}
{% with width + margin_left + margin_right, height + margin_top + margin_bottom as width, height %}
{% with height - margin_top - margin_bottom  as bg_height %}
{% with width - margin_left - margin_right as bg_width %}
<svg class="bullet-graph" width="{{ width }}" height="{{ height }}">
    <g class="container-group" transform="translate({{ margin_left }},{{ margin_top }})">
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
        {% if nr_ticks %}
            {% with range | tick_step:nr_ticks as step %}
            {% with range | first as start %}
            {% with range | last as stop %}
            {% for tick_value in start|range:stop:step %}
                <g class="tick" transform="translate({{ tick_value|scale_linear:range:[0,bg_width] }},0)" style="opacity: 1;">
                    <line y1="{{ bg_height }}" y2="{{ bg_height * 7 / 6 }}"></line>
                    {% if tick_label %}
                         <text text-anchor="middle" dy="1em" y="{{ bg_height * 7 / 6 }}">
                         {% if tick_template %}
                             {% include tick_template value=tick_value %} 
                         {% else %}
                             {{ tick_value }}
                         {% endif %}</text>
                     {% endif %}
                </g>
            {% endfor %}
            {% endwith %}
            {% endwith %}
            {% endwith %}
        {% endif %}
    </g>
</svg>
{% endwith %}
{% endwith %}
{% endwith %}
{% endwith %}