From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: merge of m68knommu and m68k arch branches?
Date: Mon, 21 Feb 2011 22:18:42 +0100 (CET)
Message-ID: <alpine.LFD.2.00.1102212216540.2701@localhost6.localdomain6>
References: <4D5DB83D.80205@snapgear.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4D5DB83D.80205@snapgear.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Steven King <sfking00@yahoo.com>, uClinux development list <uclinux-dev@uclinux.org>, Greg Ungerer <gerg@uclinux.org>, Greg Ungerer <gregungerer@westnet.com.au>
List-Id: linux-m68k@vger.kernel.org

On Fri, 18 Feb 2011, Greg Ungerer wrote:
> Inside of the new arch/m68k is a little messy in the kernel and mm
> directories. There is plenty of scope for cleanup and merge on the
> files in here - but I want to leave that for follow up patches after
> this initial directory merge. As a data point, when we merged the
> m68k and m68knommu include files we had something like 70 or 80
> duplicate but separate files, after some cleanups that is now down to
> 10. Ongoing cleanup will merge some of these remaining ones as well.
> 
> Thoughts?

Hmm, how are you going to deal with the fact, that m68knommu uses
genirq, m68k not? I guess there are some more points like this
(clockevents, clocksource ...)

Is there a plan to move m68k to the generic facilities as well ?

Thanks,

	tglx
