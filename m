From: Brad Boyer <flar@allandria.com>
Subject: Re: [rtc-linux] Re: [PATCH/RFC 0/5] Generic RTC class driver
Date: Tue, 24 Feb 2009 17:14:26 -0800
Message-ID: <20090225011426.GB9362__31617.091006092$1235526642$gmane$org@cynthia.pants.nu>
References: <1235144809-32468-1-git-send-email-Geert.Uytterhoeven@sonycom.com> <20090220170454.04382e9e@i1501.lan.towertech.it> <alpine.LRH.2.00.0902231319170.22762@vixen.sonytel.be> <20090223160506.04e347c7@i1501.lan.towertech.it> <alpine.LRH.2.00.0902241848500.544@vixen.sonytel.be> <20090224193708.5f8be86c@i1501.lan.towertech.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090224193708.5f8be86c@i1501.lan.towertech.it>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alessandro Zummo <alessandro.zummo@towertech.it>
Cc: rtc-linux@googlegroups.com, Geert.Uytterhoeven@sonycom.com, Richard Zidlicky <rz@linux-m68k.org>, linux-parisc@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>, David@ozlabs.org, Kyle McMartin <kyle@mcmartin.ca>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Woodhouse <dwmw2@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Tue, Feb 24, 2009 at 07:37:08PM +0100, Alessandro Zummo wrote:
> On Tue, 24 Feb 2009 18:56:03 +0100 (CET)
> Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com> wrote:
> > Converting all (ca. 20?) ppc and m68k RTC support code into individual RTC
> > class drivers would add ca. 100+ lines of code for each individual driver.
> 
>  How different are all of those boards? It's simply a matter
>  of parameters and offsets? can we group them somehow?

I imagine we could cut down the numbers somewhat with clever code sharing,
but it's still going to be a fairly large number. I don't know all the
embedded boards, but just with all the Macintosh models there are at
least three and maybe four drastically different methods of RTC access,
and all of them are directly tied to some chip that does something else
completely unrelated. For one of them we don't even have a driver at the
moment.  They also are all custom chips that wouldn't be used anywhere
else. The other thing we need to keep in mind is that if we do it right
we can share drivers across m68k and powerpc in some cases.  I imagine
some of the embedded powerpc boards are using chips that are common in
other architectures as well.

	Brad Boyer
	flar@allandria.com

