<%
<#--  用于获取作者的信息  -->
let author = theme.article.body.meta_library.author;
<#--    -->
let aid = post.author; 
if (aid && site.data && site.data.author && (aid in site.data.author)) {
  author = site.data.author[aid];
}
%>
<#--  显示作者的一些信息 链接，头像，名称  -->
<div class='new-meta-item author'>
  <a class='author' href="<%- author.url %>" rel="nofollow">
    <img no-lazy src="<%- author.avatar %>">
    <p><%- author.name %></p>
  </a>
</div>
