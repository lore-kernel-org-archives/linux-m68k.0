From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 0/4] defconfigs: cleanup obsolete MTD configs
Date: Wed, 28 Jan 2015 12:04:34 +1100
Message-ID: <1422407074.32234.2.camel__28378.8000037477$1422407090$gmane$org@ellerman.id.au>
References: <1422117213-3130-1-git-send-email-semen.protsenko@globallogic.com>
	 <1422118156.27947.7.camel@x220>
	 <CAJOTznWHpRh8ysVxwSWyvZL1UAe-G9A64j=M6z0+zPeoycgkDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAJOTznWHpRh8ysVxwSWyvZL1UAe-G9A64j=M6z0+zPeoycgkDg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: semen.protsenko@globallogic.com
Cc: Paul Bolle <pebolle@tiscali.nl>, linux-mips@linux-mips.org, Brian Norris <computersforpeace@gmail.com>, Russell King <linux@arm.linux.org.uk>, linux-sh@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Hans-Christian Egtvedt <egtvedt@samfundet.no>, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-am33-list@redhat.com, Geert Uytterhoeven <geert@linux-m68k.org>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, linux-mtd@lists.infradead.org, Guan Xuetao <gxt@mprc.pku.edu.cn>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org, Haavard Skinnemoen <hskinnemoen@gmail.com>

On Sat, 2015-01-24 at 22:54 +0200, Sam Protsenko wrote:
> > That's news for me. I thought they are silently ignored. Do you have an
> > example of such a warning?
> 
> Not really. It was just assumption. It seems you are right, they are just
> ignored silently. But item 2 is still relevant and it was actually confused
> me when I tried to figure out MTD configuration for my platform.
> Anyway, garbage should be taken out from time to time.

The usual way that this gets dealt with is that arch maintainers (ir)regularly
run make savedefconfig on all their defconfigs.

As it happens we've done that on powerpc just recently, if you rebase onto next
you should see that, so you can drop the powerpc hunks from your patches. 

cheers
