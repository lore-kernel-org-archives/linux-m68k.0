From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Linux 3.1-2-m68k config
Date: Mon, 21 Oct 2013 09:03:02 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1310210900100.3018@herc.mirbsd.org>
References: <CAMuHMdXDDyzdy80gDvS-i96pMSgiCw9AJTD3ts=HaCwC26KWUw@mail.gmail.com>
 <alpine.LNX.2.00.1310211538010.21434@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from eurynome.mirbsd.org ([81.169.181.30]:1710 "EHLO
	eurynome.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753992Ab3JUJHV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 21 Oct 2013 05:07:21 -0400
Received: from herc.mirbsd.org (root@herc.mirbsd.org [IPv6:2a01:198:25d:0:202:b3ff:feb7:54e8])
	by eurynome.mirbsd.org (8.14.5.Beta0/8.14.3) with ESMTP id r9L978wQ024795
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-m68k@vger.kernel.org>; Mon, 21 Oct 2013 09:07:13 GMT
In-Reply-To: <alpine.LNX.2.00.1310211538010.21434@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

=46inn Thain dixit:

>CONFIG_ADB_MACIISI is disabled in -multi due to crashing bugs. Debian=20
>might want to do the same (until I get a chance to fix it). The serial=
=20

OK, thanks.

>Below is the same list after sort -k4 -k5 -k2. Note that some modules =
in=20
>-multi are disabled in the Debian config. That may or may not help you=
=20

Some do, yes.

>! CONFIG_DEFAULT_IOSCHED                   : "noop" "cfq"

size

>! CONFIG_FAT_DEFAULT_IOCHARSET             : "utf8" "iso8859-1"
>! CONFIG_NLS_DEFAULT                       : "utf8" "iso8859-1"

by design

>! CONFIG_LOGO_LINUX_CLUT224                : . y
>! CONFIG_LOGO_LINUX_MONO                   : . y
>! CONFIG_LOGO_LINUX_VGA16                  : . y
>! CONFIG_LOGO_MAC_CLUT224                  : . y

I never liked those boot logos tbh, and Debian disables them too.

>! CONFIG_ROOT_NFS                          : . y

by design (we use initrd)

>! CONFIG_SUN3LANCE                         : . y
>! CONFIG_SUN3X_ESP                         : . y

I think Sun3 support can=E2=80=99t coexist with the others, or at
least I=E2=80=99ve read about it. Anyway, I didn=E2=80=99t even enable =
all
platforms in the Debian kernel.

But if you think I should change any more than the three
already listed (fpu, brk, CONFIG_ADB_MACIISI) please say
so. (Though the bit about users triggering things is also
true.)

bye,
//mirabilos
--=20
<diogenese> Beware of ritual lest you forget the meaning behind it.
<igli> yeah but it means if you really care about something, don't
    ritualise it, or you will lose it. don't fetishise it, don't
    obsess. or you'll forget why you love it in the first place.
