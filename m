From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 6/7] powerpc: Hook up rtc-generic, and kill rtc-ppc
Date: Wed, 11 Mar 2009 15:15:23 +1100
Message-ID: <1236744923.7086.41.camel@pasglop>
References: <1236605183-22718-1-git-send-email-Geert.Uytterhoeven@sonycom.com>
	 <1236605183-22718-2-git-send-email-Geert.Uytterhoeven@sonycom.com>
	 <1236605183-22718-3-git-send-email-Geert.Uytterhoeven@sonycom.com>
	 <1236605183-22718-4-git-send-email-Geert.Uytterhoeven@sonycom.com>
	 <1236605183-22718-5-git-send-email-Geert.Uytterhoeven@sonycom.com>
	 <1236605183-22718-6-git-send-email-Geert.Uytterhoeven@sonycom.com>
	 <1236605183-22718-7-git-send-email-Geert.Uytterhoeven@sonycom.com>
	 <1236607181.572.180.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1236607181.572.180.camel@macbook.infradead.org>
Sender: linux-parisc-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, linux-m68k@vger.kernel.org, Alessandro Zummo <alessandro.zummo@towertech.it>, rtc-linux@googlegroups.com, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>, linuxppc-dev@ozlabs.org, Paul Mundt <lethal@linux-sh.org>, Dann Frazier <dannf@dannf.org>
List-Id: linux-m68k@vger.kernel.org

On Mon, 2009-03-09 at 13:59 +0000, David Woodhouse wrote:
> On Mon, 2009-03-09 at 14:26 +0100, Geert Uytterhoeven wrote:
> > PowerPC has been a long time user of the generic RTC abstraction, so hook up
> > rtc-generic:
> >   - Create the "rtc-generic" platform device if ppc_md.get_rtc_time is set,
> >   - Kill rtc-ppc, as rtc-generic offers the same functionality in a more
> >     generic way, and supports autoloading through udev.
> > 
> > Signed-off-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
> 
> Acked-By: David Woodhouse <David.Woodhouse@intel.com>

Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>


