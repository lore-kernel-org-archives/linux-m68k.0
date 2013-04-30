From: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>
Subject: Re: [PATCH 0/13] Atari EtherNAT/EtherNEC/NetUSBee support
Date: Wed, 1 May 2013 00:10:52 +0200
Message-ID: <20130430221052.GA1618@mail.biophys.uni-duesseldorf.de>
References: <516E52F4.1020008@gmail.com>
 <CAMuHMdU8svz=FsCDDdn6PXwAOzUdfLSg8DbsD97sTOsS4Qoj8Q@mail.gmail.com>
 <20130428222621.GA5821@mail.biophys.uni-duesseldorf.de>
 <CAMuHMdU-Za_VqW4x9fJwDD4-VD=+DLaSNQNY6YrHibQq+GyC_A@mail.gmail.com>
 <20130429082049.GA10441@mail.biophys.uni-duesseldorf.de>
 <CAMuHMdVCfM8c=Aj-cgHMDLavFvbxcHAyHrh930S4ncV-6uDW_g@mail.gmail.com>
 <20130429213755.GA18688@mail.biophys.uni-duesseldorf.de>
 <CAMuHMdVJWU5uJB9iNRvOmXDV1C5C1dnCiEDPx4yG5n1C4hqtzQ@mail.gmail.com>
 <20130430075016.GA23189@mail.biophys.uni-duesseldorf.de>
 <CAMuHMdUkNUzF_Cr5xS+i7hFbW-wuxZYTa8Gh3wH2pyXVxDTouQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from opal-mail.biophys.uni-duesseldorf.de ([134.99.176.33]:46383
	"EHLO mail.biophys.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933600Ab3D3WS0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 30 Apr 2013 18:18:26 -0400
Content-Disposition: inline
In-Reply-To: <CAMuHMdUkNUzF_Cr5xS+i7hFbW-wuxZYTa8Gh3wH2pyXVxDTouQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Hi Geert,

[taking this back to the list ...]

> Before rebasing, you can also use "git cherry -v" to list the commits.
> Git will prepend
> them with "+" if it's new, "-" if it's already present. Note that git
> may guess wrong if the
> commits have changed/cause conflicts.

Thanks, that does help! 
 
> E.g. the next command show me what's in my m68k-queue, and not yet in for-linus
> (the third parameter "v3.9" is there to limit displaying to commits
> not yet in v3.9.
>  As "for-linus" is based on v3.9-rc7, it would also list all commits
> between v3.9-rc7 and
>  v3.9 if I omit the "v3.9" parameter):
> 
> $ git cherry -v for-linus m68k-queue v3.9

Nice trick - I tried git cherry but the output on two branches one merged
and one unmerged was too confusing. 

> > That was the 3.9-rc2 version of m68k-queue, after git fetch and git rebase
> > origin/m68k-queue.
> 
> OK, that one didn't have the new version yet.

Come to think of it - I am quite sure the branch _should_ have been based on
-rc7 because I updated to that not too long ago. 
 
> > Is this because m68k-queue was rebased in your tree (from 3.9-rc2 to 3.9),
> > perhaps?
> > Anyway, I won't do that in a hurr again :-)
> 
> Yes, I rebase m68k-queue on every -rc release.

OK, I'll just have to deal with that. Not sure what my next project will be
- the Amiga SCSI still simmers away on the back burner. 

> >> If you want to retry, try to rebase on top of m68k-v3.9 (= version of m68k-queue
> >> on top of v3.9).
> >
> > I'd have to reset to the old HEAD of my m68k-queue working tree before
> > rebasing to m68k-v3.9, correct?
> 
> Indeed. But if the differences are small, just cherry-pick your new commits.
> Or manually remove the old ones when using "rebase -i".

Cherry picking sure looks easier...

Another question: Is there a way to find out which physical address maps to
a given ioremapped one? 

If I let the USB driver print the physical address, the ioremapped address,
and the result of __pa() on the ioremapped one, I get:

ISP116X probe: data 80000012 virt. 21098012 pa 21098012 , addr 80000016
virt. 21096016 pa 21096016

for the EtherNAT instance, and 

ISP116X probe: data 00000340 virt. 2109e340 pa 2109e340 , addr 00000360
virt. 2109c360 pa 2109c360

for the NetUSBee instance. In both cases ioremapped and __pa() are equal. 

I had hoped to get the physical address back from __pa() in the first
instance, and check for _pa(reg) > 0x8000000 to differentiate between the
two instances. Not so simple, apparently. 

Any idea? Anyone? 

Cheers,

	Michael
