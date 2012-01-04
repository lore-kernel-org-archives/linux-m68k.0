From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [RFC] m68k: Update defconfigs
Date: Wed, 4 Jan 2012 22:22:03 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1201042220180.16408@herc.mirbsd.org>
References: <alpine.DEB.2.00.1201042252450.15625@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:6514 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757084Ab2ADWZD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 4 Jan 2012 17:25:03 -0500
In-Reply-To: <alpine.DEB.2.00.1201042252450.15625@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: debian-68k@lists.debian.org

Geert Uytterhoeven dixit:

>    CONFIG_SERIAL_CONSOLE                : y . . . . . . . . . . y

This is something I'd like to see, if it is possible from
the hardware: ARAnym=E2=80=99s emulated parallel port for debugging
is unidirectional (printing only), so, in headless mode,
you get no console at all (for logging in to fix the network,
see that it hangs in fsck, etc).

Do the other devices not have a serial port?

bye,
//mirabilos
--=20
  =E2=80=9CHaving a smoking section in a restaurant is like having
          a peeing section in a swimming pool.=E2=80=9D
						-- Edward Burr
