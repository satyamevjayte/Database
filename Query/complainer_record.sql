select concat(p.firstName,' ',p.Lastname) as 'Name',
c1.ContactNumber,c1.ContactEmail,
a.AddressLine1,a.AddressLine2,a.ZipCode,a.City,a.State,a.Country
from complainer c,person p,addresses a,contact c1
where 
p.PersonID=c.PersonID
and a.AddressID=c.AddressID
and c1.ContactID=c.ContactID