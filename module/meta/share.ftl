<#--  

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

  -->
<#--  分享模块  -->
<#if (theme.article.body.meta_library.share)>
  <%- partial('../_third-party/share/layout') %>
<#if>
