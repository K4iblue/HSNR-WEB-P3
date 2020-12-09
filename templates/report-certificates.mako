<%inherit file="layout.mako"/>
<%def name="title()">
  Mitarbeiter Auswertung
</%def>
<h2>Mitarbeiter:</h2>
% for employee in employees:
  <div>
    <label>${employee['name'] | h} ${employee['surname'] | h}:</label>
    % for certificate in employee['certificates']:
        <div class="report">
            ${certificate['title'] | h}
        </div>
    % endfor
  </div>
% endfor