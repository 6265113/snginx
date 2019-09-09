.PHONY: all install clean

all:
	cd /root/openresty-1.15.8.1/build/LuaJIT-2.1-20190507 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_ENABLE_GC64 -msse4.2' CC=cc PREFIX=/usr/local/snginx-1.1/luajit
	cd /root/openresty-1.15.8.1/build/lua-cjson-2.1.0.7 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/root/openresty-1.15.8.1/build/luajit-root/usr/local/snginx-1.1/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/snginx-1.1/lualib LUA_MODULE_DIR=/usr/local/snginx-1.1/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd /root/openresty-1.15.8.1/build/lua-resty-signal-0.02 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/root/openresty-1.15.8.1/build/luajit-root/usr/local/snginx-1.1/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/snginx-1.1/lualib CC=cc
	cd /root/openresty-1.15.8.1/build/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/root/openresty-1.15.8.1/build/luajit-root/usr/local/snginx-1.1/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/snginx-1.1/lualib CC=cc
	cd /root/openresty-1.15.8.1/build/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/root/openresty-1.15.8.1/build/luajit-root/usr/local/snginx-1.1/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/snginx-1.1/lualib CC=cc
	cd /root/openresty-1.15.8.1/build/nginx-1.15.8 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/snginx-1.1/
	-cp /root/openresty-1.15.8.1/COPYRIGHT $(DESTDIR)/usr/local/snginx-1.1/
	cd /root/openresty-1.15.8.1/build/LuaJIT-2.1-20190507 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_ENABLE_GC64 -msse4.2' CC=cc PREFIX=/usr/local/snginx-1.1/luajit DESTDIR=$(DESTDIR)
	cd /root/openresty-1.15.8.1/build/lua-cjson-2.1.0.7 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/root/openresty-1.15.8.1/build/luajit-root/usr/local/snginx-1.1/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/snginx-1.1/lualib LUA_MODULE_DIR=/usr/local/snginx-1.1/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd /root/openresty-1.15.8.1/build/lua-resty-signal-0.02 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/root/openresty-1.15.8.1/build/luajit-root/usr/local/snginx-1.1/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/snginx-1.1/lualib CC=cc
	cd /root/openresty-1.15.8.1/build/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/root/openresty-1.15.8.1/build/luajit-root/usr/local/snginx-1.1/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/snginx-1.1/lualib CC=cc
	cd /root/openresty-1.15.8.1/build/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/root/openresty-1.15.8.1/build/luajit-root/usr/local/snginx-1.1/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/snginx-1.1/lualib CC=cc
	cd /root/openresty-1.15.8.1/build/lua-resty-dns-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/snginx-1.1/lualib INSTALL=/root/openresty-1.15.8.1/build/install
	cd /root/openresty-1.15.8.1/build/lua-resty-memcached-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/snginx-1.1/lualib INSTALL=/root/openresty-1.15.8.1/build/install
	cd /root/openresty-1.15.8.1/build/lua-resty-redis-0.27 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/snginx-1.1/lualib INSTALL=/root/openresty-1.15.8.1/build/install
	cd /root/openresty-1.15.8.1/build/lua-resty-mysql-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/snginx-1.1/lualib INSTALL=/root/openresty-1.15.8.1/build/install
	cd /root/openresty-1.15.8.1/build/lua-resty-string-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/snginx-1.1/lualib INSTALL=/root/openresty-1.15.8.1/build/install
	cd /root/openresty-1.15.8.1/build/lua-resty-upload-0.10 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/snginx-1.1/lualib INSTALL=/root/openresty-1.15.8.1/build/install
	cd /root/openresty-1.15.8.1/build/lua-resty-websocket-0.07 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/snginx-1.1/lualib INSTALL=/root/openresty-1.15.8.1/build/install
	cd /root/openresty-1.15.8.1/build/lua-resty-lock-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/snginx-1.1/lualib INSTALL=/root/openresty-1.15.8.1/build/install
	cd /root/openresty-1.15.8.1/build/lua-resty-lrucache-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/snginx-1.1/lualib INSTALL=/root/openresty-1.15.8.1/build/install
	cd /root/openresty-1.15.8.1/build/lua-resty-core-0.1.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/snginx-1.1/lualib INSTALL=/root/openresty-1.15.8.1/build/install
	cd /root/openresty-1.15.8.1/build/lua-resty-upstream-healthcheck-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/snginx-1.1/lualib INSTALL=/root/openresty-1.15.8.1/build/install
	cd /root/openresty-1.15.8.1/build/lua-resty-limit-traffic-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/snginx-1.1/lualib INSTALL=/root/openresty-1.15.8.1/build/install
	cd /root/openresty-1.15.8.1/build/lua-resty-shell-0.02 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/snginx-1.1/lualib INSTALL=/root/openresty-1.15.8.1/build/install
	cd /root/openresty-1.15.8.1/build/lua-tablepool-0.01 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/snginx-1.1/lualib INSTALL=/root/openresty-1.15.8.1/build/install
	cd /root/openresty-1.15.8.1/build/opm-0.0.5 && /root/openresty-1.15.8.1/build/install bin/* $(DESTDIR)/usr/local/snginx-1.1/bin/
	cd /root/openresty-1.15.8.1/build/resty-cli-0.24 && /root/openresty-1.15.8.1/build/install bin/* $(DESTDIR)/usr/local/snginx-1.1/bin/
	cp /root/openresty-1.15.8.1/build/resty.index $(DESTDIR)/usr/local/snginx-1.1/
	cp -r /root/openresty-1.15.8.1/build/pod $(DESTDIR)/usr/local/snginx-1.1/
	cd /root/openresty-1.15.8.1/build/nginx-1.15.8 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/snginx-1.1/site/lualib $(DESTDIR)/usr/local/snginx-1.1/site/pod $(DESTDIR)/usr/local/snginx-1.1/site/manifest
	ln -sf /usr/local/snginx-1.1/nginx/sbin/nginx $(DESTDIR)/usr/local/snginx-1.1/bin/openresty

clean:
	rm -rf build
