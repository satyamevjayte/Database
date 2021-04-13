select per.FirstName,
per.LastName,per.DateOfBirth,per.Gender,per.PersonImage,
c.ContactNumber,c.ContactEmail,
a.AddressLine1,a.AddressLine2,a.ZipCode,a.City,a.State,a.Country,
r.RoleName, 
p.PoliceCardImage,
s.StationName
from police p,policerole r,policestation s,person per,addresses a,contact c
where p.RoleID=r.RoleID 
and p.PoliceStationID=s.PoliceStationID
and per.PersonID=p.PersonID
and p.AddressID=a.AddressID
and p.ContactID=c.ContactID