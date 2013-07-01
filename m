From: Brad Boyer <flar@cynthia.pants.nu>
Subject: Re: [PATCH] m68k/mac: Allocate IOP message pool and queues
 dynamically
Date: Mon, 1 Jul 2013 14:59:32 -0700
Message-ID: <20130701215932.GA12663@cynthia.pants.nu>
References: <1372586542-1318-1-git-send-email-geert@linux-m68k.org>
 <alpine.LNX.2.00.1307011325520.9968@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1307011325520.9968@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Mon, Jul 01, 2013 at 05:46:48PM +1000, Finn Thain wrote:
> 
> On Sun, 30 Jun 2013, Geert Uytterhoeven wrote:
> 
> > -
> > -/*
> > - * Register the interrupt handler for the IOPs.
> > - * TODO: might be wrong for non-OSS machines. Anyone?
> > - */
> > -
> > -void __init iop_register_interrupts(void)
> > -{
> > -	if (iop_ism_present) {
> > +		/*
> > +		 * Register the interrupt handler for the IOPs.
> > +		 * TODO: might be wrong for non-OSS machines. Anyone?
> 
> My testing with a non-OSS machine (Quadra 950) indicates that the TODO is 
> obsolete. And the comment "register the interrupt handler for the IOPs" is 
> a bit silly. It merely re-phrases the code. Otherwise, this patch looks 
> good to me. Thanks.

The code was all originally written and tested only on the IIfx. That's
all JMT had, and at the time it was all I had as well. I have since
acquired a Quadra 950. Lots of these comments are just out of date. I
know it got tested on either a Quadra 900 or Quadra 950 after that
comment was put in the source.

	Brad Boyer
	flar@allandria.com
