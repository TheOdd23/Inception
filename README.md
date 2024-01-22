The goal of this project was to set up a small docker network, comprised of a Wordpress service, a nginx server service and a mariadb database service, each with it's own container.
![image](https://github.com/TheOdd23/Inception/assets/100093373/82fbc93d-1c45-474a-81d2-af7cef4d1d12)

The catch, using existing images was prohibited, so we needed to create our own for every service, including their configuration files and small scripts to automate the creation of the database and the wordpress website.

The tricky part was to make sure everything worked together, in a coherent way.
