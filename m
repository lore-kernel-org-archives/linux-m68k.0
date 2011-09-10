From: Yong Zhang <yong.zhang0@gmail.com>
Subject: Re: [PATCH 12/62] m64k: irq: Remove IRQF_DISABLED
Date: Sat, 10 Sep 2011 10:01:10 +0800
Message-ID: <20110910020110.GA8696__2653.53628569773$1315621546$gmane$org@zhy>
References: <1315383059-3673-1-git-send-email-yong.zhang0@gmail.com>
 <1315383059-3673-13-git-send-email-yong.zhang0@gmail.com>
 <4E683413.6010009@snapgear.com>
 <CAMuHMdVopb8wkUa5rn48_Zp4y33HaXUr0-BGE6N-6p2PAt=hag@mail.gmail.com>
Reply-To: Yong Zhang <yong.zhang0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVopb8wkUa5rn48_Zp4y33HaXUr0-BGE6N-6p2PAt=hag@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@snapgear.com>, linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@elte.hu, Sam Creasey <sammy@sammy.net>, Greg Ungerer <gerg@uclinux.org>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, linux-m68k@lists.linux-m68k.org

On Fri, Sep 09, 2011 at 05:05:15PM +0200, Geert Uytterhoeven wrote:
> On Thu, Sep 8, 2011 at 05:18, Greg Ungerer <gerg@snapgear.com> wrote:
> > On 07/09/11 18:10, Yong Zhang wrote:
> >>
> >> This flag is a NOOP and can be removed now.
> >>
> >> Signed-off-by: Yong Zhang<yong.zhang0@gmail.com>
> >
> > Looks ok to me:
> >
> > Acked-by: Greg Ungerer <gerg@uclinux.org>
> 
> Except for the subject, it's m68k, not m64k ;-)

Sorry for the typo.

> 
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Sorry, I missed the introductary email [0/62].

I sent it out, but seems it didn't reach LKML due to the compromise
of kernel.org.

> But do you expect the individual
> maintainers to take these patches, or are you just collecting Acks?

Quoted from Thomas's reply to Ralf (MIPS):
[ We can hold off the "remove the define" patch until 3.2-rc1 and push
it along with everything which hasn't been merged until then.

Alternatively I can pick the whole MIPS bunch as well. I let Ralf
decide. ]

So the same rule here, you can decide it :)

Thanks,
Yong
