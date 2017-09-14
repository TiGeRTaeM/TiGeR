￼
- با تشکر از https://github.com/catwell/lua-toolbox/blob/master/mime.types
انجام دادن 

mimetype محلی = {}

- TODO: اضافه کردن بیشتر؟
نوع محلی = {
  [ " متن / HTML " ] =  " اچ تی ام ال " ،
  [ " text / css " ] =  " css " ،
  [ " متن / XML " ] =  " XML " ،
  [ " تصویر / GIF " ] =  " GIF " ،
  [ " image / jpeg " ] =  " jpg " ،
  [ " application / x-javascript " ] =  " js " ،
  [ " نرم افزار / اتم + XML " ] =  " اتم " ،
  [ " application / rss + xml " ] =  " rss " ،
  [ " text / mathml " ] =  " mml " ،
  [ " text / plain " ] =  " txt " ،
  [ " text / vnd.sun.j2me.app-descriptor " ] =  " jad " ،
  [ " text / vnd.wap.wml " ] =  " wml " ،
  [ " text / x-component " ] =  " htc " ،
  [ " image / png " ] =  " png " ،
  [ " تصویر / کج خلقی " ] =  " کج خلقی " ،
  [ " image / vnd.wap.wbmp " ] =  " wbmp " ،
  [ " تصویر / X-آیکون " ] =  " ICO " ،
  [ " image / x-jng " ] =  " jng " ،
  [ " image / x-ms-bmp " ] =  " bmp " ،
  [ " image / svg + xml " ] =  " svg " ،
  [ " image / webp " ] =  " webp " ،
  [ " نرم افزار / جاوا آرشیو " ] =  " شیشه " ،
  [ " application / mac-binhex40 " ] =  " hqx " ،
  [ " نرم افزار / msword " ] =  " توضیحات " ،
  [ " نرم افزار / پی دی اف " ] =  " پی دی اف " ،
  [ " نرم افزار / پست اسکریپت " ] =  " PS " ،
  [ " نرم افزار / RTF " ] =  " RTF " ،
  [ " نرم افزار / vnd.ms-اکسل " ] =  " XLS " ،
  [ " application / vnd.ms-powerpoint " ] =  " ppt " ،
  [ " application / vnd.wap.wmlc " ] =  " wmlc " ،
  [ " application / vnd.google-earth.kml + xml " ] =  " kml " ،
  [ " نرم افزار / vnd.google-earth.kmz " ] =  " KMZ " ،
  [ " application / x-7z-compressed " ] =  " 7z " ،
  [ " application / x-cocoa " ] =  " cco " ،
  [ " برنامه / x- جاوا آرشیو-تفاوت " ] =  " jardiff " ،
  [ " application / x-java-jnlp-file " ] =  " jnlp " ،
  [ " برنامه / x- makeself " ] =  " اجرا " ،
  [ " application / x-perl " ] =  " pl " ،
  [ " application / x-pilot " ] =  " prc " ،
  [ " application / x-rar-compressed " ] =  " rar " ،
  [ " application / x-redhat-package-manager " ] =  " rpm " ،
  [ " برنامه / x- دریا " ] =  " دریا " ،
  [ " نرم افزار / x- شوک-فلش " ] =  " SWF " ،
  [ " application / x-stuffit " ] =  " نشستن " ،
  [ " برنامه / x- TCL " ] =  " TCL " ،
  [ " application / x-x509-ca-cert " ] =  " crt " ،
  [ " application / x-xpinstall " ] =  " xpi " ،
  [ " نرم افزار / xhtml + xml سرویس " ] =  " XHTML " ،
  [ " نرم افزار / فایل های فشرده " ] =  " فایل های فشرده " ،
  [ " application / octet-stream " ] =  " bin " ،
  [ " audio / midi " ] =  " mid " ،
  [ " audio / mpeg " ] =  " mp3 " ،
  [ " audio / ogg " ] =  " ogg " ،
  [ " audio / x-m4a " ] =  " m4a " ،
  [ " audio / x-realaudio " ] =  " ra " ،
  [ " ویدیو / 3gpp " ] =  " 3gpp " ،
  [ " video / mp4 " ] =  " mp4 " ،
  [ " video / mpeg " ] =  " mpeg " ،
  [ " ویدیو / نرم افزار QuickTime " ] =  " ویدئویی " ،
  [ " video / webm " ] =  " webm " ،
  [ " video / x-flv " ] =  " flv " ،
  [ " video / x-m4v " ] =  " m4v " ،
  [ " video / x-mng " ] =  " mng " ،
  [ " ویدیو / X-MS-ASF " ] =  " ASF " ،
  [ " video / x-ms-wmv " ] =  " wmv " ،
  [ " video / x-msvideo " ] =  " avi "
}

- پسوند فایل معمولی را از یک نوع محتوا می گیرد
عملکرد mimetype.get_mime_extension ( content_type )
  نوع بازگشتی [content_type]
پایان

- نوع mimetype و subtype را بازمیگرداند
عملکرد mimetype.get_content_type ( پسوند )
  برای k، v در  جفت (نوع) انجام دهید
    اگر v == extension پس از آن
      بازگشت k
    پایان
  پایان
پایان

- نوع mimetype را بدون نوع زیر باز می کند
عملکرد mimetype.get_content_type_no_sub ( پسوند )
  برای k، v در  جفت (نوع) انجام دهید
    اگر v == extension پس از آن
      - قبل /
      بازگشت k: match ( ' ([٪ w -] +) / ' )
    پایان
  پایان
پایان

بازگشت mimetype
پایان
