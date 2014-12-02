import com.ism.system.utils.SystemConfig

class BootStrap {
    def userService;
    def locationService;
    def init = { servletContext ->
        SystemConfig.initWebRootDir(servletContext)

        //系统初始化需要进行的工作
        userService.initSuper();
        //同步城市
        locationService.importCityData();
    }
    def destroy = {
    }
}
