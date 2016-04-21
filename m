From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH] char: Drop bogus dependency of DEVPORT on !M68K
Date: Thu, 21 Apr 2016 11:15:17 +0200
Message-ID: <1461230117.2533.8.camel@tiscali.nl>
References: <1460364055-10174-1-git-send-email-geert@linux-m68k.org>
	 <5717DBCE.2000303@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5717DBCE.2000303@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ahs3@redhat.com, Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geoff Levand <geoff@infradead.org>, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On wo, 2016-04-20 at 13:43 -0600, Al Stone wrote:
> On 04/11/2016 02:40 AM, Geert Uytterhoeven wrote:
> > --- a/drivers/char/Kconfig
> > +++ b/drivers/char/Kconfig

> > config DEVPORT
> >  	bool
> > -	depends on !M68K
> >  	depends on ISA || PCI
> >  	default y

> This solves the particular problem I was running into on an arm64 AMD Seattle
> system.  Thanks!

That problem must be 
lkml.kernel.org/g/1459978040-2226-1-git-send-email-ahs3@redhat.com . Ie,
the fact that CONFIG_DEVPORT "cannot really be used and it allows us to
crash a kernel from user space" on arm64. 

> Tested-by: Al Stone <ahs3@redhat.com>

I fail to see how this patch helps your problem. And if one applies this
patch on top of v4.6-rc4 and does
    make ARCH=arm64 defconfig

one gets a .config that still has
    CONFIG_DEVPORT=y

So my guess is that it wasn't this patch that solved that arm64 problem.

Thanks,


Paul Bolle
