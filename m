From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-m68k.git
Date: Tue, 18 Nov 2008 21:59:12 +0100
Message-ID: <20081118205912.GA23894@uranus.ravnborg.org>
References: <Pine.LNX.4.64.0811182136060.27671@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0811182136060.27671@anakin>
Sender: linux-next-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, David Woodhouse <dwmw2@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Development <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Tue, Nov 18, 2008 at 09:49:01PM +0100, Geert Uytterhoeven wrote:
> (Finally) I created an experimental git tree for Linux/m68k:
> http://git.kernel.org/?p=linux/kernel/git/geert/linux-m68k.git
> 
> It contains more or less all patches I had in my quilt series at
> http://www.kernel.org/pub/linux/kernel/people/geert/linux-m68k-patches-2.6/
> A notable exception is m68k-PRIVATE-m68k-changes.diff, which hardcoded ARCH to
> m68k.
> 
> As suggested by David Woodhouse, I grouped the commits by topic. But unlike
> David's suggestion, I used topic branches, not topic repositories. Oh well,
> we'll see...
> 
> I also created for-next and for-linus branches. Do they look OK?
> 
> If I did something wrong, please let me know.
> This is still experimental stuff, which may be rebased if needed.
> 
> In addition, one day I may pull from Ralf's repository that reflects the state
> of Linux/m68k CVS a few commits before our server died...
> 
> Thanks for all your (past and future) help, suggestions, tips and tricks!

If you plan to keep it then it would be nice if
you could add a T: entry to MAINTAINERS.
This way we can find it again later...

	Sam
