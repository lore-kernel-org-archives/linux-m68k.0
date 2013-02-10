From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 04/17] [m68k] Atari: change number of interrupt sources to
 include EtherNAT interrupts
Date: Sun, 10 Feb 2013 10:55:40 +0100
Message-ID: <CAMuHMdVGOq0+cLLGLnGRao44xZZcb2vLSSHVqyquMXzpPxdV=A@mail.gmail.com>
References: <20130131001801.55510360095@xplor.waratah.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ia0-f182.google.com ([209.85.210.182]:35043 "EHLO
	mail-ia0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751362Ab3BJJzl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Feb 2013 04:55:41 -0500
Received: by mail-ia0-f182.google.com with SMTP id w33so5634580iag.27
        for <linux-m68k@vger.kernel.org>; Sun, 10 Feb 2013 01:55:40 -0800 (PST)
In-Reply-To: <20130131001801.55510360095@xplor.waratah.dyndns.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org

On Thu, Jan 31, 2013 at 1:18 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> --- a/arch/m68k/include/asm/atariints.h
> +++ b/arch/m68k/include/asm/atariints.h
> @@ -32,7 +32,7 @@
>  #define VME_SOURCE_BASE    56
>  #define VME_MAX_SOURCES    16
>
> -#define NUM_ATARI_SOURCES   (VME_SOURCE_BASE+VME_MAX_SOURCES-STMFP_SOURCE_BASE)
> +#define NUM_ATARI_SOURCES  141

Can you please add a comment how you got to this magic number 141?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
