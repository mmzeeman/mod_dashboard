{% with margin_top|default:3, margin_bottom|default:3,
    margin_left|default:3, margin_right|default:3 as margin_top, margin_bottom, margin_left, margin_right  %}
{% with width + margin_left + margin_right, height + margin_top + margin_bottom as width, height %}
{% with height - margin_top - margin_bottom  as bg_height %}
{% with width - margin_left - margin_right as bg_width %}

<svg class="bar-chart" width="{{ width }}" height="{{ height }}">
    <g class="container-group" transform="translate({{ margin_left }},{{ margin_top }})">
        {% with values | list_max:y_property as max %}
        {% with [0, max] as range %}
             {% for tick in scale_x | scale_ticks:domain_x %}
                 {% with values | get_value:tick:x_property:y_property as value %}
                 {% with value | scale_linear:range:[0,bg_height]  + (1/2) as bar_height %}
                     {% if bar_href %}<a xlink:href="{% include bar_href forloop=forloop value=tick %}">{% endif %}
                         <rect x={{ forloop.counter0 * barwidth }} y ={{ bg_height - bar_height }} height="{{ bar_height }}" width="{{ barwidth - 1 }}" 
                              {% if bar_attrs %}{% include bar_attrs forloop=forloop value=tick  bar_prop_extra=bar_prop_extra %}{% endif %}></rect>
                        <text x="{{ forloop.counter0 * barwidth + (barwidth/2) }}" y="{{ bg_height - bar_height }}"  text-anchor="middle" dy="1em">{{ value }}</text>
                    {% if bar_href %}</a>{% endif %}
                 {% endwith %}
                 {% endwith %}
             {% endfor %}
             {% if bar_tick %}
                 {% for v in values %}
                     <text fill="#000" x="{{ forloop.counter0 * barwidth + (barwidth/2) }}" y="{{ bg_height }}"  text-anchor="middle" dy="1em">{% include bar_tick value=tick %}</text>
                 {% endfor %}
             {% endif %}
        {% endwith %}
        {% endwith %}
    </svg>
</svg>

{% endwith %}
{% endwith %}
{% endwith %}
{% endwith %}