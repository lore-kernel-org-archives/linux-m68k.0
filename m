From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [Question] How to print size_t type variable?
Date: Mon, 15 Dec 2014 18:32:18 +0900
Message-ID: <20141215183217.0529.AA925319@jp.panasonic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Andrew Murray <amurray@mpc-data.co.uk>, linux-m68k@lists.linux-m68k.org

Hi experts,

I read through Documentation/printk-formats.txt

It clearly says to use "%zu" or "%zx" to print size_t variables,
but I still have a question.


Assume we have code something like:

    printk("%zx", (size_t)10);


I think this code works fine as long as it includes
the compiler-provided <stddef.h>.

In the kernel space, however, <stddef.h> is never included.
Instead, size_t is defined by include/linux/types.h
and include/uapi/asm-generic/posix_types.h.


That is, size_t is defined independently from the compiler you are using,
although the compiler still decides which variable type is expected for the "%zx" format.
 
This causes compiler warnings for some compilers.

On bare-metal m68k toolchains, for example, size_t is "unsignd long",
whearas it is "unsigned int" on kernel.org m68k toolchains.


I see such warnings when I built the kernel with bare-metal m68k toolchains.


$ git describe 
v3.18
$ make ARCH=m68k  CROSS_COMPILE=m68k-elf-  defconfig all
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  SHIPPED scripts/kconfig/zconf.tab.c
  SHIPPED scripts/kconfig/zconf.lex.c
  SHIPPED scripts/kconfig/zconf.hash.c
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
*** Default configuration is based on 'multi_defconfig'
kernel/time/Kconfig:163:warning: range is invalid
#
# configuration written to .config
#

  [ snip ]

  LD      init/mounts.o
  CC      init/initramfs.o
init/initramfs.c: In function 'populate_rootfs':
init/initramfs.c:635:5: warning: format '%zd' expects argument of type 'signed size_t', but argument 2 has type 'ssize_t' [-Wformat]




Any advice?
How to fix this issue?




Best Regards
Masahiro Yamada
