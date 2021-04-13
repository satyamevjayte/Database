select concat(p.firstName,' ',p.Lastname) as 'Owner Name',
concat(pw.firstName,' ',pw.LastName) as 'Worker Name',
w.DateOfJoining,
w.DateOfResign as'Approx Date of Leaving',
c1.ContactNumber,c1.ContactEmail,
a.AddressLine1,a.AddressLine2,a.ZipCode,a.City,a.State,a.Country
from worker w, formverification f,complainer c,person p,person pw,addresses a,contact c1
where f.WorkerID=w.WorkerID
and c.ComplainerID=f.ComplainerID
and p.PersonID=c.PersonID
and pw.PersonID=w.PersonID
and a.AddressID=w.AddressID
and c1.ContactID=w.ContactID