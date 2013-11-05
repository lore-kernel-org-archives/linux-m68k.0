From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/3] kexec support for Linux/m68k (tools part)
Date: Tue, 5 Nov 2013 16:05:13 +0900
Message-ID: <20131105070513.GB16448@verge.net.au>
References: <1381859460-13645-1-git-send-email-geert@linux-m68k.org>
 <20131016072236.GB29696@verge.net.au>
 <CAMuHMdVsKLBt8MiZ-dpX7expx+37XfO2kUjbRA_h5eMcsWJ1VQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVsKLBt8MiZ-dpX7expx+37XfO2kUjbRA_h5eMcsWJ1VQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, kexec@lists.infradead.org

On Sun, Nov 03, 2013 at 03:08:50PM +0100, Geert Uytterhoeven wrote:
> On Wed, Oct 16, 2013 at 9:22 AM, Simon Horman <horms@verge.net.au> wrote:
> > I've taken a quick look over this and it seems reasonable to me.
> 
> Thanks!
> 
> > However, I wonder if I should wait for review of the kernel-side
> > to be completed before applying the kexec-tools patches.
> >
> > Let me know what you think.
> 
> The kexec-tools part seems to be stable. The issues to be sorted out are on
> the kernel side.
> 
> However, it doesn't hurt to wait a little bit more to apply this. We m68k
> people are patient and used to multi-year development ;-)

It is said that patience is a virtue :^)

As the kexec-tools portion of this change isn't useful without the
kernel portion I think I would like to wait before applying this series.
Please repost once the kernel changes have been merged or if you
would like them re-considered for any other reason.
