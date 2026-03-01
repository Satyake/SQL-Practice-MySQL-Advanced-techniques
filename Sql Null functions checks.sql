-- NULL FUNCTIONS


select * from contacts;

-- return null values

select * from contacts where email is null;

select * from contacts where email is not  null;

select name, email ,
case when email is not null then email
else 'No Email' end as contact_email
from contacts

-- COALESCE
select name, coalesce(email, alt_email) as contact_email
from contacts;












-- Create a contacts table
CREATE TABLE contacts (
    name VARCHAR(50),
    email VARCHAR(100),
    alt_email VARCHAR(100)
);

INSERT INTO contacts (name, email, alt_email) VALUES
('Anna', 'anna@example.com', NULL),
('Bob', NULL, 'bob.alt@example.com'),
('Charlie', NULL, NULL),
('David', 'david@example.com', 'david.alt@example.com');


