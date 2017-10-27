From: Kars de Jong <jongk@linux-m68k.org>
Subject: Re: [PATCH 1/4] m68k/mac: More printk modernization
Date: Fri, 27 Oct 2017 12:59:27 +0200
Message-ID: <CACz-3riWPO6Kef8mtSHWp=zm0Tzi5P-GvbRdgqp6RTSwauOrYg@mail.gmail.com>
References: <cover.1509071937.git.fthain@telegraphics.com.au> <afe6ecb8fcbe726eecc42bd967e5d71502658f40.1509071937.git.fthain@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtpq3.mnd.mail.iss.as9143.net ([212.54.34.166]:58321 "EHLO
        smtpq3.mnd.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751176AbdJ0K7b (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Fri, 27 Oct 2017 06:59:31 -0400
In-Reply-To: <afe6ecb8fcbe726eecc42bd967e5d71502658f40.1509071937.git.fthain@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

2017-10-27 4:45 GMT+02:00 Finn Thain <fthain@telegraphics.com.au>:
> Log message fragments used to be printed on one line but now get split up.
> Fix this. Also, suppress log spam that merely prints known pointer values.
>
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> ---
>  arch/m68k/mac/baboon.c |  2 +-
>  arch/m68k/mac/iop.c    |  4 ++--
>  arch/m68k/mac/psc.c    |  6 ++----
>  arch/m68k/mac/via.c    | 18 +++++-------------
>  4 files changed, 10 insertions(+), 20 deletions(-)

...

> diff --git a/arch/m68k/mac/psc.c b/arch/m68k/mac/psc.c
> index 439a2a2e5874..8d547df4e16c 100644
> --- a/arch/m68k/mac/psc.c
> +++ b/arch/m68k/mac/psc.c
> @@ -42,7 +42,7 @@ static void psc_debug_dump(void)
>                 return;
>
>         for (i = 0x30 ; i < 0x70 ; i += 0x10) {
> -               printk("PSC #%d:  IFR = 0x%02X IER = 0x%02X\n",
> +               printk(KERN_DEBUG "PSC #%d:  IFR = 0x%02X IER = 0x%02X\n",
>                         i >> 4,
>                         (int) psc_read_byte(pIFRbase + i),
>                         (int) psc_read_byte(pIERbase + i));

Any particular reason why you didn't use pr_debug() here? I'm guessing
it's because this is not a known pointer value?

Kars.
