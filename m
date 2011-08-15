From: lsorense@csclub.uwaterloo.ca (Lennart Sorensen)
Subject: Re: [PATCH] m68k: reorganize Kconfig options to
	improve mmu/non-mmu selections
Date: Mon, 15 Aug 2011 11:49:42 -0400
Message-ID: <20110815154942.GA15310@caffeine.csclub.uwaterloo.ca>
References: <1313039421-26075-1-git-send-email-gerg@snapgear.com>
	<20110811061522.GC21757@merkur.ravnborg.org>
	<4E437A0B.3030201@snapgear.com>
	<20110812043022.GB4940@cynthia.pants.nu>
	<4E486E0F.3080601@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <uclinux-dev-bounces@uclinux.org>
Content-Disposition: inline
In-Reply-To: <4E486E0F.3080601@snapgear.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: uClinux development list <uclinux-dev@uclinux.org>
Cc: Brad Boyer <flar@allandria.com>, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

On Mon, Aug 15, 2011 at 10:53:35AM +1000, Greg Ungerer wrote:
> Even if we remove these options now they can always be re-introduced
> if and when a driver that needs them is ready for mainline.

Didn't the Amiga 600 and 1200 have PCMCIA slots?  I have no idea if
those are supported.  I certainly don't have either of those (only some
500s and a 2000).

-- 
Len Sorensen
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
