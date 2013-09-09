From: Thorsten Glaser <tg@mirbsd.de>
Subject: Missing =?utf-8?b?Z2V0X2N5Y2xlcygp?= has effect on quality of entropy
Date: Mon, 9 Sep 2013 09:27:52 +0000 (UTC)
Message-ID: <loom.20130909T112514-903@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:34515 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750871Ab3IIJ2N (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 9 Sep 2013 05:28:13 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1VIxlS-0005x9-Uh
	for linux-m68k@vger.kernel.org; Mon, 09 Sep 2013 11:28:11 +0200
Received: from fb-n15-11.unbelievable-machine.net ([94.198.62.204])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 09 Sep 2013 11:28:10 +0200
Received: from tg by fb-n15-11.unbelievable-machine.net with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 09 Sep 2013 11:28:10 +0200
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi!

https://lists.openwrt.org/pipermail/openwrt-devel/2013-September/021318=
=2Ehtml
affects several architectures =E2=80=93 m68k among them.

Some arches have comments like =E2=80=9Conly used by the scheduler=E2=80=
=9D. This may
have been once true, but a quick =E2=80=9Cgit grep -w get_cycles=E2=80=9D=
 shows much
more use throughout the Linux kernel.

The random thing is scary already, but=E2=80=A6
mm/slub.c:      p +=3D 64 + (get_cycles() & 0xff) * sizeof(void *);
=E2=80=A6 there are several cases like this, where an always-zero get_c=
ycles()
result severely impacts operation of the code.

So I ask whether it=E2=80=99s possible to fill this code with life, for=
 at
least a subset of all architectures?

bye,
//mirabilos
