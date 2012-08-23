From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [PATCH 1/3] Add support to broadcom 5222 PHY
Date: Thu, 23 Aug 2012 18:02:55 +0200
Message-ID: <20120823160255.GA32671@frolo.macqel>
References: <1345551531-15348-1-git-send-email-stany.marcel@novasys-ingenierie.com> <CAMuHMdUo5UPLtUhf6_GafMj_kEnM25k+XYszdwsGwkGyCUC6zw@mail.gmail.com> <CA+mBkFXnOB9hPoJVf6c92UuemqtLJwc2KW-G-ja6cG8VqLPZdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+mBkFXnOB9hPoJVf6c92UuemqtLJwc2KW-G-ja6cG8VqLPZdw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Thu, Aug 23, 2012 at 05:21:23PM +0200, Stany MARCEL wrote:
> On Thu, Aug 23, 2012 at 12:47 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Tue, Aug 21, 2012 at 2:18 PM, Stany MARCEL
> > <stany.marcel@novasys-ingenierie.com> wrote:
> >> Signed-off-by: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
> >> ---
> >>
> >>  This driver is an adaption of the one given by freescale for kernel 2.6.25.
> >>
> >>  Tested with kernel 3.4.8 with arch/m68k backported from linux-m68k head
> >>  2 FEC configured with shared phy
> >>
> >>  drivers/net/phy/Kconfig        |    7 +-
> >>  drivers/net/phy/Makefile       |    1 +
> >>  drivers/net/phy/broadcom522x.c |  171 ++++++++++++++++++++++++++++++++++++++++
> >
> > This patch and "[PATCH 3/3] Add support to M54xx DMA FEC Driver" need to go
> > through the netdev tree, or collect acks there.
> >
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
> 
> Hello Geert,
> 
> Please, what is the good process to follow as patch 3 depends on patch 1 ?

Actually, IMHO patch 3 does not depend on patch 1, and I even think that
patch 1 is not needed, except to get a message with "BCM5222" instead
of "Generic PHY" in the kernel log.

AFAIK the phy interface is standardized.

Philippe
