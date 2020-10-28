
<#--  

comments:
  title: <i class='fas fa-comments'></i> 评论
  subtitle:
  service: valine # valine, minivaline, disqus, gitalk, vssue, livere, isso, hashover
  # Valine
  # https://valine.js.org/
  valine:
    appId: # your appId
    appKey: # your appKey
    # js: https://cdn.jsdelivr.net/npm/valine@1.4/dist/Valine.min.js
    path: # 全局评论地址
    placeholder: 快来评论吧~  # 评论占位提示
    meta: nick,mail,link # valine comment header info
    requiredFields: ['nick','mail']
    enableQQ: true # Unstable avatar link
    recordIP: false # Record commenter IP
    avatar: robohash # gravatar style https://valine.js.org/avatar
    pageSize: 10 # comment list page size
    lang: zh-cn
    highlight: true
    visitor: true
    mathJax: false

  -->

<#--  评论模块  -->

<% if (theme.comments.service == 'valine'){ %>
<div class="new-meta-item comments-count">
  <%
    var path = post.path || page.path;
    if (path.length > 9 && (path.substring(path.length - 10) == 'index.html')) {
      path = path.substring(0, path.length - 10);
    }
  %>
  <a href="<%- url_for(path) %>#comments">
    <i class="<%- theme.article.body.meta_library.valinecount.icon %> fa-fw"></i>
    <span class="valine-comment-count" data-xid="<%- url_for(path) %>">0</span>
    <span class="leancloud-comments-count">&nbsp;<%- theme.article.body.meta_library.valinecount.desc %></span>
  </a>
</div>
<% } %>
