<%inherit file="layout.mako"/>
<%def name="title()">
  Mitarbeiter
</%def>
<ul>

    <div class="list-view">
        <div class="column-header">Name</div>
        <div class="column-header">Nachname</div>
        <div class="column-header">Akademischer Grad</div>
        <div class="column-header">Beschäftigung</div>
        <div class="column-header">Aktionen</div>

    <% counter = 0 %>
    % for employee in employees:
        % if counter % 2 == 0:
        <%  color_class = 'list-color-primary' %>
        % else:
        <%  color_class = 'list-color-secondary' %>
        % endif
        
        <div class='column-cell ${color_class}'>${employee['name']}</div>
        <div class='column-cell ${color_class}'>${employee['surname']}</div>
        <div class='column-cell ${color_class}'>${employee['degree']}</div>
        <div class='column-cell ${color_class}'>${employee['occupation']}</div>
        <div class='column-cell ${color_class}'>
            <i class="material-icon">create</i>
            <i class="material-icon">delete_sweep</i>
        </div>
        <% counter += 1 %>
    % endfor
    </div>

</ul>