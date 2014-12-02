package com.ism.system.utils

import org.apache.commons.io.FileUtils
import org.springframework.core.io.ClassPathResource

import javax.servlet.ServletContext

/**
 * Created by lvy6 on 14-7-28.
 */
class SystemConfig {
    public static final File userHome = new File(System.getProperty("user.home"));
    public static File rootDir;
    public static File config;
    public static ConfigObject configObject;
    public static File webRootDir;
    public static boolean isInit = false;

    public static void initWebRootDir(ServletContext servletContext) {
        webRootDir = new File(servletContext.getRealPath("/"));
    }

    public static void init(String appName) {
        if (isInit) {
            return;
        } else {
            isInit = true;
        }
        rootDir = new File(userHome, ".${SystemConstant.appName}");
        println(rootDir.getAbsolutePath())
        if (!rootDir.exists()) {
            rootDir.mkdirs();
        }
        config = new File(rootDir, "${SystemConstant.appName}-config.properties");

        //每次启动读取默认文件
        ClassPathResource resource = new ClassPathResource("${SystemConstant.appName}-config.properties");
        File file;
        if (resource.exists()) {
            file = resource.file;
        } else {
            file = new File("./grails-app/conf/${SystemConstant.appName}-config.properties");
        }
        //拷贝配置文件生成模板，每次启动，保持模板最新
        if (file.exists()) {
            FileUtils.copyFile(file, new File(rootDir, "${SystemConstant.appName}-config-default.properties"));
            //如果用户没有配置文件，就拷贝默认文件
            if (!config.exists()) {
                FileUtils.copyFileToDirectory(file, rootDir)
            }
        }
//        log.debug(file.path);
        Properties properties = new Properties();
        properties.load(new FileInputStream(config))
        configObject = new ConfigSlurper().parse(properties);


    }

    public static ConfigObject getDBConfig() {
        return configObject.dataSource;
    }


    public static void setConfig(String key, String value) {

        StringBuffer stringBuffer = new StringBuffer();
        config.eachLine {
            if (it.startsWith(key + "=")) {
                stringBuffer.append(key + "=" + value);
            } else {
                stringBuffer.append(it);
            }
            stringBuffer.append("\n")
        }
        config.write(stringBuffer.toString(), "UTF-8");

    }


    public static void reload() {
        init(SystemConstant.appName);
    }
}
