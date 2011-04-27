From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [GIT PULL] parisc fixes for 2.6.39-rc5
Date: Wed, 27 Apr 2011 15:55:13 -0500
Message-ID: <1303937713.2583.28.camel@mulgrave.site>
References: <1303935518.2583.27.camel@mulgrave.site>
	 <BANLkTimPzRuGqjxXqe7tn-C52suTVE9+ig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BANLkTimPzRuGqjxXqe7tn-C52suTVE9+ig@mail.gmail.com>
Sender: linux-parisc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Parisc List <linux-parisc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Wed, 2011-04-27 at 22:36 +0200, Geert Uytterhoeven wrote:
> On Wed, Apr 27, 2011 at 22:18, James Bottomley
> <James.Bottomley@hansenpartnership.com> wrote:
> > These two fixes contain the agreed fix for our slub panic (agreed with
> > the mm folks that we'll define SLUB broken in the !NUMA && DISCONTIGMEM
> > case, which should fix m86k as well) and another buglet that turned up
> > examining the parisc discontigmem code.
> 
> Do we still need to mark SLUB broken?
> On m68k, the issue seems to have been fixed by setting the N_NORMAL_MEMORY flag
> (pull request scheduled after one more linux-next build cycle).
> 
> Or do you plan to unmark it broken once every affected arch sets the
> N_NORMAL_MEMORY flag?

Yes ... simply doing N_NORMAL_MEMORY doesn't fix parisc to not oops.

James


