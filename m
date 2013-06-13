From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/uaccess: Fix asm constraints for userspace access
Date: Thu, 13 Jun 2013 15:16:32 +0200
Message-ID: <CAMuHMdVdvHBzFbsNu96J+hXO-aVU8Z1XXVG_UtszJMdoz9nkMg__400.391958146606$1371129417$gmane$org@mail.gmail.com>
References: <1371124784-13306-1-git-send-email-geert@linux-m68k.org>
	<mvm7ghyrydr.fsf@hawking.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <mvm7ghyrydr.fsf@hawking.suse.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jun 13, 2013 at 2:25 PM, Andreas Schwab <schwab@linux-m68k.org> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>
>> Also, relax the asm constraints for 16-bit userspace accesses in
>> __put_user() and __get_user(), as both "move" and "moves" do support
>> such transfers between memory and address registers.
>
> There's another occurrence in __constant_copy_from_user and
> __constant_copy_to_user.

Thanks! I will fix those, too.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
