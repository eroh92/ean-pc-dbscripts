USE eanprod;

DELETE FROM airportcoordinateslist where CountryCode not in (select CountryCode from countrylist);
ALTER TABLE `airportcoordinateslist`
  ADD CONSTRAINT FOREIGN KEY (`CountryCode`) REFERENCES `countrylist` (`CountryCode`) ON DELETE CASCADE ON UPDATE CASCADE;

DELETE FROM activepropertylist WHERE Country NOT IN (SELECT CountryCode FROM countrylist);
DELETE FROM activepropertylist WHERE RegionID NOT IN (SELECT RegionID FROM parentregionlist);
DELETE FROM activepropertylist WHERE ChainCodeID NOT IN (SELECT ChainCodeID FROM chainlist);
ALTER TABLE `activepropertylist`
  ADD CONSTRAINT FOREIGN KEY (`RegionID`) REFERENCES `parentregionlist` (`RegionID`),
  ADD CONSTRAINT FOREIGN KEY (`ChainCodeID`) REFERENCES `chainlist` (`ChainCodeID`),
  ADD CONSTRAINT FOREIGN KEY (`PropertyCategory`) REFERENCES `propertytypelist` (`PropertyCategory`),
  ADD CONSTRAINT FOREIGN KEY (`Country`) REFERENCES `countrylist` (`CountryCode`);

DELETE FROM propertydescriptionlist WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `propertydescriptionlist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

DELETE FROM policydescriptionlist WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `policydescriptionlist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

DELETE FROM recreationdescriptionlist WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `recreationdescriptionlist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

DELETE FROM areaattractionslist WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `areaattractionslist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

DELETE FROM diningdescriptionlist WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `diningdescriptionlist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

DELETE FROM spadescriptionlist WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `spadescriptionlist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

DELETE FROM whattoexpectlist WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `whattoexpectlist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

DELETE FROM roomtypelist WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `roomtypelist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

DELETE FROM propertyattributelink WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `propertyattributelink`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`),
  ADD CONSTRAINT FOREIGN KEY (`AttributeID`) REFERENCES `attributelist` (`AttributeID`);

DELETE FROM hotelimagelist WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `hotelimagelist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

INSERT INTO parentregionlist
  (RegionID, RegionType, RegionName, RegionNameLong)
  VALUES (0, 'World', 'World', 'World');
ALTER TABLE `parentregionlist`
  ADD CONSTRAINT FOREIGN KEY (`ParentRegionID`) REFERENCES `parentregionlist` (`RegionID`);

ALTER TABLE `regioncentercoordinateslist`
  ADD CONSTRAINT FOREIGN KEY (`RegionID`) REFERENCES `parentregionlist` (`RegionID`);

DELETE FROM regioneanhotelidmapping WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `regioneanhotelidmapping`
  ADD CONSTRAINT FOREIGN KEY (`RegionID`) REFERENCES `parentregionlist` (`RegionID`),
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

DELETE FROM propertylocationlist WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `propertylocationlist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

DELETE FROM propertyamenitieslist WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `propertyamenitieslist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

DELETE FROM propertyroomslist WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `propertyroomslist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

DELETE FROM propertybusinessamenitieslist WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `propertybusinessamenitieslist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

DELETE FROM propertynationalratingslist WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `propertynationalratingslist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

DELETE FROM propertyfeeslist WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `propertyfeeslist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

DELETE FROM propertymandatoryfeeslist WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `propertymandatoryfeeslist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

DELETE FROM propertyrenovationslist WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `propertyrenovationslist`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);

DELETE FROM activepropertybusinessmodel WHERE EANHotelID NOT IN (SELECT EANHotelID FROM activepropertylist);
ALTER TABLE `activepropertybusinessmodel`
  ADD CONSTRAINT FOREIGN KEY (`EANHotelID`) REFERENCES `activepropertylist` (`EANHotelID`);
