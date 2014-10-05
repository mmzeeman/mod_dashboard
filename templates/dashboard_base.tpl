<!DOCTYPE html>
<html lang="{{ z_language|default:"en"|escape }}">
  <head>
    <meta charset="utf-8">

    <title>{% block title %}{% endblock %}</title>

    <link rel="icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    {% lib 
        "bootstrap-3/css/bootstrap.min.css"

        "css/dashboard.css"
    %}

    {% block head_extra %}
    {% endblock %}
  </head>

  <body>
      {% include "_js_include_jquery.tpl" %}
      {% include "_dashboard_js_include.tpl" %} 

      <div class="container-fluid">
          {% block content %}{% endblock %}
          <div class="navbar navbar-default navbar-fixed-bottom">
              <div class="container-fluid">
                  <a class="navbar-brand" href="#">{% block title %}{% endblock %}</a>

                  <button class="btn navbar-btn">{_ Freeze Data _}</button>

                  <div class="btn-group pull-right">
                      <button class="btn navbar-btn">{_ Help _}</button>
                  </div>
              </div>
          </div>
      </div>
  {% script %}
  </body>
</html>


