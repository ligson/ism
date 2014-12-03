package com.ism.location.service.impl

import com.ism.address.domains.City
import com.ism.location.service.ILocationService
import com.ism.system.utils.SystemConfig
import grails.transaction.Transactional

@Transactional
class LocationService implements ILocationService{

    @Override
    void importCityData() {
        File cityData = new File(SystemConfig.webRootDir,"data/city.txt");


        cityData.eachLine {String line->
            String[] strings = line.split(">{1,}")
            String postcode = strings[0];
            String areaName = strings[1];
            int level = line.count(">");

            print(areaName+":"+postcode+":"+level)
        }
    }
}
