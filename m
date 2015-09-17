From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH v2 3/4] m68k: Wire up direct ipc calls
Date: Thu, 17 Sep 2015 17:39:59 +0200
Message-ID: <mvmpp1hkqb4.fsf@hawking.suse.de>
References: <1442221006-2027-1-git-send-email-geert@linux-m68k.org>
	<1442221006-2027-4-git-send-email-geert__19660.9066486873$1442221083$gmane$org@linux-m68k.org>
	<mvma8slm7wd.fsf@hawking.suse.de>
	<CAMuHMdUncyXjxkS99SDTjx0-sU26jtCmFuHeU1=0DoqZL2AWvQ@mail.gmail.com>
	<mvmvbb9krpd.fsf@hawking.suse.de>
	<CAMuHMdW+An7Qa5Jt=JpHooy4Q9LopdKJWrpcJ0-0YsFi-i_FUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdW+An7Qa5Jt=JpHooy4Q9LopdKJWrpcJ0-0YsFi-i_FUQ@mail.gmail.com>
	(Geert Uytterhoeven's message of "Thu, 17 Sep 2015 17:18:53 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, Linux/m68k <linux-m68k@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Do we currently have architectures that use both sys_ipc and the direct
> syscalls, where keeping ipc_parse_version() in the direct syscalls is required?

IMHO it doesn't make sense to suport IPC_OLD via the direct syscalls,
even for those architectures that started with them in the first place.
There are quite a few architectures that define
ARCH_WANT_IPC_PARSE_VERSION even though they started life after IPC_64
was added.  They probably just forgot to adjust ipc/util.h back then.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
