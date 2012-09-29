From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: ICE
Date: Sat, 29 Sep 2012 17:26:27 +0000 (UTC)
Message-ID: <loom.20120929T192533-151@post.gmane.org>
References: <CAMuHMdU9ezFb2x5Fgzaqkg-OjmiCS8+j5uHFZA3cSc8DroLh6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:38845 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756873Ab2I2R0l (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 29 Sep 2012 13:26:41 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1TI0oN-0002gq-7p
	for linux-m68k@vger.kernel.org; Sat, 29 Sep 2012 19:26:43 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sat, 29 Sep 2012 19:26:43 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sat, 29 Sep 2012 19:26:43 +0200
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Geert Uytterhoeven <geert <at> linux-m68k.org> writes:

> --includedir=3D/usr/m68k-linux-gnu/include --build=3Dx86_64-linux-gnu
> --host=3Dx86_64-linux-gnu --target=3Dm68k-linux-gnu
> Thread model: posix
> gcc version 4.1.2 20061115 (prerelease) (Ubuntu 4.1.1-21)

Ouch!

> Yeah, I know it's an old compiler...

Would it help were I to rebuild my gcc-4.6 cross-compiler for you
on/targetting=E2=80=A6 I guess Ubuntu lucid?

bye,
//mirabilos
