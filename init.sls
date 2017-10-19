{% if grains['os'] == 'Gentoo' %}

{% for pkg in 'app-admin/augeas','dev-python/python-augeas' %}
keyword-{{ pkg }}:
  file.replace:
    - name: /etc/portage/package.accept_keywords/all
    - pattern: .*{{ pkg }}.*
    - repl: {{ pkg }}
    - append_if_not_found: True

package-{{ pkg }}:
  pkg.installed:
    - name: {{ pkg }}
    - version: latest
{% endfor %}

{% endif %}
