From: Thorsten Glaser <tg@mirbsd.de>
Subject: build warnings
Date: Thu, 13 Jan 2011 15:44:03 +0100
Message-ID: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:35003 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756090Ab1AMOoX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 13 Jan 2011 09:44:23 -0500
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1PdOPV-0003Mk-My
	for linux-m68k@vger.kernel.org; Thu, 13 Jan 2011 15:44:21 +0100
Received: from gate.tarent.de ([212.79.178.249])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Thu, 13 Jan 2011 15:44:21 +0100
Received: from tg by gate.tarent.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Thu, 13 Jan 2011 15:44:21 +0100
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi,

currently At wOrk, but here is something from the log:

  CALL    /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/sc=
ripts/checksyscalls.sh
<stdin>:1522:2: warning: #warning syscall recvmmsg not implemented

  CC      arch/m68k/mm/cache.o
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/mm=
/cache.c: In function 'flush_icache_range':
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/mm=
/cache.c:58: warning: 'mmusr' may be used uninitialized in this functio=
n
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/mm=
/cache.c:51: note: 'mmusr' was declared here

  CC      security/keys/keyctl.o
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/security/key=
s/keyctl.c:1346:2: warning: #warning TIF_NOTIFY_RESUME not implemented

  CC      drivers/ide/ide-io.o
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/ide/=
ide-io.c: In function 'ide_lock_host':
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/ide/=
ide-io.c:415: warning: passing argument 2 of '__constant_test_and_set_b=
it' discards qualifiers from pointer target type
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/in=
clude/asm/bitops_mm.h:30: note: expected 'long unsigned int *' but argu=
ment is of type 'volatile long unsigned int *'
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/ide/=
ide-io.c:415: warning: passing argument 2 of '__generic_test_and_set_bi=
t' discards qualifiers from pointer target type
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/in=
clude/asm/bitops_mm.h:42: note: expected 'long unsigned int *' but argu=
ment is of type 'volatile long unsigned int *'

  CC [M]  drivers/net/zorro8390.o
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/net/=
lib8390.c:256: warning: '__ei_tx_timeout' defined but not used
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/net/=
lib8390.c:302: warning: '__ei_start_xmit' defined but not used
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/net/=
lib8390.c:526: warning: '__ei_poll' defined but not used
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/net/=
lib8390.c:879: warning: '__ei_get_stats' defined but not used
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/net/=
lib8390.c:981: warning: '__ei_set_multicast_list' defined but not used
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/net/=
lib8390.c:1016: warning: '____alloc_ei_netdev' defined but not used
  CC [M]  drivers/net/eql.o
  CC [M]  drivers/net/a2065.o
  CC [M]  drivers/net/hydra.o
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/net/=
lib8390.c:256: warning: '__ei_tx_timeout' defined but not used
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/net/=
lib8390.c:302: warning: '__ei_start_xmit' defined but not used
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/net/=
lib8390.c:526: warning: '__ei_poll' defined but not used
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/net/=
lib8390.c:879: warning: '__ei_get_stats' defined but not used
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/net/=
lib8390.c:981: warning: '__ei_set_multicast_list' defined but not used
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/net/=
lib8390.c:1016: warning: '____alloc_ei_netdev' defined but not used

  CC [M]  drivers/parport/parport_pc.o
In file included from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/drivers/parport/parport_pc.c:67:
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/in=
clude/asm/parport.h:14:1: warning: "insl" redefined
In file included from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/arch/m68k/include/asm/io.h:4,
                 from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/include/linux/scatterlist.h:8,
                 from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/include/linux/dma-mapping.h:7,
                 from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/drivers/parport/parport_pc.c:54:
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/in=
clude/asm/io_mm.h:332:1: warning: this is the location of the previous =
definition
In file included from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/drivers/parport/parport_pc.c:67:
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/in=
clude/asm/parport.h:15:1: warning: "outsl" redefined
In file included from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/arch/m68k/include/asm/io.h:4,
                 from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/include/linux/scatterlist.h:8,
                 from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/include/linux/dma-mapping.h:7,
                 from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/drivers/parport/parport_pc.c:54:
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/in=
clude/asm/io_mm.h:335:1: warning: this is the location of the previous =
definition
In file included from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/drivers/parport/parport_pc.c:67:
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/in=
clude/asm/parport.h:14:1: warning: "insl" redefined
In file included from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/arch/m68k/include/asm/io.h:4,
                 from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/include/linux/scatterlist.h:8,
                 from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/include/linux/dma-mapping.h:7,
                 from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/drivers/parport/parport_pc.c:54:
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/in=
clude/asm/io_mm.h:332:1: warning: this is the location of the previous =
definition
In file included from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/drivers/parport/parport_pc.c:67:
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/in=
clude/asm/parport.h:15:1: warning: "outsl" redefined
In file included from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/arch/m68k/include/asm/io.h:4,
                 from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/include/linux/scatterlist.h:8,
                 from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/include/linux/dma-mapping.h:7,
                 from /tmp/buildd/linux-2.6-2.6.37/debian/build/source_=
m68k_none/drivers/parport/parport_pc.c:54:
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/in=
clude/asm/io_mm.h:335:1: warning: this is the location of the previous =
definition

  CC [M]  drivers/video/mb862xx/mb862xxfb.o
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/vide=
o/mb862xx/mb862xxfb.c:326: warning: 'mb862xxfb_init_fbinfo' defined but=
 not used
/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/vide=
o/mb862xx/mb862xxfb.c:464: warning: 'dev_attr_dispregs' defined but not=
 used


There are also a few that are probably Linux upstream warnings (but
then, I=E2=80=99m not surprised at these, 2.0 and 2.4 both had assemble=
r
warnings (indirect lcall without *) that got not fixed for years, so
nobody seems to care about warnings there=E2=80=A6). This is 2.6.37 (De=
bian
-1~experimental.1) plus for-linus and m68k-queue of yesterday. I also
discovered @Stephen that staging drivers are built again. In case you
are interested in the progress: preliminary deb source package is at
https://www.freewrt.org/~tg/debs68k/tmp/linux-2.6/

bye,
//mirabilos
--=20
15:41=E2=8E=9C<Lo-lan-do:#fusionforge> Somebody write a testsuite for h=
elloworld :-)
