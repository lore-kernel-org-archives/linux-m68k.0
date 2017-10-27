From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 2/4] m68k/mac: Disentangle VIA and OSS initialization
Date: Sat, 28 Oct 2017 09:23:11 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1710280914040.3@nippy.intranet>
References: <cover.1509071937.git.fthain@telegraphics.com.au> <683aede4ce8ad3e5d748a0913f0255bf6665ae87.1509071937.git.fthain@telegraphics.com.au> <CACz-3rgGZcdd3RZZm8Q7PxVtWsMmYLaXk_qEnb8LN2oUHSz6pQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:51310 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752218AbdJ0WXM (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 27 Oct 2017 18:23:12 -0400
In-Reply-To: <CACz-3rgGZcdd3RZZm8Q7PxVtWsMmYLaXk_qEnb8LN2oUHSz6pQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Kars de Jong <jongk@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 27 Oct 2017, Kars de Jong wrote:

> 2017-10-27 4:45 GMT+02:00 Finn Thain <fthain@telegraphics.com.au>:
> 
> > macintosh_config->via_type is meaningless on Mac IIfx (i.e. the only 
> > model with OSS chip), so skip the via_type switch statement.
> >
> > Call oss_init() before via_init() because it is more important and 
> > because that is the right place to initialize the oss_present flag.
> >
> > On this model, bringing forward oss_init() and delaying via_init() is 
> > no problem because those functions are independent.
> >
> > The only requirement here is that oss_register_interrupts() happens 
> > after via_init(). That is, mac_init_IRQ() happens after config_mac().
> >
> > Tested-by: Stan Johnson <userm57@yahoo.com>
> >
> 
> Was this tested on a Mac IIfx and on at least one other Mac?
> 

Yes, this works fine on IIfx and other Macs. And in theory, it should be 
safe to disable all OSS interrupts before messing with VIA1. (And if 
!oss_present, oss_init() does nothing anyway, so the sequence of calls 
unimportant.)

The comment implies that there is no better reason for the existing 
tangled code than "it seems more logical" (to that author anyway).

> 
> > Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> >
> 
> Reviewed-by: Kars de Jong <jongk@linux-m68k.org>
> 

Thanks for the review.

-- 

> 
> > ---
> >  arch/m68k/mac/config.c |  2 +-
> >  arch/m68k/mac/oss.c    |  8 ++++----
> >  arch/m68k/mac/via.c    | 32 +++++++++++++-------------------
> >  3 files changed, 18 insertions(+), 24 deletions(-)
> >
> > diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
> > index 22123f7e8f75..16cd5cea5207 100644
> > --- a/arch/m68k/mac/config.c
> > +++ b/arch/m68k/mac/config.c
> > @@ -898,8 +898,8 @@ static void __init mac_identify(void)
> >                 mac_bi_data.id, mac_bi_data.cpuid, mac_bi_data.memsize);
> >
> >         iop_init();
> > -       via_init();
> >         oss_init();
> > +       via_init();
> >         psc_init();
> >         baboon_init();
> >
> > diff --git a/arch/m68k/mac/oss.c b/arch/m68k/mac/oss.c
> > index ca84dcf41fc9..61906eb67d0f 100644
> > --- a/arch/m68k/mac/oss.c
> > +++ b/arch/m68k/mac/oss.c
> > @@ -31,18 +31,18 @@ volatile struct mac_oss *oss;
> >
> >  /*
> >   * Initialize the OSS
> > - *
> > - * The OSS "detection" code is actually in via_init() which is always
> > called
> > - * before us. Thus we can count on oss_present being valid on entry.
> >   */
> >
> >  void __init oss_init(void)
> >  {
> >         int i;
> >
> > -       if (!oss_present) return;
> > +       if (macintosh_config->ident != MAC_MODEL_IIFX)
> > +               return;
> >
> >         oss = (struct mac_oss *) OSS_BASE;
> > +       pr_debug("OSS detected at %p", oss);
> > +       oss_present = 1;
> >
> >         /* Disable all interrupts. Unlike a VIA it looks like we    */
> >         /* do this by setting the source's interrupt level to zero. */
> > diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
> > index 05021381af0b..19ad46ba4787 100644
> > --- a/arch/m68k/mac/via.c
> > +++ b/arch/m68k/mac/via.c
> > @@ -113,10 +113,6 @@ void via_debug_dump(void);
> >   * First we figure out where they actually _are_ as well as what type of
> >   * VIA we have for VIA2 (it could be a real VIA or an RBV or even an OSS.)
> >   * Then we pretty much clear them out and disable all IRQ sources.
> > - *
> > - * Note: the OSS is actually "detected" here and not in oss_init(). It
> > just
> > - *      seems more logical to do it here since via_init() needs to know
> > - *      these things anyways.
> >   */
> >
> >  void __init via_init(void)
> > @@ -124,21 +120,18 @@ void __init via_init(void)
> >         via1 = (void *)VIA1_BASE;
> >         pr_debug("VIA1 detected at %p\n", via1);
> >
> > -       switch(macintosh_config->via_type) {
> > +       if (oss_present) {
> > +               via2 = NULL;
> > +               rbv_present = 0;
> > +       } else {
> > +               switch (macintosh_config->via_type) {
> >
> >                 /* IIci, IIsi, IIvx, IIvi (P6xx), LC series */
> >
> >                 case MAC_VIA_IICI:
> > -                       if (macintosh_config->ident == MAC_MODEL_IIFX) {
> > -                               via2 = NULL;
> > -                               rbv_present = 0;
> > -                               oss_present = 1;
> > -                       } else {
> > -                               via2 = (void *) RBV_BASE;
> > -                               pr_debug("VIA2 (RBV) detected at %p\n",
> > via2);
> > -                               rbv_present = 1;
> > -                               oss_present = 0;
> > -                       }
> > +                       via2 = (void *)RBV_BASE;
> > +                       pr_debug("VIA2 (RBV) detected at %p\n", via2);
> > +                       rbv_present = 1;
> >                         if (macintosh_config->ident == MAC_MODEL_LCIII) {
> >                                 rbv_clear = 0x00;
> >                         } else {
> > @@ -160,15 +153,16 @@ void __init via_init(void)
> >                         via2 = (void *) VIA2_BASE;
> >                         pr_debug("VIA2 detected at %p\n", via2);
> >                         rbv_present = 0;
> > -                       oss_present = 0;
> >                         rbv_clear = 0x00;
> >                         gIER = vIER;
> >                         gIFR = vIFR;
> >                         gBufA = vBufA;
> >                         gBufB = vBufB;
> >                         break;
> > +
> >                 default:
> >                         panic("UNKNOWN VIA TYPE");
> > +               }
> >         }
> >
> >  #ifdef DEBUG_VIA
> > @@ -295,9 +289,9 @@ void via_debug_dump(void)
> >                 (uint) via1[vDirA], (uint) via1[vDirB], (uint) via1[vACR]);
> >         printk(KERN_DEBUG "         PCR = 0x%02X  IFR = 0x%02X IER =
> > 0x%02X\n",
> >                 (uint) via1[vPCR], (uint) via1[vIFR], (uint) via1[vIER]);
> > -       if (oss_present) {
> > -               printk(KERN_DEBUG "VIA2: <OSS>\n");
> > -       } else if (rbv_present) {
> > +       if (!via2)
> > +               return;
> > +       if (rbv_present) {
> >                 printk(KERN_DEBUG "VIA2:  IFR = 0x%02X  IER = 0x%02X\n",
> >                         (uint) via2[rIFR], (uint) via2[rIER]);
> >                 printk(KERN_DEBUG "      SIFR = 0x%02X SIER = 0x%02X\n",
> > --
> > 2.13.6
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> 
