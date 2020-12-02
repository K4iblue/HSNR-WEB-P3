<%inherit file="layout.mako"/>
<%def name="title()">
  Startseite
</%def>
<h2>Mitarbeiter-Statistiken</h2>
<ul>
  <li><span class="counter">${employees}</span> Mitarbeiter</li>
  <li><span class="counter">${trainings}</span> Weiterbildungen</li>
  <li><span class="counter">${participations}</span> Teilnahmen</li>
</ul>
