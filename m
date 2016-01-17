From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: linux-m68k.org services status
Date: Sun, 17 Jan 2016 11:18:31 +0100
Message-ID: <CAMuHMdWRUdFdCoRJO++08i5=t6nK3mmZRpC91VcAbYXFYsqOWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-io0-f178.google.com ([209.85.223.178]:35440 "EHLO
	mail-io0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750808AbcAQKSc (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 17 Jan 2016 05:18:32 -0500
Received: by mail-io0-f178.google.com with SMTP id 77so493574888ioc.2
        for <linux-m68k@vger.kernel.org>; Sun, 17 Jan 2016 02:18:32 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>
Cc: Arno Griffioen <arno@ancienthardware.org>

Hi all,

I'd like to provide you with an update for the linux-m68k.org services.

All linux-m68k.org services have been moved from nerdnet.nl to Gandi.
This includes:
  1. The domain itself (this was already at Gandi before),
  2. DNS (service included with the domain).
     Old entries have been purged (e.g. the "black" subdomain),
defunct web mirrors
     now point to the main site.
  3. Email aliases (service included with the domain).
     Aliases have been updated/purged where appropriate.
  4. Web hosting:
       - http://www.linux-m68k.org/ and http://ftp.mac.linux-m68k.org/
         are now served by my company's SimpleHosting instance (also at Gandi),
         which had ample of free space.
         If anyone wants to actively maintain this, please let me know.
         Unfortunately I cannot offer direct access to the vhost, but as the
         main site is now in git (ftp.mac is still a bunch of files, as it has
         mostly historical importance), we could e.g. setup a pull/push system,
         or the site could just be hosted elsewhere.
       - http://mac.linux-m68k.org/ and http://www.mac.linux-m68k.org/ still
         point to the Linux/mac68k project at SourceForge.

Many thanks to Arno for maintaining linux-m68k.org for the past (almost) 20
years, and for keeping its registry alive for 10 more years!
(Of course we're aiming for 2038 and beyond ;-)

If you notice something wrong, please let Arno and me know.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
