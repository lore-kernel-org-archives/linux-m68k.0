From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [RFC] Get rid of SUBARCH
Date: Thu, 22 Aug 2013 12:42:56 +0000 (UTC)
Message-ID: <loom.20130822T144158-466@post.gmane.org>
References: <1377073172-3662-1-git-send-email-richard@nod.at> <CAMuHMdWk-EPTNmPB1O1+F7YVQLjhQsFJznYwA3t6UCGUU1T9PQ@mail.gmail.com> <20130821195157.GA18191@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:43406 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753327Ab3HVMnT (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 22 Aug 2013 08:43:19 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1VCUEP-000735-QB
	for linux-m68k@vger.kernel.org; Thu, 22 Aug 2013 14:43:17 +0200
Received: from fb-n15-11.unbelievable-machine.net ([94.198.62.204])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Thu, 22 Aug 2013 14:43:17 +0200
Received: from tg by fb-n15-11.unbelievable-machine.net with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Thu, 22 Aug 2013 14:43:17 +0200
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Sam Ravnborg <sam <at> ravnborg.org> writes:

> Today you can specify CROSS_COMPILE in Kconfig.

No, that=E2=80=99d involve modifying the kernel config.
The make commandline is just right, and make ARCH=3Dfoo
is not too much to type or remember, whereas=E2=80=A6 is it
CROSSCOMPILE=3D or CROSS-COMPILE=3D or CROSS=3D and did the
value have a dash at the end or not=E2=80=A6

bye,
//mirabilos
