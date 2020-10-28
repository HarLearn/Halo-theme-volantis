
<#--  

# 文章更新日期
      updated:
        icon: fas fa-edit
        title: '更新于：'
        format: 'll' # 日期格式 http://momentjs.com/docs/

  -->
<div class="new-meta-item date" itemprop="dateUpdated" datetime="<%- moment(post.updated).format() %>">
  <a class='notlink'>
    <i class="<%- theme.article.body.meta_library.updated.icon %> fa-fw" aria-hidden="true"></i>
    <p><%- theme.article.body.meta_library.updated.title + date(post.updated, theme.article.body.meta_library.updated.format) %></p>
  </a>
</div>
