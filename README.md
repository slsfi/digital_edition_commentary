**Docker Container for the Edith-commentary tool**

*NOTE!*

-	Change the default MySQL password in the docker-compose.yaml file.
-	You may also skip step #6 if you edith the edithusers file in /edith/edithusers before the step #3.
-	You can add new SVN users with the command in step #6.
-	You can also add new Edith-commentary tool users with the command in step #12. 


**Instructions**

1.	Clone the repository
2.	CD to the folder
3.	run: docker-compose build
4.	run: docker-compose up -d
5.	run: docker ps (copy container id for edithdocker_web and edithdocker_mysql-db)
6.	run: docker exec -it [container id for edithdocker_web] htpasswd -c -m /etc/apache2/edithusers svn_user
7.	Download a SVN client
8.	Do a SVN Checkout on http://[your ip]:8282/svn/documents
9.	run: docker exec -it [container id for edithdocker_mysql-db] docker exec -it [container id for edithdocker_mysql-db] mysql -u root -p edith
10. run (in mysql client started above #9): delete from user;
11.	Generare a SHA-1 password (e.g. http://www.sha1-online.com/)
12.	run (in mysql client started above #9): INSERT INTO `edith`.`user` (`firstName`, `password`, `profile`, `username`, `active`) VALUES ('svn_user', '[SHA-1 password]', 'User', 'svn_user', '1');
13.	Login to the Edith tool on http://[your ip]:8082/edith
14.	Add XML documents through the Edith-commentary tool or through SVN. 