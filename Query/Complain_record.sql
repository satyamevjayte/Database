SELECT concat( cp.FirstName,' ',cp.LastName) as 'Complainer Name', 
cc.ContactNumber as 'Complainer Contact Number',cc.ContactEmail as 'Complainer Email',
c.Description,c.ComplainDateTime ,
concat( csp.FirstName,' ',csp.LastName)as 'Suspect Name',
ccs.ContactNumber as 'Suspect Contact Number',ccs.ContactEmail as 'Suspect Email'

FROM complain c,complainer c1,person cp,contact cc,crimesuspect cs,person csp,contact ccs
where
c.ComplainerID=c1.ComplainerID
and cp.PersonID=c1.PersonID 
and cc.ContactID=c1.ContactID
and ccs.ContactID=cs.ContactID
and cs.CrimeSuspectID=c.CrimeSuspectID
and csp.PersonID=cs.PersonID;