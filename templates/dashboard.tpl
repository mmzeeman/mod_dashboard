{% extends "dashboard_base.tpl" %}

{% block title %}{_ Site Dashboard _}{% endblock %}

{% block content %}

<div class="row">
    <div class="col-md-6">
        <div class="container-fluid">
            {% include "_zotonic_memory_panel.tpl" %}
        </div>
    </div>
    <div class="col-md-4">
        <div class="container-fluid">
            {% include "_os_load_panel.tpl" %}
        </div>
    </div>
</div>

{% endblock %}

