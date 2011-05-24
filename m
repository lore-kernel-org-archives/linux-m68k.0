From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: 8390 drivers (was: Re: Debian kernel 2.6.38-5)
Date: Tue, 24 May 2011 20:06:29 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1105241947160.206@ibook.intranet>
References: <BANLkTimG+3jqLiLaA_NVEpGg3LFtvK4bQQ@mail.gmail.com> <20110509213213.GA28675@chumley.earth.sol> <BANLkTik27HjWOF0s5HRqgva5zYzQRis27Q@mail.gmail.com> <20110510072928.GA32679@chumley.earth.sol> <20110523204414.GA10664@chumley.earth.sol>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20110523204414.GA10664@chumley.earth.sol>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Christian T. Steigies" <cts@debian.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>


It's a bit of a shot in the dark, but I'd try reversing this patch:
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=0c1aa20fb87b796d904f4d89ad12e5a0c483127b

If that doesn't help, you may have to bisect past the introduction of TLS 
(mainline 2.6.34) which means you'll need busybox or an old userland.

Finn


On Mon, 23 May 2011, Christian T. Steigies wrote:

> [   15.020000] eth0: Ariadne II at 0x00e90000, Ethernet Address 00:60:30:00:41:5b

> [  536.000000] eth0: trigger_send() called with the transmitter busy.
> [  536.260000] eth0: mismatched read page pointers  1 vs ff.
> [  536.270000] eth0: mismatched read page pointers  1 vs ff.
> [  536.280000] eth0: mismatched read page pointers  1 vs ff.
> [  536.290000] eth0: mismatched read page pointers  1 vs  0.
> [  536.300000] eth0: mismatched read page pointers 1d vs ff.
> [  536.310000] eth0: trigger_send() called with the transmitter busy.
> [  536.330000] eth0: mismatched read page pointers  5 vs ff.
> [  536.340000] eth0: mismatched read page pointers  1 vs 1f.
> [  536.350000] eth0: mismatched read page pointers  5 vs ff.
> [  536.360000] eth0: mismatched read page pointers  1 vs ff.
> [  536.370000] eth0: mismatched read page pointers  1 vs ff.
> [  536.390000] eth0: mismatched read page pointers  5 vs ff.
> [  536.400000] eth0: mismatched read page pointers  1 vs  0.
> [  536.410000] eth0: mismatched read page pointers  5 vs ff.
> [  536.420000] eth0: mismatched read page pointers  1 vs ff.
> [  536.430000] eth0: mismatched read page pointers  1 vs ff.
> [  536.440000] eth0: mismatched read page pointers  1 vs  0.
> [  536.460000] eth0: mismatched read page pointers  1 vs ff.
> [  536.470000] eth0: mismatched read page pointers  1 vs ff.
> [  536.480000] eth0: mismatched read page pointers  5 vs  0.
> [  536.490000] eth0: mismatched read page pointers  1 vs ff.
> ...
> this goes on and on for 25 seconds, until I rebooted the machine, it was
> completely unresponsive via the network and on the console.
> 
> Christian
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
