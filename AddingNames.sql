DECLARE @i INT = 0;
WHILE @i < 25
BEGIN
   -- do something here
   DECLARE @student VARCHAR(8) = '';
   DECLARE @x INT = 0;
   SET @x = RAND()*5+3;
   
   WHILE @x > 0
   BEGIN
      DECLARE @y INT = 0;
	  SET @y = RAND()*26+65;
	  SET @student = @student + CHAR(@y);
	  SET @x = @x - 1;
   END;
   PRINT @student;
   -- Insert student into table (unique student)
   SET @student = '';
   SET @i = @i + 1;
END;


while i < 25
	x = random number between 3 and 8
	string student
	for x
		attach letters to student
	add student to list
	i++



	