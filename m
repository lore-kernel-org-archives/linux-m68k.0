From: Steven King <sfking@fdwdc.com>
Subject: Re: [PATCH 4/4] Implement gpio support for m54xx.
Date: Wed, 21 May 2014 19:51:54 -0700
Message-ID: <201405211951.54548.sfking@fdwdc.com>
References: <1400713233-9155-1-git-send-email-sfking@fdwdc.com> <1400713233-9155-5-git-send-email-sfking@fdwdc.com> <537D51C8.10908@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp106.biz.mail.gq1.yahoo.com ([98.137.12.181]:21418 "HELO
	smtp106.biz.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1750965AbaEVC6f (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 21 May 2014 22:58:35 -0400
In-Reply-To: <537D51C8.10908@uclinux.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: geert@linux-m68k.org, linux-m68k@vger.kernel.org

On Wednesday 21 May 2014 6:24:24 pm Greg Ungerer wrote:
> On 22/05/14 09:00, sfking@fdwdc.com wrote:
> > From: Steven King <sfking@fdwdc.com>
> > 
> > ---
> >  arch/m68k/include/asm/m54xxsim.h |   12 +++++++++---
> >  arch/m68k/include/asm/mcfgpio.h  |   12 ++++++++----
> >  2 files changed, 17 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/m68k/include/asm/m54xxsim.h b/arch/m68k/include/asm/m54xxsim.h
> > index d3bd838..a5fbd17 100644
> > --- a/arch/m68k/include/asm/m54xxsim.h
> > +++ b/arch/m68k/include/asm/m54xxsim.h
> > @@ -55,9 +55,15 @@
> >  /*
> >   *	Generic GPIO support
> >   */
> > -#define MCFGPIO_PIN_MAX		0	/* I am too lazy to count */
> > -#define MCFGPIO_IRQ_MAX		-1
> > -#define MCFGPIO_IRQ_VECBASE	-1
> > +#define MCFGPIO_PODR		(MCF_MBAR + 0xA00)
> > +#define MCFGPIO_PDDR		(MCF_MBAR + 0xA10)
> > +#define MCFGPIO_PPDR		(MCF_MBAR + 0xA20)
> > +#define MCFGPIO_SETR		(MCF_MBAR + 0xA20)
> > +#define MCFGPIO_CLRR		(MCF_MBAR + 0xA30)
> > +
> > +#define MCFGPIO_PIN_MAX		136	/* 128 gpio + 8 eport */
> > +#define MCFGPIO_IRQ_MAX		8
> > +#define MCFGPIO_IRQ_VECBASE	MCFINT_VECBASE
> >  
> >  /*
> >   *	EDGE Port support.
> > diff --git a/arch/m68k/include/asm/mcfgpio.h b/arch/m68k/include/asm/mcfgpio.h
> > index c41ebf4..66203c3 100644
> > --- a/arch/m68k/include/asm/mcfgpio.h
> > +++ b/arch/m68k/include/asm/mcfgpio.h
> > @@ -139,7 +139,8 @@ static inline void gpio_free(unsigned gpio)
> >  
> >  #if defined(CONFIG_M520x) || defined(CONFIG_M523x) || \
> >      defined(CONFIG_M527x) || defined(CONFIG_M528x) || \
> > -    defined(CONFIG_M53xx) || defined(CONFIG_M5441x)
> > +    defined(CONFIG_M53xx) || defined(CONFIG_M54xx) || \
> > +    defined(CONFIG_M5441x)
> >  /*
> >   * These parts have an 'Edge' Port module (external interrupt/GPIO) which uses
> >   * read-modify-write to change an output and a GPIO module which has separate
> > @@ -195,7 +196,8 @@ static inline u32 __mcfgpio_ppdr(unsigned gpio)
> >  		return MCFSIM2_GPIO1READ;
> >  #elif defined(CONFIG_M520x) || defined(CONFIG_M523x) || \
> >        defined(CONFIG_M527x) || defined(CONFIG_M528x) || \
> > -      defined(CONFIG_M53xx) || defined(CONFIG_M5441x)
> > +      defined(CONFIG_M53xx) || defined(CONFIG_M54xx) || \
> > +      defined(CONFIG_M5441x)
> 
> Not proposing for this patch... But I wonder if this could be done
> a little more cleanly by basing the #elif on the presence of the
> MCFEPORT_EPPDR definition.
> 
> Same goes for the other #ifdef/#elif clauses.
> 
> Just a thought.

Hmm, I like this. I like the idea of a check for the presence of a feature rather than a config option there, then all that would be needed to add support for a new processor  (m54445?) would be to make sure the correct definitions are present in the m5xxxsim.h.  I'll take a look at it...
