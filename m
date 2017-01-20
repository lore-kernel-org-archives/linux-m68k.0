From: "Gideon D'souza" <gidisrael@gmail.com>
Subject: Re: [PATCH 2/2] m68k: replaced gcc specific macros with ones from compiler.h
Date: Fri, 20 Jan 2017 10:51:46 +0530
Message-ID: <CAPNrq4yryUFjG4TeHAFuG_zEvOyPq28GK6OcjpCQY5yhA-6Okw__14805.503775324$1484889760$gmane$org@mail.gmail.com>
References: <1484832930-7373-1-git-send-email-gidisrael@gmail.com> <201701200417.08H0rRwA%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <201701200417.08H0rRwA%fengguang.wu@intel.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

Geert,

I'm assuming this build failure is clear? It is breaking because it
depends on the first patch. I don't know if there is protocol for
sending dependent patches into the kernel?



On Fri, Jan 20, 2017 at 2:18 AM, kbuild test robot <lkp@intel.com> wrote:
> Hi Gideon,
>
> [auto build test ERROR on m68k/for-next]
> [also build test ERROR on v4.10-rc4 next-20170119]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Gideon-Israel-Dsouza/compiler-gcc-h-Added-new-macro-for-gcc-attribute/20170120-032332
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
> config: m68k-allmodconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 4.9.0
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=m68k
>
> All error/warnings (new ones prefixed by >>):
>
>    arch/m68k/emu/nfblock.c:51:1: note: in expansion of macro 'module_param'
>     module_param(major_num, int, 0);
>     ^
>    In file included from include/uapi/linux/stddef.h:1:0,
>                     from include/linux/stddef.h:4,
>                     from include/uapi/linux/posix_types.h:4,
>                     from include/uapi/linux/types.h:13,
>                     from include/linux/types.h:5,
>                     from include/linux/list.h:4,
>                     from include/linux/module.h:9,
>                     from arch/m68k/emu/nfblock.c:9:
>    include/linux/compiler-gcc.h:183:45: error: section attribute not allowed for '__UNIQUE_ID_major_numtype34'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                                 ^
>    include/linux/compiler.h:52:23: note: in definition of macro '___PASTE'
>     #define ___PASTE(a,b) a##b
>                           ^
>    include/linux/compiler-gcc.h:183:29: note: in expansion of macro '__PASTE'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                 ^
>    include/linux/compiler.h:53:22: note: in expansion of macro '___PASTE'
>     #define __PASTE(a,b) ___PASTE(a,b)
>                          ^
>    include/linux/compiler-gcc.h:183:37: note: in expansion of macro '__PASTE'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                         ^
>    include/linux/moduleparam.h:21:19: note: in expansion of macro '__UNIQUE_ID'
>     static const char __UNIQUE_ID(name)[]       \
>                       ^
>    include/linux/moduleparam.h:30:3: note: in expansion of macro '__MODULE_INFO'
>       __MODULE_INFO(parmtype, name##type, #name ":" _type)
>       ^
>    include/linux/moduleparam.h:148:2: note: in expansion of macro '__MODULE_PARM_TYPE'
>      __MODULE_PARM_TYPE(name, #type)
>      ^
>    include/linux/moduleparam.h:126:2: note: in expansion of macro 'module_param_named'
>      module_param_named(name, name, type, perm)
>      ^
>    arch/m68k/emu/nfblock.c:51:1: note: in expansion of macro 'module_param'
>     module_param(major_num, int, 0);
>     ^
>    include/linux/compiler-gcc.h:183:45: error: alignment may not be specified for '__UNIQUE_ID_major_numtype34'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                                 ^
>    include/linux/compiler.h:52:23: note: in definition of macro '___PASTE'
>     #define ___PASTE(a,b) a##b
>                           ^
>    include/linux/compiler-gcc.h:183:29: note: in expansion of macro '__PASTE'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                 ^
>    include/linux/compiler.h:53:22: note: in expansion of macro '___PASTE'
>     #define __PASTE(a,b) ___PASTE(a,b)
>                          ^
>    include/linux/compiler-gcc.h:183:37: note: in expansion of macro '__PASTE'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                         ^
>    include/linux/moduleparam.h:21:19: note: in expansion of macro '__UNIQUE_ID'
>     static const char __UNIQUE_ID(name)[]       \
>                       ^
>    include/linux/moduleparam.h:30:3: note: in expansion of macro '__MODULE_INFO'
>       __MODULE_INFO(parmtype, name##type, #name ":" _type)
>       ^
>    include/linux/moduleparam.h:148:2: note: in expansion of macro '__MODULE_PARM_TYPE'
>      __MODULE_PARM_TYPE(name, #type)
>      ^
>    include/linux/moduleparam.h:126:2: note: in expansion of macro 'module_param_named'
>      module_param_named(name, name, type, perm)
>      ^
>    arch/m68k/emu/nfblock.c:51:1: note: in expansion of macro 'module_param'
>     module_param(major_num, int, 0);
>     ^
>    arch/m68k/emu/nfblock.c:53:1: warning: empty declaration
>     struct nfhd_device {
>     ^
>    arch/m68k/emu/nfblock.c:63:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>     {
>     ^
>    arch/m68k/emu/nfblock.c:84:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>     {
>     ^
>    arch/m68k/emu/nfblock.c:94:45: error: storage class specified for parameter 'nfhd_ops'
>     static const struct block_device_operations nfhd_ops = {
>                                                 ^
>    arch/m68k/emu/nfblock.c:94:21: error: parameter 'nfhd_ops' is initialized
>     static const struct block_device_operations nfhd_ops = {
>                         ^
>    arch/m68k/emu/nfblock.c:96:12: error: 'nfhd_getgeo' undeclared (first use in this function)
>      .getgeo = nfhd_getgeo,
>                ^
>    arch/m68k/emu/nfblock.c:96:12: note: each undeclared identifier is reported only once for each function it appears in
>    arch/m68k/emu/nfblock.c:100:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>     {
>     ^
>    arch/m68k/emu/nfblock.c:156:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>     {
>     ^
>    arch/m68k/emu/nfblock.c:180:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>     {
>     ^
>    In file included from arch/m68k/emu/nfblock.c:9:0:
>>> include/linux/module.h:131:2: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>      { return initfn; }     \
>      ^
>    arch/m68k/emu/nfblock.c:193:1: note: in expansion of macro 'module_init'
>     module_init(nfhd_init);
>     ^
>>> include/linux/module.h:131:2: warning: 'alias' attribute ignored [-Wattributes]
>      { return initfn; }     \
>      ^
>    arch/m68k/emu/nfblock.c:193:1: note: in expansion of macro 'module_init'
>     module_init(nfhd_init);
>     ^
>    arch/m68k/emu/nfblock.c:193:23: error: expected declaration specifiers before ';' token
>     module_init(nfhd_init);
>                           ^
>    In file included from arch/m68k/emu/nfblock.c:9:0:
>    include/linux/module.h:137:2: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>      { return exitfn; }     \
>      ^
>    arch/m68k/emu/nfblock.c:194:1: note: in expansion of macro 'module_exit'
>     module_exit(nfhd_exit);
>     ^
>    include/linux/module.h:137:2: warning: 'alias' attribute ignored [-Wattributes]
>      { return exitfn; }     \
>      ^
>    arch/m68k/emu/nfblock.c:194:1: note: in expansion of macro 'module_exit'
>     module_exit(nfhd_exit);
>     ^
>    arch/m68k/emu/nfblock.c:194:23: error: expected declaration specifiers before ';' token
>     module_exit(nfhd_exit);
>                           ^
>    In file included from include/uapi/linux/stddef.h:1:0,
>                     from include/linux/stddef.h:4,
>                     from include/uapi/linux/posix_types.h:4,
>                     from include/uapi/linux/types.h:13,
>                     from include/linux/types.h:5,
>                     from include/linux/list.h:4,
>                     from include/linux/module.h:9,
>                     from arch/m68k/emu/nfblock.c:9:
>    include/linux/compiler-gcc.h:183:45: error: storage class specified for parameter '__UNIQUE_ID_license37'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                                 ^
>    include/linux/compiler.h:52:23: note: in definition of macro '___PASTE'
>     #define ___PASTE(a,b) a##b
>                           ^
>    include/linux/compiler-gcc.h:183:29: note: in expansion of macro '__PASTE'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                 ^
>    include/linux/compiler.h:53:22: note: in expansion of macro '___PASTE'
>     #define __PASTE(a,b) ___PASTE(a,b)
>                          ^
>    include/linux/compiler-gcc.h:183:37: note: in expansion of macro '__PASTE'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                         ^
>    include/linux/moduleparam.h:21:19: note: in expansion of macro '__UNIQUE_ID'
>     static const char __UNIQUE_ID(name)[]       \
>                       ^
>    include/linux/module.h:161:32: note: in expansion of macro '__MODULE_INFO'
>     #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
>                                    ^
>    include/linux/module.h:199:34: note: in expansion of macro 'MODULE_INFO'
>     #define MODULE_LICENSE(_license) MODULE_INFO(license, _license)
>                                      ^
>    arch/m68k/emu/nfblock.c:196:1: note: in expansion of macro 'MODULE_LICENSE'
>     MODULE_LICENSE("GPL");
>     ^
>    arch/m68k/emu/nfblock.c:196:1: error: parameter '__UNIQUE_ID_license37' is initialized
>    arch/m68k/emu/nfblock.c:196:1: warning: '__used__' attribute ignored [-Wattributes]
>    In file included from include/uapi/linux/stddef.h:1:0,
>                     from include/linux/stddef.h:4,
>                     from include/uapi/linux/posix_types.h:4,
>                     from include/uapi/linux/types.h:13,
>                     from include/linux/types.h:5,
>                     from include/linux/list.h:4,
>                     from include/linux/module.h:9,
>                     from arch/m68k/emu/nfblock.c:9:
>    include/linux/compiler-gcc.h:183:45: error: section attribute not allowed for '__UNIQUE_ID_license37'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                                 ^
>    include/linux/compiler.h:52:23: note: in definition of macro '___PASTE'
>     #define ___PASTE(a,b) a##b
>                           ^
>    include/linux/compiler-gcc.h:183:29: note: in expansion of macro '__PASTE'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                 ^
>    include/linux/compiler.h:53:22: note: in expansion of macro '___PASTE'
>     #define __PASTE(a,b) ___PASTE(a,b)
>                          ^
>    include/linux/compiler-gcc.h:183:37: note: in expansion of macro '__PASTE'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                         ^
>    include/linux/moduleparam.h:21:19: note: in expansion of macro '__UNIQUE_ID'
>     static const char __UNIQUE_ID(name)[]       \
>                       ^
>    include/linux/module.h:161:32: note: in expansion of macro '__MODULE_INFO'
>     #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
>                                    ^
>    include/linux/module.h:199:34: note: in expansion of macro 'MODULE_INFO'
>     #define MODULE_LICENSE(_license) MODULE_INFO(license, _license)
>                                      ^
>    arch/m68k/emu/nfblock.c:196:1: note: in expansion of macro 'MODULE_LICENSE'
>     MODULE_LICENSE("GPL");
>     ^
>    include/linux/compiler-gcc.h:183:45: error: alignment may not be specified for '__UNIQUE_ID_license37'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                                 ^
>    include/linux/compiler.h:52:23: note: in definition of macro '___PASTE'
> --
>    In file included from arch/m68k/emu/nfcon.c:20:0:
>    arch/m68k/include/asm/natfeat.h: In function 'nfprint':
>    arch/m68k/include/asm/natfeat.h:21:2: error: expected declaration specifiers before '__print'
>      __print(1, 2);
>      ^
>    arch/m68k/emu/nfcon.c:22:12: error: storage class specified for parameter 'stderr_id'
>     static int stderr_id;
>                ^
>    arch/m68k/emu/nfcon.c:23:24: error: storage class specified for parameter 'nfcon_tty_port'
>     static struct tty_port nfcon_tty_port;
>                            ^
>    arch/m68k/emu/nfcon.c:24:27: error: storage class specified for parameter 'nfcon_tty_driver'
>     static struct tty_driver *nfcon_tty_driver;
>                               ^
>    arch/m68k/emu/nfcon.c:27:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>     {
>     ^
>    arch/m68k/emu/nfcon.c:45:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>     {
>     ^
>    arch/m68k/emu/nfcon.c:50:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>     {
>     ^
>    arch/m68k/emu/nfcon.c:55:23: error: storage class specified for parameter 'nf_console'
>     static struct console nf_console = {
>                           ^
>    arch/m68k/emu/nfcon.c:55:15: error: parameter 'nf_console' is initialized
>     static struct console nf_console = {
>                   ^
>    arch/m68k/emu/nfcon.c:57:11: error: 'nfcon_write' undeclared (first use in this function)
>      .write = nfcon_write,
>               ^
>    arch/m68k/emu/nfcon.c:57:11: note: each undeclared identifier is reported only once for each function it appears in
>    arch/m68k/emu/nfcon.c:58:12: error: 'nfcon_device' undeclared (first use in this function)
>      .device = nfcon_device,
>                ^
>    arch/m68k/emu/nfcon.c:65:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>     {
>     ^
>    arch/m68k/emu/nfcon.c:70:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>     {
>     ^
>    arch/m68k/emu/nfcon.c:75:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>     {
>     ^
>    arch/m68k/emu/nfcon.c:81:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>     {
>     ^
>    arch/m68k/emu/nfcon.c:89:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>     {
>     ^
>    arch/m68k/emu/nfcon.c:93:36: error: storage class specified for parameter 'nfcon_tty_ops'
>     static const struct tty_operations nfcon_tty_ops = {
>                                        ^
>    arch/m68k/emu/nfcon.c:93:21: error: parameter 'nfcon_tty_ops' is initialized
>     static const struct tty_operations nfcon_tty_ops = {
>                         ^
>    arch/m68k/emu/nfcon.c:94:11: error: 'nfcon_tty_open' undeclared (first use in this function)
>      .open  = nfcon_tty_open,
>               ^
>    arch/m68k/emu/nfcon.c:95:12: error: 'nfcon_tty_close' undeclared (first use in this function)
>      .close  = nfcon_tty_close,
>                ^
>    arch/m68k/emu/nfcon.c:96:12: error: 'nfcon_tty_write' undeclared (first use in this function)
>      .write  = nfcon_tty_write,
>                ^
>    arch/m68k/emu/nfcon.c:97:14: error: 'nfcon_tty_put_char' undeclared (first use in this function)
>      .put_char = nfcon_tty_put_char,
>                  ^
>    arch/m68k/emu/nfcon.c:98:16: error: 'nfcon_tty_write_room' undeclared (first use in this function)
>      .write_room = nfcon_tty_write_room,
>                    ^
>    arch/m68k/emu/nfcon.c:122:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>     {
>     ^
>    arch/m68k/emu/nfcon.c:159:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>     {
>     ^
>    In file included from arch/m68k/emu/nfcon.c:9:0:
>>> include/linux/module.h:131:2: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>      { return initfn; }     \
>      ^
>    arch/m68k/emu/nfcon.c:166:1: note: in expansion of macro 'module_init'
>     module_init(nfcon_init);
>     ^
>>> include/linux/module.h:131:2: warning: 'alias' attribute ignored [-Wattributes]
>      { return initfn; }     \
>      ^
>    arch/m68k/emu/nfcon.c:166:1: note: in expansion of macro 'module_init'
>     module_init(nfcon_init);
>     ^
>    arch/m68k/emu/nfcon.c:166:24: error: expected declaration specifiers before ';' token
>     module_init(nfcon_init);
>                            ^
>    In file included from arch/m68k/emu/nfcon.c:9:0:
>    include/linux/module.h:137:2: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
>      { return exitfn; }     \
>      ^
>    arch/m68k/emu/nfcon.c:167:1: note: in expansion of macro 'module_exit'
>     module_exit(nfcon_exit);
>     ^
>    include/linux/module.h:137:2: warning: 'alias' attribute ignored [-Wattributes]
>      { return exitfn; }     \
>      ^
>    arch/m68k/emu/nfcon.c:167:1: note: in expansion of macro 'module_exit'
>     module_exit(nfcon_exit);
>     ^
>    arch/m68k/emu/nfcon.c:167:24: error: expected declaration specifiers before ';' token
>     module_exit(nfcon_exit);
>                            ^
>    In file included from include/uapi/linux/stddef.h:1:0,
>                     from include/linux/stddef.h:4,
>                     from include/uapi/linux/posix_types.h:4,
>                     from include/uapi/linux/types.h:13,
>                     from include/linux/types.h:5,
>                     from include/linux/list.h:4,
>                     from include/linux/module.h:9,
>                     from arch/m68k/emu/nfcon.c:9:
>    include/linux/compiler-gcc.h:183:45: error: storage class specified for parameter '__UNIQUE_ID_license16'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                                 ^
>    include/linux/compiler.h:52:23: note: in definition of macro '___PASTE'
>     #define ___PASTE(a,b) a##b
>                           ^
>    include/linux/compiler-gcc.h:183:29: note: in expansion of macro '__PASTE'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                 ^
>    include/linux/compiler.h:53:22: note: in expansion of macro '___PASTE'
>     #define __PASTE(a,b) ___PASTE(a,b)
>                          ^
>    include/linux/compiler-gcc.h:183:37: note: in expansion of macro '__PASTE'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                         ^
>    include/linux/moduleparam.h:21:19: note: in expansion of macro '__UNIQUE_ID'
>     static const char __UNIQUE_ID(name)[]       \
>                       ^
>    include/linux/module.h:161:32: note: in expansion of macro '__MODULE_INFO'
>     #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
>                                    ^
>    include/linux/module.h:199:34: note: in expansion of macro 'MODULE_INFO'
>     #define MODULE_LICENSE(_license) MODULE_INFO(license, _license)
>                                      ^
>    arch/m68k/emu/nfcon.c:169:1: note: in expansion of macro 'MODULE_LICENSE'
>     MODULE_LICENSE("GPL");
>     ^
>    arch/m68k/emu/nfcon.c:169:1: error: parameter '__UNIQUE_ID_license16' is initialized
>    arch/m68k/emu/nfcon.c:169:1: warning: '__used__' attribute ignored [-Wattributes]
>    In file included from include/uapi/linux/stddef.h:1:0,
>                     from include/linux/stddef.h:4,
>                     from include/uapi/linux/posix_types.h:4,
>                     from include/uapi/linux/types.h:13,
>                     from include/linux/types.h:5,
>                     from include/linux/list.h:4,
>                     from include/linux/module.h:9,
>                     from arch/m68k/emu/nfcon.c:9:
>    include/linux/compiler-gcc.h:183:45: error: section attribute not allowed for '__UNIQUE_ID_license16'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                                 ^
>    include/linux/compiler.h:52:23: note: in definition of macro '___PASTE'
>     #define ___PASTE(a,b) a##b
>                           ^
>    include/linux/compiler-gcc.h:183:29: note: in expansion of macro '__PASTE'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                 ^
>    include/linux/compiler.h:53:22: note: in expansion of macro '___PASTE'
>     #define __PASTE(a,b) ___PASTE(a,b)
>                          ^
>    include/linux/compiler-gcc.h:183:37: note: in expansion of macro '__PASTE'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                         ^
>    include/linux/moduleparam.h:21:19: note: in expansion of macro '__UNIQUE_ID'
>     static const char __UNIQUE_ID(name)[]       \
>                       ^
>    include/linux/module.h:161:32: note: in expansion of macro '__MODULE_INFO'
>     #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
>                                    ^
>    include/linux/module.h:199:34: note: in expansion of macro 'MODULE_INFO'
>     #define MODULE_LICENSE(_license) MODULE_INFO(license, _license)
>                                      ^
>    arch/m68k/emu/nfcon.c:169:1: note: in expansion of macro 'MODULE_LICENSE'
>     MODULE_LICENSE("GPL");
>     ^
>    include/linux/compiler-gcc.h:183:45: error: alignment may not be specified for '__UNIQUE_ID_license16'
>     #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                                 ^
>    include/linux/compiler.h:52:23: note: in definition of macro '___PASTE'
> ..
>
> vim +131 include/linux/module.h
>
> 0fd972a7 Paul Gortmaker 2015-05-01  125  #define console_initcall(fn)           module_init(fn)
> 0fd972a7 Paul Gortmaker 2015-05-01  126  #define security_initcall(fn)          module_init(fn)
> 0fd972a7 Paul Gortmaker 2015-05-01  127
> 0fd972a7 Paul Gortmaker 2015-05-01  128  /* Each module must use one module_init(). */
> 0fd972a7 Paul Gortmaker 2015-05-01  129  #define module_init(initfn)                                    \
> 0fd972a7 Paul Gortmaker 2015-05-01  130         static inline initcall_t __inittest(void)               \
> 0fd972a7 Paul Gortmaker 2015-05-01 @131         { return initfn; }                                      \
> 0fd972a7 Paul Gortmaker 2015-05-01  132         int init_module(void) __attribute__((alias(#initfn)));
> 0fd972a7 Paul Gortmaker 2015-05-01  133
> 0fd972a7 Paul Gortmaker 2015-05-01  134  /* This is only required if you want to be unloadable. */
>
> :::::: The code at line 131 was first introduced by commit
> :::::: 0fd972a7d91d6e15393c449492a04d94c0b89351 module: relocate module_init from init.h to module.h
>
> :::::: TO: Paul Gortmaker <paul.gortmaker@windriver.com>
> :::::: CC: Paul Gortmaker <paul.gortmaker@windriver.com>
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
