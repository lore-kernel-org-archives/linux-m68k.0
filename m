From: Alexander Kuleshov <kuleshovmail@gmail.com>
Subject: Re: [PATCH] m68k/sun3: Fix virtual addresses of clock and interrupt register
Date: Fri, 25 Sep 2015 13:50:46 +0600
Message-ID: <CANCZXo72WVR+-9ryihMSv9DbgRTTK-ajj0ic6v_BptaEiPYh4w__10662.4516928152$1443167488$gmane$org@mail.gmail.com>
References: <1442223611-30175-1-git-send-email-kuleshovmail@gmail.com> <CAMuHMdU-ZjWPw8D2KYjBgMdRM_k+BTfhKC81RcSkB_s8Mzjmwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdU-ZjWPw8D2KYjBgMdRM_k+BTfhKC81RcSkB_s8Mzjmwg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sam Creasey <sammy@sammy.net>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hello Geert

On Fri, Sep 25, 2015 at 1:21 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Have you tested this?
>
> This means enabling/disabling interrupts never worked on Sun 3, which
> I find a bit difficult to believe.
> There are other 0x0f?????? addresses in arch/m68k/sun3/mmu_emu.c.
>

Nope, just trying to do it in virtual machine, I'm learning sun3
architecture now
and have some cleanups patches for it. I'll send these patches and provide more
feedback when I'm able to test it.
