From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Linux 3.1-2-m68k config (was: Re: Linux 3.10-2-m68k FPU support)
Date: Mon, 11 Nov 2013 14:20:04 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1311111418320.23723@herc.mirbsd.org>
References: <CAMuHMdXDDyzdy80gDvS-i96pMSgiCw9AJTD3ts=HaCwC26KWUw@mail.gmail.com>
 <alpine.LNX.2.00.1311111111320.10595@nippy.intranet>
 <Pine.BSM.4.64L.1311110108550.15024@herc.mirbsd.org>
 <alpine.LNX.2.00.1311111600420.13170@nippy.intranet>
 <CAMuHMdXKPDo-cNL5btcmy=4obz9WB2W=9BUxbu5m72UXDSyN_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from eurynome.mirbsd.org ([81.169.181.30]:38527 "EHLO
	eurynome.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753173Ab3KKOcn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 11 Nov 2013 09:32:43 -0500
Received: from herc.mirbsd.org (root@herc.mirbsd.org [IPv6:2a01:198:25d:0:202:b3ff:feb7:54e8])
	by eurynome.mirbsd.org (8.14.5.Beta0/8.14.3) with ESMTP id rABEWWoH020992
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-m68k@vger.kernel.org>; Mon, 11 Nov 2013 14:32:37 GMT
In-Reply-To: <CAMuHMdXKPDo-cNL5btcmy=4obz9WB2W=9BUxbu5m72UXDSyN_w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@telegraphics.com.au>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven dixit:

>On Mon, Nov 11, 2013 at 6:16 AM, Finn Thain <fthain@telegraphics.com.a=
u> wrote:
>>> > ! CONFIG_FB_SYS_COPYAREA                   : m n
>>> > ! CONFIG_FB_SYS_FILLRECT                   : m n
>>> > ! CONFIG_FB_SYS_FOPS                       : m n
>>> > ! CONFIG_FB_SYS_IMAGEBLIT                  : m n
>>> >
>>> >Would this prevent the macfb framebuffer console from working in t=
he
>>> >absence of kernel modules?

>> When something goes wrong, and the kernel messages aren't available =
to
>> tell you what went wrong, then you may lack the information you need=
 to

I see.

>> Hence I was trying to find an explanation for the screen shot posted=
,
>> which says "console [tty0] enabled" even though the macfb console di=
d not
>> appear.
>
>No, without fb/console support you wouldn't even see those.

OK.

>Indeed. Mac needs the CONFIG_FB_CFB_* counterparts.
>
>CONFIG_FB_SYS_* is for system RAM, while CONFIG_FB_CFB_*
>is for iomem. Not that it would matter much on m68k, m68k has no
>strict separation between both.

OK. So there needs to be no further change then those already
submitted to the Debian Linux maintainers in #728392 correct?

bye,
//mirabilos
--=20
=E2=80=9ECool, /usr/share/doc/mksh/examples/uhr.gz ist ja ein Grund,
mksh auf jedem System zu installieren.=E2=80=9C
	-- XTaran auf der OpenRheinRuhr, ganz begeistert
(EN: =E2=80=9C[=E2=80=A6]uhr.gz is a reason to install mksh on every sy=
stem.=E2=80=9D)
