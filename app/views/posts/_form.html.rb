<%= form_for @post do |f| %>
  <li>
    <%=f.label :date %><br>
    <%=f.date_field :date %>
  </li>
  <li>
    <%=f.label :rationale %><br>
    <%=f.text_area :rationale %>
  </li>
  <li>
    <%= f.submit "Save"%>
  </li>

<%end%>