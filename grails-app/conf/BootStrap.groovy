class BootStrap {
    def userService;
    def init = { servletContext ->
        //系统初始化需要进行的工作
        userService.initSuper();
    }
    def destroy = {
    }
}
