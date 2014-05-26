From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH RESEND 4/4] m68k/atari: fix SCC initialization for debug console
Date: Mon, 26 May 2014 13:23:34 +1200
Message-ID: <CAOmrzk+iOMyv5WtTeqcZkWZsqaXSAfSMcCAMVUJqRNdnyxKq9g@mail.gmail.com>
References: <20140411052757.888960081@telegraphics.com.au>
	<20140411052759.169790206@telegraphics.com.au>
	<CAMuHMdUnoZVpq79LPPFN1dop8r0fMJYi7knT9a+pUHFqBAxEfQ@mail.gmail.com>
	<alpine.LNX.2.00.1405252030460.18784@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:35356 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751381AbaEZBXf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 25 May 2014 21:23:35 -0400
Received: by mail-ob0-f177.google.com with SMTP id wp4so7291953obc.36
        for <linux-m68k@vger.kernel.org>; Sun, 25 May 2014 18:23:34 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1405252030460.18784@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitz@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,

On Sun, May 25, 2014 at 10:37 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
>
> On Sun, 25 May 2014, Geert Uytterhoeven wrote:
>
>> Has anyone tested this on Atari?
>
> The patch doesn't change behaviour. If someone wanted to test it, they'd
> also need to make changes like this:
>
> diff --git a/arch/m68k/kernel/head.S b/arch/m68k/kernel/head.S
> index 3ab329b..b210a29 100644
> --- a/arch/m68k/kernel/head.S
> +++ b/arch/m68k/kernel/head.S
> @@ -2752,7 +2752,7 @@ L(scc_initable_mac):
>  #ifdef CONFIG_ATARI
>  /* #define USE_PRINTER */
>  /* #define USE_SCC_B */
> -/* #define USE_SCC_A */
> +#define USE_SCC_A
>  #define USE_MFP
>
>  #if defined(USE_SCC_A) || defined(USE_SCC_B)
>
> That difficulty is one reason why this patch series replaces some other
> buried macros with Kconfig symbols...
>

Does it even work if both USE_SCC_A and USE_MFP are defined? I've only
ever had defined one or the other.

Would not object to making that change too, if it happens to work OK.
More to test, sigh.

Cheers,

  Michael

> --
