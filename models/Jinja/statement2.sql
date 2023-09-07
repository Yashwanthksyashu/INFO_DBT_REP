{# This is an example for variable #}
{#
{% set my_string = 'it is my first variable' %}
{% set my_second_string = 'it is my second variable' %}
{% set my_number = 100 %}

{{ my_string }}  {{my_second_string}} I want to write jinja for {{my_number}} years!


{% set my_animals = ['lemur','wolf','panther','tardigrade']%}

{{ my_animals[0]}}
{{ my_animals[1]}}
{{ my_animals[2]}}
{{ my_animals[3]}}

{% for animal in my_animals %}
    my favorite animal is the {{animal}}
{% endfor %}




{% set temperature = 35 %}
{% if temperature< 45 %}
    Time for cappuccino!
{% else %}
    Time for drink cold brew!
{% endif %}




{% set foods = ['carrot','hotdog','cucumber','bell pepper'] %}


{%- for food in foods -%}
    {%- if food == 'hotdog' -%}
        {%- set food_type = 'snacks' -%}
    {%- else -%}
        {%- set food_type = 'vegetables' -%}
    {%- endif -%}
The humble {{food}} is my favarite {{food_type}}

{% endfor %}

#}


{%- set websters_dictnory = {
    'word' : 'data',
    'speech_part' : 'noun',
    'definition' : 'if you know you know'
}
-%}

{{ websters_dictnory['word'] }} ({{ websters_dictnory['speech_part'] }}) : defined as "{{websters_dictnory['definition']}}"