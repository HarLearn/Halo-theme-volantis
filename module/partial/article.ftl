
<#--  

############################### Article Layout ############################### > start
# 文章布局
article:
  # 文章列表页面的文章卡片布局方案
  preview:
    scheme: landscape # landscape
    # pin icon for post
    pin_icon: https://cdn.jsdelivr.net/gh/twitter/twemoji@13.0/assets/svg/1f4cc.svg
    # auto generate title if not exist
    auto_title: true # false, true
    # auto generate excerpt if not exist
    auto_excerpt: true # false, true
    # show split line or not
    line_style: solid # hidden, solid, dashed, dotted
    # show author
    author: false # true, false
    # show readmore button
    readmore: auto # auto, always
  # 文章详情页面的文章卡片本体布局方案
  body:
    # 文章顶部信息
    # 从 meta_library 中取
    top_meta: [author, category, date, counter]
    # ----------------
    # 文章页脚组件
    footer_widget:
      # ----------------
      # 参考资料、相关资料等 (for layout: post/docs)
      references:
        title: 参考资料
        icon: fas fa-quote-left
        # 在 front-matter 中:
        #   references:
        #     - title: 某篇文章
        #       url: https://
        # 即可显示此组件。
      # ----------------
      # 相关文章，需要安装插件 (for layout: post)
      # npm i hexo-related-popular-posts
      related_posts:
        enable: false
        title: 相关文章
        icon: fas fa-bookmark
        max_count: 5
        # 设为空则不使用文章头图
        placeholder_img: data:image/png;base64,666
      # ----------------
      # 版权声明组件 (for layout: post)
      copyright:
        enable: true
        permalink: '本文永久链接是：'
        content:
          - '博客内容遵循 署名-非商业性使用-相同方式共享 4.0 国际 (CC BY-NC-SA 4.0) 协议'
          - permalink
      # ----------------
      # 打赏组件 (for layout: post)
      donate:
        enable: false
        images:
          - https://cdn.jsdelivr.net/gh/volantis-x/cdn-org/blog/qrcode/github@volantis.png
          - https://cdn.jsdelivr.net/gh/volantis-x/cdn-org/blog/qrcode/github@volantis.png
    # 文章底部信息
    # 从 meta_library 中取
    bottom_meta: [updated, tags, share]
    # meta library
    meta_library:
      # 默认文章作者（可在 front-matter 中覆盖）
      author:
        avatar:
        name: 请设置文章作者
        url: /
      # 文章创建日期
      date:
        icon: fas fa-calendar-alt
        title: '发布于：'
        format: 'll' # 日期格式 http://momentjs.com/docs/
      # 文章更新日期
      updated:
        icon: fas fa-edit
        title: '更新于：'
        format: 'll' # 日期格式 http://momentjs.com/docs/
      # 文章分类
      category:
        icon: fas fa-folder-open
      # 文章浏览计数
      counter:
        icon: fas fa-eye
        unit: '次浏览'
      # 文章评论数量：只支持 valine
      valinecount:
        icon: fas fa-comment-dots
        desc: '' # 条评论
      # 文章字数和阅读时长
      wordcount:
        icon_wordcount: fas fa-keyboard
        icon_duration: fas fa-hourglass-half
      # 文章标签
      tags:
        icon: fas fa-hashtag
      # 分享
      share:
        - id: qq
          img: https://cdn.jsdelivr.net/gh/volantis-x/cdn-org/logo/128/qq.png
        - id: qzone
          img: https://cdn.jsdelivr.net/gh/volantis-x/cdn-org/logo/128/qzone.png
        - id: weibo
          img: https://cdn.jsdelivr.net/gh/volantis-x/cdn-org/logo/128/weibo.png
        - id: # qrcode # 当id为qrcode时需要安装插件  npm i hexo-helper-qrcode
          img: # https://cdn.jsdelivr.net/gh/volantis-x/cdn-org/logo/128/wechat.png
        - id: # telegram
          img: # https://cdn.jsdelivr.net/gh/volantis-x/cdn-org/logo/128/telegram.png
############################### Article Layout ############################### > end

  -->

<#--  文章的展示布局情况  -->

<article class="article post white-box reveal md <%- theme.custom_css.body.effect.join(' ') %> article-type-<%= post.layout %>" id="<%= post.layout %>" itemscope itemprop="blogPost">
  <%- partial('meta', {post: post, position: 'top'}) %>
  <% if (page.layout == 'artitalk') { %>
    <div id="artitalk_main"></div>
  <% } %>
  <%- post.content %> <#-- 文章的内容 -->
  <#--  文章的外部链接  -->
  <% if (page.link) { %> 
    <div class='div-ori-link'>
      <a class='ori-link' href='<%- url_for(post.link || post.path) %>'>
        <%- post.link ? __('post.readoriginal') : __('post.readmore') %>
      </a>
    </div>
  <% } %>
  <% if (['post','docs'].includes(page.layout)) { %>
    <#--  页脚组件  -->
    <% let footer_widget = theme.article.body.footer_widget; %>
    <div class='footer'>
      <% if (page.references && page.references.length > 0) { %>
        <div class='references'>
          <section class='header'>
            <% if (footer_widget.references.icon) { %>
              <i class="<%- footer_widget.references.icon %> fa-fw" aria-hidden="true"></i>
            <% } %>
            <span><%- footer_widget.references.title %></span>
          </section>
          <section class='body'>
            <ul>
              <% (page.references||[]).forEach(function(row){ %>
                <li>
                  <a href="<%- url_for(row.url) %>" rel="external nofollow noopener noreferrer" target="_blank">
                  <%- row.title || url_for(row.url) %>
                  </a>
                </li>
              <% }) %>
            </ul>
          </section>
        </div>
      <% } %>
      <% if (['post'].includes(page.layout) && footer_widget.related_posts && footer_widget.related_posts.enable == true) { %>
        <%-
        htmlGenerator(
          popular_posts_json({ maxCount: footer_widget.related_posts.max_count , ulClass: 'vlts-rps' , PPMixingRate: 0.2 , isImage: true , isExcerpt: true} , post )
        )
        %>
      <% } %>
      <% if (['post'].includes(page.layout) && footer_widget.copyright && footer_widget.copyright.enable == true) { %>
        <div class='copyright'>
          <blockquote>
            <% (footer_widget.copyright.content||[]).forEach(function(row){ %>
              <% if (row == 'permalink') { %>
                <p><%- footer_widget.copyright.permalink %><a href=<%- page.permalink %>><%- page.permalink %></a></p>
              <% } else { %>
                <%- markdown(row) %>
              <% } %>
            <% }) %>
          </blockquote>
        </div>
      <% } %>
      <% if (['post'].includes(page.layout) && footer_widget.donate && footer_widget.donate.enable == true) { %>
        <div class='donate'>
          <div class='imgs'>
            <% (footer_widget.donate.images||[]).forEach(function(url){ %>
              <img src='<%- url_for(url) %>'>
            <% }) %>
          </div>
        </div>
      <% } %>
    </div>
  <% } %>
  <% if (['page', 'post', 'docs'].includes(post.layout)) { %>
    <%- partial('meta', {post: post, position: 'bottom'}) %>
  <% } %>
  <% if ((post.group != undefined) && (post.order != undefined)) { %>
    <%
    let prev = new Object();
    let next = new Object();
    site.pages.each(function(p){
      if ((p.title || p.seo_title) && p.path && (p.group == post.group)) {
        if (p.order < post.order && (p.order > prev.order || prev.order == undefined)) {
          prev = {title: p.title || p.seo_title, exp: truncate(strip_html(p.content), {length: 100}), path: p.path, order: p.order};
        }
        if (p.order > post.order && (p.order < next.order || next.order == undefined)) {
          next = {title: p.title || p.seo_title, exp: truncate(strip_html(p.content), {length: 100}), path: p.path, order: p.order};
        }
      }
    })
    %>
    <% if (['docs'].includes(post.layout) && (prev || next)) { %>
      <div class="prev-next">
        <% if (prev.path) { %>
          <a class='prev' href='<%- url_for(prev.path) %>'>
            <p class='title'><i class="fas fa-chevron-left" aria-hidden="true"></i><%- prev.title || '' %></p>
            <p class='content'><%- prev.exp %></p>
          </a>
        <% } %>
        <% if (next.path) { %>
          <a class='next' href='<%- url_for(next.path) %>'>
            <p class='title'><%- next.title || '' %><i class="fas fa-chevron-right" aria-hidden="true"></i></p>
            <p class='content'><%- next.exp %></p>
          </a>
        <% } %>
      </div>
    <% } %>
  <% } %>

  <% if (post.prev || post.next) { %>
    <div class="prev-next">
      <% if (post.prev) { %>
        <a class='prev' href='<%- url_for(post.prev.path) %>'>
          <p class='title'><i class="fas fa-chevron-left" aria-hidden="true"></i><%- post.prev.title || '' %></p>
          <p class='content'><%- truncate(strip_html(page.prev.content), {length: 100}) %></p>
        </a>
      <% } %>
      <% if (post.next) { %>
        <a class='next' href='<%- url_for(post.next.path) %>'>
          <p class='title'><%- post.next.title || '' %><i class="fas fa-chevron-right" aria-hidden="true"></i></p>
          <p class='content'><%- truncate(strip_html(page.next.content), {length: 100}) %></p>
        </a>
      <% } %>
    </div>
  <% } %>
</article>
<#--  引入评论  -->
<% if (page.comments == undefined || page.comments != false) { %>
  <%- partial('../_third-party/comments/index') %>
<% } %>

<% if (page.mathjax) { %>
  <%- partial('../_third-party/math/mathjax/script') %>
<% } %>
