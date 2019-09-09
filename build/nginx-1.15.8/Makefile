
default:	build

clean:
	rm -rf Makefile objs

build:
	$(MAKE) -f objs/Makefile

install:
	$(MAKE) -f objs/Makefile install

modules:
	$(MAKE) -f objs/Makefile modules

upgrade:
	/usr/local/snginx-1.1/nginx/sbin/nginx -t

	kill -USR2 `cat /usr/local/snginx-1.1/nginx/logs/nginx.pid`
	sleep 1
	test -f /usr/local/snginx-1.1/nginx/logs/nginx.pid.oldbin

	kill -QUIT `cat /usr/local/snginx-1.1/nginx/logs/nginx.pid.oldbin`
