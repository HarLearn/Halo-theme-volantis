<!-- 文章存档展示功能 -->
<#if (site.posts && site.posts.length > 0)>
  <section class="post-list">
    <#if (!page.prev)>
      <#if (is_home()) >
        <% site.pages.each(function(post){ %>
          <#if (post.pin)>
            <#if (page.group == undefined || post.group == page.group)>
              <div class='post-wrapper'>
                <%- partial('post', {post: post}) %>
              </div>
            </#if>
          </#if>
        <% }) %>
        <% site.posts.sort('date', -1).each(function(post){ %>
          <#if (post.pin) >
            <#if (page.group == undefined || post.group == page.group)>
              <div class='post-wrapper'>
                <%- partial('post', {post: post}) %>
              </div>
            </#if>
          </#if>
        <% }) %>
      <#elseif (page.posts && page.posts.length > 0)>
        <% page.posts.each(function(post){ %>
          <#if (post.pin) >
            <div class='post-wrapper'>
              <%- partial('post', {post: post}) %>
            </div>
          </#if>
        <% }) %>
      </#if>
    </#if>
    <#if (page.posts && page.posts.length > 0)>
      <% page.posts.each(function(post){ %>
        <#if (!post.pin)>
          <div class='post-wrapper'>
            <%- partial('post', {post: post}) %>
          </div>
        </#if>
      <% }) %>
    </#if>
  </section>
  <#if (page && page.posts)>
    <#if (page.total > 1)>
      <br>
      <div class="prev-next">
        <#if (page.prev != 0)>
          <a class="prev" rel="prev" href="<%= url_for(page.prev_link) %>">
            <section class="post prev white-box <%- theme.custom_css.body.effect.join(' ') %>" >
              <i class="fas fa-chevron-left" aria-hidden="true"></i>&nbsp;<%- __('post.prev_page') %>&nbsp;
            </section>
          </a>
        </#if>
        <p class="current">
          <%= page.current%> / <%= page.total%>
        </p>
        <#if (page.next != 0) >
          <a class="next" rel="next" href="<%= url_for(page.next_link) %>">
            <section class="post next white-box <%- theme.custom_css.body.effect.join(' ') %>">
              &nbsp;<%- __('post.next_page') %>&nbsp;<i class="fas fa-chevron-right" aria-hidden="true"></i>
            </section>
          </a>
        </#if>
      </div>
    </#if>
  </#if>
</#if>
