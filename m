From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/5] m68k: Disable/restore interrupts in hwreg_present()/hwreg_write()
Date: Fri, 3 Oct 2014 10:54:31 +0200
Message-ID: <CAMuHMdUD7yzx2pORC-+QKPubWFbafxCMF59ZH5ajZLEvJV0_aQ__47330.4767431275$1412326499$gmane$org@mail.gmail.com>
References: <1411896385-25384-1-git-send-email-geert@linux-m68k.org>
	<m2oau09j6k.fsf@linux-m68k.org>
	<CAMuHMdUXk5HxwXzTMWP6R0W6gTA+vqNuu75z1DHa=8sF8SxL0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUXk5HxwXzTMWP6R0W6gTA+vqNuu75z1DHa=8sF8SxL0g@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Finn Thain <fthain@telegraphics.com.au>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>

On Sun, Sep 28, 2014 at 11:44 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sun, Sep 28, 2014 at 11:40 AM, Andreas Schwab <schwab@linux-m68k.org> wrote:
>>> While most callers run early, before interrupt are disabled, or
>>
>>                                        interrupts are enabled
>
> Thanks, will fix.

Fixed and queued for 3.18, together with the reformat in PATCH 2/5.

I'll resend the remaining 3 after v3.18-rc1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
