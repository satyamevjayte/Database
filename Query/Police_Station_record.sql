select ps.StationName,
a.AddressLine1,a.AddressLine2,a.ZipCode,a.City,a.State,a.Country,
c.ContactNumber,c.ContactEmail
from policestation ps,addresses a,contact c
where
ps.AddressID=a.AddressID
and ps.ContactID=c.ContactID