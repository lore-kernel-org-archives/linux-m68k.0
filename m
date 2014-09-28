From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/5] m68k: Disable/restore interrupts in hwreg_present()/hwreg_write()
Date: Sun, 28 Sep 2014 11:44:14 +0200
Message-ID: <CAMuHMdUXk5HxwXzTMWP6R0W6gTA+vqNuu75z1DHa=8sF8SxL0g__35279.9626569778$1411897480$gmane$org@mail.gmail.com>
References: <1411896385-25384-1-git-send-email-geert@linux-m68k.org>
	<m2oau09j6k.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <m2oau09j6k.fsf@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Finn Thain <fthain@telegraphics.com.au>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>

On Sun, Sep 28, 2014 at 11:40 AM, Andreas Schwab <schwab@linux-m68k.org> wrote:
>> While most callers run early, before interrupt are disabled, or
>
>                                        interrupts are enabled

Thanks, will fix.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
