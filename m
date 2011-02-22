From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: merge of m68knommu and m68k arch branches?
Date: Tue, 22 Feb 2011 08:29:51 +0100
Message-ID: <20110222072951.GA24953@merkur.ravnborg.org>
References: <4D5DB83D.80205@snapgear.com>
	<alpine.LFD.2.00.1102212216540.2701@localhost6.localdomain6>
	<4D6319E0.9080907@snapgear.com>
	<AANLkTi=QkXK7=DQ5H1PFttTk+iug_npCsz112RYXd7BR@mail.gmail.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <uclinux-dev-bounces@uclinux.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=QkXK7=DQ5H1PFttTk+iug_npCsz112RYXd7BR@mail.gmail.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gregungerer@westnet.com.au>, Steven King <sfking00@yahoo.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, Thomas Gleixner <tglx@linutronix.de>, uClinux development list <uclinux-dev@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

> >
> >
> >> Is there a plan to move m68k to the generic facilities as well ?
> 
> Moving m68k to genirq is (the next thing?) on my list...

If I succeed migrating sparc32 to genirq I hope to be of a little help here.
It looks like a bigger task to migrate m68k than it was/is to migrate sparc32.

It would be _very_ nice to get the last two architectures migrated to genirq.

	Sam
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
