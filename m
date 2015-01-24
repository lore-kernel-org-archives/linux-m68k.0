From: Sam Protsenko <semen.protsenko@globallogic.com>
Subject: Re: [PATCH 0/4] defconfigs: cleanup obsolete MTD configs
Date: Sat, 24 Jan 2015 22:54:28 +0200
Message-ID: <CAJOTznWHpRh8ysVxwSWyvZL1UAe-G9A64j=M6z0+zPeoycgkDg__41200.6389852197$1422132899$gmane$org@mail.gmail.com>
References: <1422117213-3130-1-git-send-email-semen.protsenko@globallogic.com>
	<1422118156.27947.7.camel@x220>
Reply-To: semen.protsenko@globallogic.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1422118156.27947.7.camel@x220>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, Russell King <linux@arm.linux.org.uk>, adi-buildroot-devel@lists.sourceforge.net, linux-am33-list@redhat.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org

> That's news for me. I thought they are silently ignored. Do you have an
> example of such a warning?

Not really. It was just assumption. It seems you are right, they are just
ignored silently. But item 2 is still relevant and it was actually confused
me when I tried to figure out MTD configuration for my platform.
Anyway, garbage should be taken out from time to time.

> Seems like the kind of change that can only be reviewed by a script.

Good point. Because these patches were done by script to start with.
Anyway, I reviewed result patches manually to be completely sure.
You can write verifying script though, if you need to, it wouldn't take
more than 2 minutes (it takes one-liner, actually).

> I seem to remember Greg stating that defconfig files are on their way
> out. Did I remember that correctly?

Maybe they are. But they still in place, and why it's so, we should
maintain them up-to-date. Ideally, this kind of work should be done by
someone who introduces changes into Kconfig files. So I just fixed
that oversight.
