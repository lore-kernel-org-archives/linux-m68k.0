From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: build warnings
Date: Fri, 14 Jan 2011 08:24:31 +1300
Message-ID: <AANLkTinkAfv0dFyH2yp05M4CwN=mPixHfKiXgLKrieWo@mail.gmail.com>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:58593 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751371Ab1AMTYd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 13 Jan 2011 14:24:33 -0500
Received: by wyb28 with SMTP id 28so2049561wyb.19
        for <linux-m68k@vger.kernel.org>; Thu, 13 Jan 2011 11:24:31 -0800 (PST)
In-Reply-To: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

Hi Thorsten,

On Fri, Jan 14, 2011 at 3:44 AM, Thorsten Glaser <tg@mirbsd.de> wrote:
> Hi,
>
> currently At wOrk, but here is something from the log:
>
> =A0CALL =A0 =A0/tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_=
none/scripts/checksyscalls.sh
> <stdin>:1522:2: warning: #warning syscall recvmmsg not implemented

I'm sure I have seen this one before.

> =A0CC =A0 =A0 =A0arch/m68k/mm/cache.o
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/=
mm/cache.c: In function 'flush_icache_range':
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/=
mm/cache.c:58: warning: 'mmusr' may be used uninitialized in this funct=
ion
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/=
mm/cache.c:51: note: 'mmusr' was declared here
>
> =A0CC =A0 =A0 =A0security/keys/keyctl.o
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/security/k=
eys/keyctl.c:1346:2: warning: #warning TIF_NOTIFY_RESUME not implemente=
d

Ditto.

>
> =A0CC =A0 =A0 =A0drivers/ide/ide-io.o
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/id=
e/ide-io.c: In function 'ide_lock_host':
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/id=
e/ide-io.c:415: warning: passing argument 2 of '__constant_test_and_set=
_bit' discards qualifiers from pointer target type
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/=
include/asm/bitops_mm.h:30: note: expected 'long unsigned int *' but ar=
gument is of type 'volatile long unsigned int *'
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/id=
e/ide-io.c:415: warning: passing argument 2 of '__generic_test_and_set_=
bit' discards qualifiers from pointer target type
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/=
include/asm/bitops_mm.h:42: note: expected 'long unsigned int *' but ar=
gument is of type 'volatile long unsigned int *'
>
> =A0CC [M] =A0drivers/net/zorro8390.o
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/ne=
t/lib8390.c:256: warning: '__ei_tx_timeout' defined but not used
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/ne=
t/lib8390.c:302: warning: '__ei_start_xmit' defined but not used
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/ne=
t/lib8390.c:526: warning: '__ei_poll' defined but not used
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/ne=
t/lib8390.c:879: warning: '__ei_get_stats' defined but not used
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/ne=
t/lib8390.c:981: warning: '__ei_set_multicast_list' defined but not use=
d
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/ne=
t/lib8390.c:1016: warning: '____alloc_ei_netdev' defined but not used
> =A0CC [M] =A0drivers/net/eql.o
> =A0CC [M] =A0drivers/net/a2065.o
> =A0CC [M] =A0drivers/net/hydra.o
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/ne=
t/lib8390.c:256: warning: '__ei_tx_timeout' defined but not used
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/ne=
t/lib8390.c:302: warning: '__ei_start_xmit' defined but not used
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/ne=
t/lib8390.c:526: warning: '__ei_poll' defined but not used
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/ne=
t/lib8390.c:879: warning: '__ei_get_stats' defined but not used
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/ne=
t/lib8390.c:981: warning: '__ei_set_multicast_list' defined but not use=
d
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/drivers/ne=
t/lib8390.c:1016: warning: '____alloc_ei_netdev' defined but not used
>
> =A0CC [M] =A0drivers/parport/parport_pc.o
> In file included from /tmp/buildd/linux-2.6-2.6.37/debian/build/sourc=
e_m68k_none/drivers/parport/parport_pc.c:67:
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/=
include/asm/parport.h:14:1: warning: "insl" redefined
> In file included from /tmp/buildd/linux-2.6-2.6.37/debian/build/sourc=
e_m68k_none/arch/m68k/include/asm/io.h:4,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /tmp/buildd/linux-2.6-2.6.37/deb=
ian/build/source_m68k_none/include/linux/scatterlist.h:8,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /tmp/buildd/linux-2.6-2.6.37/deb=
ian/build/source_m68k_none/include/linux/dma-mapping.h:7,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /tmp/buildd/linux-2.6-2.6.37/deb=
ian/build/source_m68k_none/drivers/parport/parport_pc.c:54:
> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/arch/m68k/=
include/asm/io_mm.h:332:1: warning: this is the location of the previou=
s definition

Looks OK - should only be used on Q40 though.

-- Michael
