From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Status of the FB drivers on m68k
Date: Tue, 10 Oct 2017 20:32:38 +0200
Message-ID: <2fd42624-7128-81e5-db7b-e7eed3eaa50c@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:36953 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932437AbdJJSck (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 10 Oct 2017 14:32:40 -0400
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>
Cc: Debian m68k <debian-68k@lists.debian.org>

Hi!

Does anyone of the kernel guys, especially Geert, know what the current status
of the framebuffer drivers on m68k is?

I am currently discussing the topic of usable graphics cards on Debian/m68k
on the German Amiga forum a1k.org since one user asked me [1] and he told
me that in the past, users could use CONFIG_FB_CYBER and CONFIG_FB_VIRGE
which both seem gone, sadly.

Also, the CONFIG_FB_PM2 driver is marked as broken [2].

Is there a chance to bring the CYBER and VIRGE drivers back? And maybe
get PM2 working on m68k?

Adrian

> [1] https://www.a1k.org/forum/showthread.php?p=1114311#41
> [2] https://github.com/torvalds/linux/blob/master/drivers/video/fbdev/Kconfig#L266

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
