From: Enver Haase <enver.haase@infraleap.com>
Subject: Trouble compiling stock Linux-3.0.8 for m68k using gcc-4.2.4
Date: Fri, 11 Nov 2011 20:25:43 +0100
Message-ID: <4EBD76B7.4010505@infraleap.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org



Geert wrote:
>Yes, I'm still the maintainer of the Linux/m68k kernel.
>I wasn't aware there's an issue with gcc-4.2. Can you please post the
>problem on the Debian/m68k or Linux/m68k mailing list?



Okay,

so I got a cross tool-chain set up on an x86_64 host.


Trying to compile a stock 3.0.8 kernel for the m68k architecture gives me:
  [...]
  CC [M]  lib/crc-ccitt.o
  CC [M]  lib/crc-itu-t.o
  CC [M]  lib/crc7.o
  CC [M]  lib/libcrc32c.o
  CC [M]  lib/bch.o
  CC [M]  lib/ts_kmp.o
  CC [M]  lib/ts_bm.o
  CC [M]  lib/ts_fsm.o
  CC [M]  lib/lru_cache.o
  LD      arch/m68k/lib/built-in.o
  CC      arch/m68k/lib/ashldi3.o
  CC      arch/m68k/lib/ashrdi3.o
  CC      arch/m68k/lib/checksum_mm.o
  CC      arch/m68k/lib/lshrdi3.o
  CC      arch/m68k/lib/memcpy.o
  CC      arch/m68k/lib/memmove.o
  CC      arch/m68k/lib/memset.o
  CC      arch/m68k/lib/muldi3.o
  CC      arch/m68k/lib/string.o
  CC      arch/m68k/lib/uaccess.o
  AR      arch/m68k/lib/lib.a
  LD      vmlinux.o
  MODPOST vmlinux.o
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
init/built-in.o: In function `init_post':
/home/ehaase/linux-3.0.8/init/main.c:746: undefined reference to
`free_initmem'
arch/m68k/kernel/built-in.o: In function `dma_sync_single_for_device':
/home/ehaase/linux-3.0.8/arch/m68k/kernel/dma_mm.c:78: undefined
reference to `cache_clear'
/home/ehaase/linux-3.0.8/arch/m68k/kernel/dma_mm.c:75: undefined
reference to `cache_push'
arch/m68k/mm/built-in.o: In function `mem_init':
/home/ehaase/linux-3.0.8/arch/m68k/mm/init_mm.c:116: undefined reference
to `init_pointer_table'
/home/ehaase/linux-3.0.8/arch/m68k/mm/init_mm.c:123: undefined reference
to `zero_pgtable'
/home/ehaase/linux-3.0.8/arch/m68k/mm/init_mm.c:116: undefined reference
to `init_pointer_table'
kernel/built-in.o: In function `pgd_alloc':
/home/ehaase/linux-3.0.8/arch/m68k/include/asm/motorola_pgalloc.h:89:
undefined reference to `get_pointer_table'
kernel/built-in.o: In function `pmd_free':
/home/ehaase/linux-3.0.8/arch/m68k/include/asm/motorola_pgalloc.h:72:
undefined reference to `free_pointer_table'
kernel/built-in.o: In function `relay_alloc_buf':
/home/ehaase/linux-3.0.8/kernel/relay.c:144: undefined reference to
`mm_cachebits'
mm/built-in.o: In function `pmd_alloc_one':
/home/ehaase/linux-3.0.8/arch/m68k/include/asm/motorola_pgalloc.h:67:
undefined reference to `get_pointer_table'
mm/built-in.o: In function `pmd_free':
/home/ehaase/linux-3.0.8/arch/m68k/include/asm/motorola_pgalloc.h:72:
undefined reference to `free_pointer_table'
mm/built-in.o: In function `__pmd_free_tlb':
/home/ehaase/linux-3.0.8/arch/m68k/include/asm/motorola_pgalloc.h:78:
undefined reference to `free_pointer_table'
/home/ehaase/linux-3.0.8/arch/m68k/include/asm/motorola_pgalloc.h:78:
undefined reference to `free_pointer_table'
mm/built-in.o: In function `__vmalloc_area_node':
/home/ehaase/linux-3.0.8/mm/vmalloc.c:1549: undefined reference to
`mm_cachebits'
mm/built-in.o: In function `vmalloc_32_user':
/home/ehaase/linux-3.0.8/mm/vmalloc.c:1820: undefined reference to
`mm_cachebits'
mm/built-in.o: In function `vmalloc_32':
/home/ehaase/linux-3.0.8/mm/vmalloc.c:1803: undefined reference to
`mm_cachebits'
mm/built-in.o: In function `vmalloc_exec':
/home/ehaase/linux-3.0.8/mm/vmalloc.c:1782: undefined reference to
`mm_cachebits'
mm/built-in.o: In function `vmalloc_node':
/home/ehaase/linux-3.0.8/mm/vmalloc.c:1740: undefined reference to
`mm_cachebits'
mm/built-in.o:/home/ehaase/linux-3.0.8/mm/vmalloc.c:1716: more undefined
references to `mm_cachebits' follow
lib/built-in.o: In function `pci_iounmap':
/home/ehaase/linux-3.0.8/lib/iomap.c:279: undefined reference to `iounmap'
lib/built-in.o: In function `ioremap_nocache':
/home/ehaase/linux-3.0.8/arch/m68k/include/asm/io_mm.h:289: undefined
reference to `__ioremap'
lib/built-in.o: In function `devm_ioremap_release':
/home/ehaase/linux-3.0.8/lib/devres.c:8: undefined reference to `iounmap'
lib/built-in.o: In function `devm_iounmap':
/home/ehaase/linux-3.0.8/lib/devres.c:82: undefined reference to `iounmap'
lib/built-in.o: In function `ioremap_nocache':
/home/ehaase/linux-3.0.8/arch/m68k/include/asm/io_mm.h:289: undefined
reference to `__ioremap'
lib/built-in.o: In function `ioremap':
/home/ehaase/linux-3.0.8/arch/m68k/include/asm/io_mm.h:285: undefined
reference to `__ioremap'
drivers/built-in.o: In function `ioremap_nocache':
/home/ehaase/linux-3.0.8/arch/m68k/include/asm/io_mm.h:289: undefined
reference to `__ioremap'
drivers/built-in.o: In function `serial8250_release_std_resource':
/home/ehaase/linux-3.0.8/drivers/tty/serial/8250.c:2617: undefined
reference to `iounmap'
drivers/built-in.o: In function `firmware_loading_store':
/home/ehaase/linux-3.0.8/drivers/base/firmware_class.c:251: undefined
reference to `mm_cachebits'
drivers/built-in.o: In function `ioremap_nocache':
/home/ehaase/linux-3.0.8/arch/m68k/include/asm/io_mm.h:289: undefined
reference to `__ioremap'
/home/ehaase/linux-3.0.8/arch/m68k/include/asm/io_mm.h:289: undefined
reference to `__ioremap'
make: *** [.tmp_vmlinux1] Error 1
ehaase@precious-lnx:~/linux-3.0.8$ m68k-unknown-linux-gnu-gcc --version
m68k-unknown-linux-gnu-gcc (GCC) 4.2.4
Copyright (C) 2007 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

ehaase@precious-lnx:~/linux-3.0.8$ m68k-unknown-linux-gnu-ld -V
GNU ld (GNU Binutils) 2.21.1
  Supported emulations:
   m68kelf
   m68klinux
ehaase@precious-lnx:~/linux-3.0.8$


Are there any patches for m68k somewhere?  I would certainly search more
thoroughly on the web, but since Geert didn't know there was an issue, I
just post the error here - hoping somebody nudges me in the right
direction. Please? :)


Regards,
Enver
