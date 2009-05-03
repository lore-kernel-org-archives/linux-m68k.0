From: Lance Tagliapietra <lancetag@Luminet.net>
Subject: m68k 2.6.26-1 vs 2.4.30 comparison
Date: Sun, 3 May 2009 02:28:14 -0500
Message-ID: <20090503072811.GB3179@luminet.net>
Reply-To: lancetag@luminet.net
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org

Hello,

I've (finally) been moving my Amiga 2000/030/16M system to a 2.6 series kernel.
I have started with the 2.6.26 that I downlaoded from [1] because it had support for NFS.
I have also used git to pull the sources for m68k 2.6.29 and am working on compiling the 
smallest footprint kernel for my hardware.

Observations:
a). I 2.4.30 kernel compile was about 6 hours on this hardware (GCC 2.95.4).  The 2.6.29
took 4 days (GCC 4.1.2, Debian).  That was without the modules, too.  Now, it did select
the config option for smallest code size, and perhaps that is not well supported for m68k
and also added to the compile time. Make was done as nice -n 17 but the system is mostly 
idle, otherwise, but that is how I compile the 2.4.30.

b). My custom 2.4.30 kernel size is about 750K uncompressed. With setting the options to
remove support for hardware that I don't have and features that I don't need, I still 
came up with a kernel of 2.7M.  The goal is to have the smallest footprint kernel possible.

c). The 2.6.26 kernel seems to want to keep more memory free and hit the swap much more
than the 2.4.30 kernel according to vmstat.  Under 2.4.30 I see the free memory go as low
as about 200K, and it will remain at that level as long as is necessary.  Under 2.6.26,
the free memory stays at about 800K, and if it drops below that, it will come back to that
level relatively quickly.

d). The real time clock came up on the worng month, going from 2.4.30 to 2.6.26 (or 28),
March vs April, in this case.

Questions:

e). Is there an option which tells the kernel the minimum amount of free RAM to maintain 
as I describe in (c) above?  RAM is relatively precious in my m68k environment, and having
500k being held in reserve seems a bit much?

f). The kernel config gives options for 3 schedulers. Does anyone here know which gives the 
smallest memory footprint?

Thanks,

--Lance

[1] http://people.debian.org/~smarenka/



