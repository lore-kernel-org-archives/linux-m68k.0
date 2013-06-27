From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68knommu: Mark config_BSP() __init
Date: Thu, 27 Jun 2013 08:49:45 +0200
Message-ID: <CAMuHMdV2XakPGZP5gYygBPgg+DeSRj7qP6hF7T6nN-OQKTodtA__7300.66314940831$1372315807$gmane$org@mail.gmail.com>
References: <1372189212-12136-1-git-send-email-geert@linux-m68k.org>
	<51CB745B.4060604@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <51CB745B.4060604@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jun 27, 2013 at 1:08 AM, Greg Ungerer <gerg@uclinux.org> wrote:
> On 26/06/13 05:40, Geert Uytterhoeven wrote:
>>
>> Some instances of config_BSP() lack an __init annotation.
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
>
> Acked-by: Greg Ungerer <gerg@uclinux.org>
>
> Looks good. Are you going to push it via your tree, or do you want
> me too?

As it's m68nommu, perhaps through your tree? Unless you don't have time to
handle it.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
