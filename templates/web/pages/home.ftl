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

    <link rel="stylesheet" href="/static-assets/sui/styles/main.css"/>
    <link rel="stylesheet" href="/static-assets/sui/styles/editor-content.css"/>

    <!--[if lte IE 8]>
    <script src="/static-assets/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="/static-assets/css/main.css?v=${siteContext.siteName}"/>
    <!--[if lte IE 9]>
    <link rel="stylesheet" href="/static-assets/css/ie9.css"/><![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="/static-assets/css/ie8.css"/><![endif]-->
    <link rel="stylesheet" href="/static-assets/css/jquery-ui.min.css"/>
</head>
<body>
<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <div class="inner">

            <!-- Header -->
            <@renderComponent component=contentModel.header_o.item />

            <li class="active"><a href="javascript:crafter.social.getDirector().authenticate()" id="login" class="log-event">Login</a></li>
            <h1 id="sui-test">Using ui build</h1>

            <!-- Banner -->
            <section id="banner" <@studio.iceAttr iceGroup="hero"/>>
                <div class="content">
                    <header>${contentModel.hero_title_html}</header>
                    ${contentModel.hero_text_html}
                </div>
                <span class="image object">
										<img src="${contentModel.hero_image_s !""}" alt=""/>
									</span>
            </section>

            <!-- Section -->
            <section <@studio.iceAttr iceGroup="features"/>>
                <header class="major">
                    <h2>${contentModel.features_title_t}</h2>
                </header>
                <div class="features" <@studio.componentContainerAttr target="features_o" component=contentModel/>>
                    <#if contentModel.features_o?? && contentModel.features_o.item??>
                        <#list contentModel.features_o.item as feature>
                            <@renderComponent component=feature />
                        </#list>
                    </#if>
                </div>
            </section>

            <!-- Section -->
            <section>
                <header class="major">
                    <h2>Featured Articles</h2>
                </header>
                <div class="posts">
                    <#list articles as article>
                        <article>
                            <a href="${article.url}" class="image">
                                <#if article.image??>
                                    <#assign articleImage = article.image/>
                                <#else>
                                    <#assign articleImage = "/static-assets/images/placeholder.png"/>
                                </#if>
                                <img src="${articleImage}" alt=""/>
                            </a>
                            <h3><a href="${article.url}">${article.title}</a></h3>
                            <p>${article.summary}</p>
                            <ul class="actions">
                                <li><a href="${article.url}" class="button">More</a></li>
                            </ul>
                        </article>
                    </#list>
                </div>
            </section>

        </div>
    </div>

    <!-- Left Rail -->
    <@renderComponent component=contentModel.left\-rail_o.item />

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
        'comments.acceptTerms'          : false, // if user has to accept terms before posting or replying comment
        'url.service': 'http://localhost:8080/crafter-social/api/3/',
        'url.security.value': 'http://localhost:8080/crafter-social/crafter-security-login',
        'url.security.active': 'http://localhost:8080/crafter-social/crafter-security-current-auth',
        'url.base': '/static-assets/sui/',
        'url.templates': '/static-assets/sui/templates/',

    };
</script>

<script>
	$.ajax({
		method: "POST",
		url: "http://localhost:8080/crafter-social/crafter-security-login",
		data: {username: "admin", password: "admin"}
	})
			.done(function (msg) {
				console.log('logged in!');
			});
</script>

<script>
	function crafterSocial_onAppReady ( director, CrafterSocial ) {
	    window.CKEDITOR.plugins.basePath = '/static-assets/sui/libs/ckeditor/plugins/';

        CrafterSocial.$.extend(CrafterSocial.string.LOCALE,{
            months: [ 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' ],
            days: ['Sunday','Monday','Tuesday','Wednesday', 'Thursday','Friday','Saturday'],
            'commentable.view-comment': 'View & Comment',
            'commentable.notify-comment':'Notify on Reply',
            'popover.no-comment':'(no comments)',
            'discussion.comment':'Be the first to comment!',
            'discussion.login-comment':'Login to comment!',
            'options.options':'Options',
            'options.inline':'Inline View',
            'options.lightbox':'Lightbox View',
            'options.bubble' :'Bubble View',
            'options.refresh':'Refresh',
            'options.close':'Close'
        });

		director.socialise({
			target: '#sui-test',
			context: 'f5b143c2-f1c0-4a10-b56e-f485f00d3fe9',
			view:{
				'parasite':{
					'cfg':{
						'discussionView':'view.Inline'
					}
				}
			}
		});
	}
</script>

<script src="/static-assets/sui/scripts/social.js"></script>

<@studio.toolSupport/>
</body>
</html>
