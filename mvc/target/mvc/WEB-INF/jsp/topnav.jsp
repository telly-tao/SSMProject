<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="top_nav">
    <div class="nav_menu">
        <div class="nav toggle">
            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
        </div>
        <nav class="nav navbar-nav">
            <ul class=" navbar-right">
                <li class="nav-item dropdown open" style="padding-left: 15px;">
                    <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
                        <img src="${pageContext.request.contextPath}/sys/user/loadImg.action?id=${user.id}" alt="">${user.name}
                    </a>
                    <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item"  href="${pageContext.request.contextPath}/sys/user/userProfile.action">个人设置</a>
                        <a class="dropdown-item"  href="${pageContext.request.contextPath}/sys/user/logout.action"><i class="fa fa-sign-out pull-right"></i>退出系统</a>
                    </div>
                </li>

            </ul>
        </nav>
    </div>
</div>
