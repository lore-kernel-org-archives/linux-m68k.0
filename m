From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: merge of m68knommu and m68k arch branches?
Date: Mon, 21 Feb 2011 22:57:19 +0100
Message-ID: <20110221215719.GA24535@merkur.ravnborg.org>
References: <4D5DB83D.80205@snapgear.com> <20110218074401.GA26836@merkur.ravnborg.org> <4D5E5FB1.1000404@snapgear.com> <201102212243.15867.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:37623 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751095Ab1BUV5W (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 21 Feb 2011 16:57:22 -0500
Content-Disposition: inline
In-Reply-To: <201102212243.15867.arnd@arndb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Ungerer <gerg@snapgear.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Steven King <sfking00@yahoo.com>, uClinux development list <uclinux-dev@uclinux.org>, Greg Ungerer <gerg@uclinux.org>, Greg Ungerer <gregungerer@westnet.com.au>

On Mon, Feb 21, 2011 at 10:43:15PM +0100, Arnd Bergmann wrote:
> On Friday 18 February 2011 13:01:53 Greg Ungerer wrote:
> > >> Attached is a script and patch that does a kind of brute force
> > >> simplistic merge of the directories and files. (Thanks to Stephen King
> > >> <sfking@fdwdc.com>  for the initial version of this script, and to
> > >> Sam Ravnborg for the m68k includes merge script this was based on).
> > >> Nothing outside of the arch/m68k and arch/m68knommu directories is
> > >> touched, and in the end there is no more arch/m68knommu. To apply you
> > >> simply run the script from the top of a current kernel git tree (I used
> > >> 2.6.38-rc5 for testing) and then apply the patch.
> > >
> > > The initial version of said script was created by Arnd IIRC.
> > 
> > Apologies to Arnd then :-)
> 
> I had absolutely no memory of having done said script, but if Sam
> says wrote it did, that's probably true.
> 
> I was just about to say how much I like your script when I read
> that it was my idea...

See semi original version in: 49148020bcb6910ce71417bd990a5ce7017f9bd3

	Sam
