{% with margin_top|default:3, margin_bottom|default:3, 
    margin_left|default:3, margin_right|default:3 as margin_top, margin_bottom, margin_left, margin_right  %}
{% with width + margin_left + margin_right, height + margin_top + margin_bottom as width, height %}
{% with height - margin_top - margin_bottom  as bg_height %}
{% with width - margin_left - margin_right as bg_width %}
<svg class="bar-chart" width="{{ width }}" height="{{ height }}">
    <g class="container-group" transform="translate({{ margin_left }},{{ margin_top }})">
        {% with values | list_max as max %}
             {% for v in values %}
                <rect x={{ forloop.counter0 * barwidth }} y ={{ height -v }} height="{{  v }}" width="{{ barwidth - 1 }}" 
                    {% if bar_attrs %}{% include bar_attrs forloop=forloop %}{% endif %}></rect>
                <text x="{{ forloop.counter0 * barwidth + (barwidth/2) }}" y="{{ height -v }}"  text-anchor="middle" dy="1em">{{ v }}</text>
             {% endfor %}
        {% endwith %}
    </svg>
</svg>
{% endwith %}
{% endwith %}
{% endwith %}
{% endwith %}