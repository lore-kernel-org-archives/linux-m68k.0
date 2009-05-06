From: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Subject: Re: m68k 2.6.26-1 vs 2.4.30 comparison
Date: Wed, 6 May 2009 08:44:41 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.0905060843160.14304@firda.kolla.no>
References: <20090503072811.GB3179@luminet.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20090503072811.GB3179@luminet.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Lance Tagliapietra <lancetag@Luminet.net>
Cc: linux-m68k@lists.linux-m68k.org

On Sun, 3 May 2009, Lance Tagliapietra wrote:

> Observations:
> a). I 2.4.30 kernel compile was about 6 hours on this hardware (GCC 2.95.4).  The 2.6.29
> took 4 days (GCC 4.1.2, Debian).  That was without the modules, too.  Now, it did select
> the config option for smallest code size, and perhaps that is not well supported for m68k
> and also added to the compile time. Make was done as nice -n 17 but the system is mostly
> idle, otherwise, but that is how I compile the 2.4.30.

Most of the times is spent "entering directory bla; : nothing to do here;
leaving directory bla" - 2.6 is much bigger in terms of number of
directories/files to parse through, and on slow IO that certainly matters :)

> b). My custom 2.4.30 kernel size is about 750K uncompressed. With setting the options to
> remove support for hardware that I don't have and features that I don't need, I still
> came up with a kernel of 2.7M.  The goal is to have the smallest footprint kernel possible.

My amiga kernel, which is not optimized for size, has ipv6 and lots of stuff,,
is 2170192 bytes, stripped. I suspect you have not stripped yours?

> c). The 2.6.26 kernel seems to want to keep more memory free and hit the swap much more
> than the 2.4.30 kernel according to vmstat.  Under 2.4.30 I see the free memory go as low
> as about 200K, and it will remain at that level as long as is necessary.  Under 2.6.26,
> the free memory stays at about 800K, and if it drops below that, it will come back to that
> level relatively quickly.

What does "sysctl vm.min_free_kbytes" say?
Here it says "vm.min_free_kbytes = 1763"

> d). The real time clock came up on the worng month, going from 2.4.30 to
> 2.6.26 (or 28), March vs April, in this case.

Hm, this sounds familiar, allthough I cant pinpoint it.

> e). Is there an option which tells the kernel the minimum amount of free RAM to maintain
> as I describe in (c) above?  RAM is relatively precious in my m68k environment, and having
> 500k being held in reserve seems a bit much?

I'd try with "sysctl -w vm.min_free_kbytes=500" and see if that helps.
If it does, make it permanent by adding it to /etc/sysctl.conf

> f). The kernel config gives options for 3 schedulers. Does anyone here know which gives the
> smallest memory footprint?

I'm clueless on this one.

-- kolla

