USE eanprod;

ALTER TABLE `airportcoordinateslist`
  ADD CONSTRAINT FOREIGN KEY (`CountryCode`) REFERENCES `countrylist` (`CountryCode`);

ALTER TABLE `activepropertylist`
  ADD CONSTRAINT FOREIGN KEY (`RegionID`) REFERENCES `regioncentercoordinateslist` (`parentregionlist`),
  ADD CONSTRAINT FOREIGN KEY (`ChainCodeID`) REFERENCES `chainlist` (`ChainCodeID`),
  ADD CONSTRAINT FOREIGN KEY (`AirportCode`) REFERENCES `airportcoordinateslist` (`AirportCode`),
  ADD CONSTRAINT FOREIGN KEY (`PropertyCategory`) REFERENCES `propertytypelist` (`PropertyCategory`),
  ADD CONSTRAINT FOREIGN KEY (`CountryCode`) REFERENCES `countrylist` (`CountryCode`);

ALTER TABLE `propertydescriptionlist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

ALTER TABLE `policydescriptionlist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

ALTER TABLE `recreationdescriptionlist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

ALTER TABLE `areaattractionslist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

ALTER TABLE `diningdescriptionlist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

ALTER TABLE `spadescriptionlist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

ALTER TABLE `whattoexpectlist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

ALTER TABLE `roomtypelist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

ALTER TABLE `propertyattributelink`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`),
  ADD CONSTRAINT FOREIGN KEY (`AttributeID`) REFERENCES `attributelist` (`AttributeID`);

ALTER TABLE `hotelimagelist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

ALTER TABLE `parentregionlist`
  ADD CONSTRAINT FOREIGN KEY (`ParentRegionID`) REFERENCES `parentregionlist` (`RegionID`);

ALTER TABLE `regioncentercoordinateslist`
  ADD CONSTRAINT FOREIGN KEY (`RegionID`) REFERENCES `parentregionlist` (`RegionID`);

ALTER TABLE `regioneanhotelidmapping`
  ADD CONSTRAINT FOREIGN KEY (`RegionID`) REFERENCES `parentregionlist` (`RegionID`),
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

ALTER TABLE `propertylocationlist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

ALTER TABLE `propertyamenitieslist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

ALTER TABLE `propertyroomslist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

ALTER TABLE `propertybusinessamenitieslist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

ALTER TABLE `propertynationalratingslist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

ALTER TABLE `propertyfeeslist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

ALTER TABLE `propertymandatoryfeeslist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

ALTER TABLE `propertyrenovationslist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

ALTER TABLE `activepropertybusinessmodel`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);
