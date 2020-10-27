<#--  

# 文章创建日期
    date:
    icon: fas fa-calendar-alt
    title: '发布于：'
    format: 'll' # 日期格式 http://momentjs.com/docs/

  -->

<#--  添加时间模块  -->
<div class="new-meta-item date">
  <a class='notlink'>
    <i class="<%- theme.article.body.meta_library.date.icon %> fa-fw" aria-hidden="true"></i>
    <p><%- theme.article.body.meta_library.date.title + date(post.date, theme.article.body.meta_library.date.format) %></p>
  </a>
</div>
