package com.ism.location.service.impl

import com.ism.address.domains.City
import com.ism.location.service.ILocationService
import com.ism.system.utils.SystemConfig
import grails.transaction.Transactional

@Transactional
class LocationService implements ILocationService {

    @Override
    void importCityData() {
        File cityData = new File(SystemConfig.webRootDir, "data/city.txt");
        cityData.eachLine {
            String line ->
                println(line)
        }
        /* cityData.eachLine {String line->
             String[] strings = line.split(">{1,}")
             String postcode = strings[0];
             String areaName = strings[1];
             int level = line.count(">");

             print(areaName+":"+postcode+":"+level)
         }*/
    }

    public Map addCity(Map params) {

        def result = [:];
        City father = City.findById(params.fId);


        City city = City.findById(params.cityId);
        if (!city) {
            city = new City();
        }
        city.name = params.name;
        city.code = params.code;
        if (father) {
            city.level = father.level + 1;
        } else {
            city.level = 1;
        }

        city.description = params.description;
        city.type = params.type as int;
        if (!params.cityId) {
            city.fatherCity = father;
        }
        if (city.save(flush: true) && (!city.hasErrors())) {
            result.success = true;
        } else {
            result.success = false;
            result.msg = "数据库错误!";
        }
        return result;
    }

}
