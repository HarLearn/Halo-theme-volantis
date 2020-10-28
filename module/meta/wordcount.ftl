
<#--  # 文章字数和阅读时长
      wordcount:
        icon_wordcount: fas fa-keyboard
        icon_duration: fas fa-hourglass-half
  -->

<#if (theme.plugins.wordcount.enable) >
  <div class="new-meta-item wordcount">
    <a class='notlink'>
      <i class="<%- theme.article.body.meta_library.wordcount.icon_wordcount %> fa-fw" aria-hidden="true"></i>
      <p><%- __('post.wordcount', wordcount(post.content))%></p>
    </a>
  </div>
  <div class="new-meta-item readtime">
    <a class='notlink'>
      <i class="<%- theme.article.body.meta_library.wordcount.icon_duration %> fa-fw" aria-hidden="true"></i>
      <p><%- __('post.duration', min2read(post.content))%></p>
    </a>
  </div>
<#if>
