From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/3] kexec support for Linux/m68k (tools part)
Date: Fri, 13 Dec 2013 09:51:11 +0900
Message-ID: <20131213005111.GI32101@verge.net.au>
References: <1381859460-13645-1-git-send-email-geert@linux-m68k.org>
 <20131016072236.GB29696@verge.net.au>
 <CAMuHMdVsKLBt8MiZ-dpX7expx+37XfO2kUjbRA_h5eMcsWJ1VQ@mail.gmail.com>
 <20131105070513.GB16448@verge.net.au>
 <CAMuHMdUVwYGemL=V3+C=JsR0QOqtASvc6Xte57EdPhPPLDFWXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUVwYGemL=V3+C=JsR0QOqtASvc6Xte57EdPhPPLDFWXg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, kexec@lists.infradead.org

On Sun, Dec 01, 2013 at 12:40:27PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Tue, Nov 5, 2013 at 8:05 AM, Simon Horman <horms@verge.net.au> wrote:
> > On Sun, Nov 03, 2013 at 03:08:50PM +0100, Geert Uytterhoeven wrote:
> >> On Wed, Oct 16, 2013 at 9:22 AM, Simon Horman <horms@verge.net.au> wrote:
> >> > I've taken a quick look over this and it seems reasonable to me.
> >>
> >> Thanks!
> >>
> >> > However, I wonder if I should wait for review of the kernel-side
> >> > to be completed before applying the kexec-tools patches.
> >> >
> >> > Let me know what you think.
> >>
> >> The kexec-tools part seems to be stable. The issues to be sorted out are on
> >> the kernel side.
> >
> > As the kexec-tools portion of this change isn't useful without the
> > kernel portion I think I would like to wait before applying this series.
> > Please repost once the kernel changes have been merged or if you
> > would like them re-considered for any other reason.
> 
> The kernel part is working now.
> 
> I didn't make any changes to kexec-tools for v3.
> Do you want me to resend them anyway, or can you just take v2?

Sorry for being slow, I will take v2.
