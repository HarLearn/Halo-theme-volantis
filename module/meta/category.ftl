<#--  文章分类显示 post 是一个全局变量  -->
<#if (post.categories && post.categories.length) >
  <div class='new-meta-item category'>
    <a class='notlink'>
        <#--  icon: fas fa-folder-open  -->
      <i class="<%- theme.article.body.meta_library.category.icon %> fa-fw" aria-hidden="true"></i>
      <#-- list_categories 是 hexo提供的一个 函数。  插入分类列表。  -->
      <%- list_categories(post.categories, {
          show_count: false,
          separator: '<span class="sep"></span>',
          style: 'none'
          }) %>
    </a>
  </div>
</#if>
