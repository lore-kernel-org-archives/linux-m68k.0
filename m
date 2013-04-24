From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH/RFC] m68k: Add -ffreestanding to =?utf-8?b?S0JVSUxEX0NGTEFHUw==?=
Date: Wed, 24 Apr 2013 12:01:31 +0000 (UTC)
Message-ID: <loom.20130424T140004-252@post.gmane.org>
References: <1365585879-5321-1-git-send-email-geert@linux-m68k.org> <51653C5D.4060408@suse.cz> <CAMuHMdXEvLMz5rRjQrhENxJ6UHRnPCtzyNg=hqitspuY88G7sA@mail.gmail.com> <20130410122611.GB17541@sepie.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:42917 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932388Ab3DXMBt (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 24 Apr 2013 08:01:49 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1UUyOQ-0000T9-8c
	for linux-m68k@vger.kernel.org; Wed, 24 Apr 2013 14:01:46 +0200
Received: from fb-n15-11.unbelievable-machine.net ([94.198.62.204])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Wed, 24 Apr 2013 14:01:46 +0200
Received: from tg by fb-n15-11.unbelievable-machine.net with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Wed, 24 Apr 2013 14:01:46 +0200
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Michal Marek <mmarek <at> suse.cz> writes:

> exported strcpy symbol. An I would naively assume, that if the compil=
er
> sees a static inline definition of a function, then it will not gener=
ate
> a function call. Although, the C standard does require the standard

=E2=80=9CIf the compiler sees=E2=80=9D but the thing is, the compiler d=
oes not see
a call to strlen, but a call to strncat and replaces that in-tree.

> library functions be available as external functions, so the compiler

Only for hosted environments.

Which is why -ffreestanding is the only correct thing to do.

bye,
//mirabilos
