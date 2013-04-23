From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH/RFC] m68k: Add -ffreestanding to =?utf-8?b?S0JVSUxEX0NGTEFHUw==?=
Date: Tue, 23 Apr 2013 15:00:32 +0000 (UTC)
Message-ID: <loom.20130423T165848-570@post.gmane.org>
References: <1365585879-5321-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:39026 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755020Ab3DWPAs (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 23 Apr 2013 11:00:48 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1UUei5-0002KA-Lo
	for linux-m68k@vger.kernel.org; Tue, 23 Apr 2013 17:00:45 +0200
Received: from fb-n15-11.unbelievable-machine.net ([94.198.62.204])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Tue, 23 Apr 2013 17:00:45 +0200
Received: from tg by fb-n15-11.unbelievable-machine.net with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Tue, 23 Apr 2013 17:00:45 +0200
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Geert Uytterhoeven <geert <at> linux-m68k.org> writes:

> QUESTION: Should we re-enable -ffreestanding in the main Makefile ins=
tead?

+1

It is wrong to not compile a kernel or bootloader with -ffreestanding
(and -ffreestanding implying -fno-builtin is *also* correct; kernels
and bootloaders can use stuff like __builtin_strlen explicitly if/when
desired *and* aware of the side effects).

=46WIW, adding -ffreestanding to the kernel I inherited from OpenBSD
fixed several issues at once=E2=80=A6

bye,
//mirabilos
