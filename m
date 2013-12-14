From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/3] kexec support for Linux/m68k (tools part)
Date: Sat, 14 Dec 2013 09:31:55 +0900
Message-ID: <20131214003155.GA12584@verge.net.au>
References: <1381859460-13645-1-git-send-email-geert@linux-m68k.org>
 <20131213005322.GJ32101@verge.net.au>
 <CAMuHMdW8cSLXy36fD1QaSjHoFsM5B4ZK4JVwLY-OefX+wFOtiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdW8cSLXy36fD1QaSjHoFsM5B4ZK4JVwLY-OefX+wFOtiQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, kexec@lists.infradead.org

On Fri, Dec 13, 2013 at 09:03:45AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Fri, Dec 13, 2013 at 1:53 AM, Simon Horman <horms@verge.net.au> wrote:
> > On Tue, Oct 15, 2013 at 07:50:57PM +0200, Geert Uytterhoeven wrote:
> >> kexec support for Linux/m68k (tools part)
> >>
> >> This is a set of patches to add kexec support for m68k to kexec-tools.
> >>
> >>   - Kexec only, no kdump support yet (do you have enough RAM to keep a
> >>     crashdump kernel in memory at all times? ;-)
> >
> > Thanks, applied.
> 
> Thanks, I have queued the kernel counterpart for 3.14.

Great. It sounds like it would be ideal if a new kexec-tools release
coincided with the release of v3.14 of the kernel.
