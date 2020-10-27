
<#--  

############################### Analytics ############################### > start
analytics:
  busuanzi: #https://cdn.jsdelivr.net/gh/volantis-x/cdn-busuanzi@2.3/js/busuanzi.pure.mini.js
  leancloud: # 请使用自己的 id & key 以防止数据丢失
    app_id: u9j57bwJod4EDmXWdxrwuqQT-MdYXbMMI
    app_key: jfHtEKVE24j0IVCGHbvuFClp
    custom_api_server: # 国际版一般不需要写，除非自定义了 API Server
############################### Analytics ############################### > end

  -->

<#--  用于 文章浏览计数 -->
<#if (theme.analytics && theme.analytics.leancloud && theme.analytics.leancloud.app_id)>
  <div class="new-meta-item browse leancloud">
    <a class='notlink'>
      <%
        var path = post.path || page.path;
        if (path.length > 9 && (path.substring(path.length - 10) == 'index.html')) {
          path = path.substring(0, path.length - 10);
        }
      %>
      <div id="lc-pv" data-title="<%- post.title || page.title %>" data-path="<%- url_for(path) %>">
        <i class="<%- theme.article.body.meta_library.counter.icon %> fa-fw" aria-hidden="true"></i>
        <span id='number'><i class="fas fa-circle-notch fa-spin fa-fw" aria-hidden="true"></i></span>
        <%- theme.article.body.meta_library.counter.unit %>
      </div>
    </a>
  </div>
<#elseif (theme.analytics.busuanzi)>
  <div class="new-meta-item browse busuanzi">
    <a class='notlink'>
      <i class="<%- theme.article.body.meta_library.counter.icon %> fa-fw" aria-hidden="true"></i>
      <p>
        <span id="busuanzi_value_page_pv">
          <i class="fas fa-circle-notch fa-spin fa-fw" aria-hidden="true"></i>
        </span>
        <%- theme.article.body.meta_library.counter.unit %>
      </p>
    </a>
  </div>  
</#if>
