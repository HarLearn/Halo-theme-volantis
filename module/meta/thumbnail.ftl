<#--  缩略图展示页面  -->
<#if (post.thumbnail && post.thumbnail.length) >
  <a title='<%- post.title %>' href='<%- url_for(post.link || post.path) %>'>
    <img class='thumbnail' src='<%- post.thumbnail %>'>
  </a>
<#if>
