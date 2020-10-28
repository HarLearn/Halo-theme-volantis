
<#--  博客作者信息  -->
<%- partial('_pre') %>
<section class="widget <%- item.class %> <%- page.widget_style %> <%- page.widget_platform %>">
  <div class='content'>
    <#if (item.avatar) >
      <#if (item.url) >
        <a class='avatar flat-box <%- item.shape %>' href='<%- url_for(item.url) %>'>
          <img no-lazy src='<%- item.avatar %>'/>
        </a>
      <#else>
        <div class='avatar'>
          <img no-lazy src='<%- item.avatar %>'/>
        </div>
      <#if>
    </#if>
    <#if (item.title || item.subtitle || item.jinrishici)>
      <div class='text'>
        <#if (item.title) >
          <h2><%- item.title %></h2>
        </#if>
        <#if (item.subtitle) >
          <%- markdown(item.subtitle) %>
        </#if>
        <#if (item.jinrishici) >
          <p><span id="jinrishici-sentence"><%- item.jinrishici != true ? item.jinrishici : config.title %></span></p>
          <script src="https://sdk.jinrishici.com/v2/browser/jinrishici.js" charset="utf-8"></script>
        </#if>
      </div>
    </#if>
    <#if (item.social && item.social.length > 0)>
      <div class="social-wrapper">
        <% (item.social||[]).forEach(function(value){ %>
          <#if (value.url && (value.icon || value.img || value.avatar)) { %>
            <a href="<%= url_for(value.url) %>"
              class="social <%- value.icon %> flat-btn"
              target="_blank"
              rel="external nofollow noopener noreferrer">
              <% if (value.img) { %>
                <img src="<%- value.img %>"/>
              <% } else if (value.avatar) { %>
                <img src="<%- value.avatar %>" style="border-radius:120px"/>
              <% } %>
            </a>
          </#if>
        <%})%>
      </div>
    </#if>
  </div>
</section>
