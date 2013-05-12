From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: I/O macros redefined, inconsistent across m68k machdep headers
Date: Sun, 12 May 2013 16:17:43 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1305121616160.6805@herc.mirbsd.org>
References: <loom.20130511T171757-995@post.gmane.org> <518EED4F.7080702@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:41160 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754174Ab3ELQZ7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 12 May 2013 12:25:59 -0400
In-Reply-To: <518EED4F.7080702@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org

Michael Schmitz dixit:

> or just #undef anyway, since we can be fairly certain the previous #d=
efines

An #undef is always safe even if none has been made.

> What kernel versions are these?

>> /tmp/buildd/linux-3.8.12/arch/m68k/include/asm/io_mm.h:283:0:this is=
 the
                     ^^^^^^

As usual, when building Debian packages, I=E2=80=99m using whatever the
Debian Linux kernel team has uploaded to unstable.

(As a side note: will your Atari NIC drivers be in 3.8.10 vanilla?)

bye,
//mirabilos
--=20
Sorry,  I=E2=80=99m annoyed today and you came by as an Arch user. Thes=
e are the
perfect victims for any crime against humanity, like  systemd,  feminis=
m
or social democracy.
		-- Christoph Lohmann on dev@suckless.org
