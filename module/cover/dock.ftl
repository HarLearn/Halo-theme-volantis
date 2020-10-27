<div class='cover-body'>
  <div class='top'>
    <#-- 如果设置了 logo 就显示logo-->
    <#if (theme.cover.logo)>
      <img no-lazy class='logo' src='<%- url_for(theme.cover.logo) %>'/>
    </#if>
    <#-- 如果设置了 title 就显示title-->
    <#if (theme.cover.title)>
      <p class="title"><%- theme.cover.title ? theme.cover.title : config.title %></p>
    </#if>
    <#-- 如果设置了 子标题 就显示 子标题-->
    <#if (theme.cover.subtitle)>
      <p class="subtitle"><%- theme.cover.subtitle%></p>
    </#if>
  </div>
  <div class='bottom'>
    <div class='menu navigation'>
      <div class='list-h'>
        <#--  如果存在特征  -->
        <#if (theme.cover.features)>
            <#--  对特征进行遍历  -->
            <#--  也就是上面的那几个导航栏，文档，帮助，示例，社区，源码等  -->
          <% (theme.cover.features || []).forEach(function(value){ %>
            <a href="<%= url_for(value.url) %>"
              <% if (value.rel) { %>
                rel="<%- value.rel %>"
              <% } %>
              <% if (value.target) { %>
                target="<%- value.target %>"
              <% } %>
              id="<%= url_for(value.url).replace(/\/|%|\./g, "")?url_for(value.url).replace(/\/|%|\./g, ""):"home" %>">
              <% if (value.img) { %><img src='<%= value.img %>'><% } else if (value.icon) { %><i class='<%= value.icon %> fa-fw'></i><% } %><p><%- value.name %></p>
            </a>
          <%})%>
        </#if>
      </div>
    </div>
  </div>
</div>
