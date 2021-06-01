<#import "/templates/system/common/cstudio-support.ftl" as studio />

<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
    <title>${contentModel.title_t}</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <!--[if lte IE 8]>
    <script src="/static-assets/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="/static-assets/css/main.css?v=${siteContext.siteName}"/>
    <!--[if lte IE 9]>
    <link rel="stylesheet" href="/static-assets/css/ie9.css"/><![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="/static-assets/css/ie8.css"/><![endif]-->
    <link rel="stylesheet" href="/static-assets/css/jquery-ui.min.css"/>

<#--    <link rel="stylesheet" href="/static-assets/sui2/alt/styles/main.css"/>-->
    <link rel="stylesheet" href="/static-assets/sui/styles/main.css"/>
</head>

<body>

<!-- Wrapper -->
<div id="wrapper">
    <!-- Main -->
    <div id="main">
        <div class="inner">

            <!-- Header -->
            <@renderComponent component = contentModel.header_o.item />

            <!-- Content -->
            <section>
                <header class="main" <@studio.iceAttr iceGroup="subject"/>>
                    <h1 id="${contentModel.objectId}">${contentModel.subject_t!""}</h1>
                    <h2>by ${contentModel.author_s!""}</h2>
                </header>
                <#if contentModel.image_s??>
                    <#assign image = contentModel.image_s/>
                <#else>
                    <#assign image = "/static-assets/images/placeholder.png"/>
                </#if>
                <span class="image main"><img src="${image}" alt=""/></span>
                <#list contentModel.sections_o.item as item>
                    <div <@studio.iceAttr iceGroup="article"/>>
                        ${item.section_html}
                    </div>
                    <hr class="major"/>
                </#list>
            </section>
        </div>
    </div>

    <#assign articleCategories = contentModel.queryValues("//categories_o/item/key")/>
    <#assign articlePath = contentModel.storeUrl />
    <#assign additionalModel = {"articleCategories": articleCategories, "articlePath": articlePath }/>

    <!-- Left Rail -->
    <@renderComponent component = contentModel.left\-rail_o.item additionalModel = additionalModel />

</div>

<!-- Scripts -->
<script src="/static-assets/js/jquery.min.js"></script>
<script src="/static-assets/js/jquery-ui.min.js"></script>
<script src="/static-assets/js/skel.min.js"></script>
<script src="/static-assets/js/util.js"></script>
<!--[if lte IE 8]>
<script src="/static-assets/js/ie/respond.min.js"></script><![endif]-->
<script src="/static-assets/js/main.js?v=${siteContext.siteName}"></script>

<script>

    var crafterSocial_cfg = {
        'url.service': 'http://localhost:8080/crafter-social/api/3/',
        'url.security.value': 'http://localhost:8080/crafter-social/crafter-security-login',
        'url.security.active': 'http://localhost:8080/crafter-social/crafter-security-current-auth',
        'url.base': '/',
        // 'url.templates': '/static-assets/sui2/alt/templates/',
        'url.templates': '/static-assets/sui/templates/',

    };
</script>

<#--<script src="/static-assets/sui2/alt/scripts/social.js"></script>-->
<script src="/static-assets/sui/scripts/social.js"></script>

<script>
    $.ajax({
        method: "POST",
        url: "http://localhost:8080/crafter-social/crafter-security-login",
        data: {username: "admin", password: "admin"}
    })
        .done(function (msg) {
            // alert( "login successful" );
        });
</script>

<script>
    crafter.social.getDirector().on(crafter.social.Constants.get('EVENT_USER_AUTHENTICATION_SUCCESS'), function
        (profile) {
        var director = crafter.social.getDirector();

        director.listenTo(director,'crater.social.event.no.comments.action' , function(){alert('Go TO Login')});

        director.socialise({
            target: '#${contentModel.objectId}',
            context: 'f5b143c2-f1c0-4a10-b56e-f485f00d3fe9',
            view: {
                'parasite': {
                    'cfg': {
                        'discussionView': 'view.Inline'
                    }
                }
            }
        });
    });
</script>

<@studio.toolSupport/>
</body>
</html>
