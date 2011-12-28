From: Joshua Juran <jjuran@gmail.com>
Subject: Re: [PATCH 32/35] m68k: add ColdFire FPU support for the V4e ColdFire CPU's
Date: Wed, 28 Dec 2011 03:17:09 -0800
Message-ID: <11354AB9-D311-41E8-9009-CF2DC3F9FA7A@gmail.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>	<1324610148-20666-33-git-send-email-gerg@snapgear.com> <CAMuHMdVBGR9p1f_dnk8abYwosvBm9n7j1foaGd+gMESKXm8+Vw@mail.gmail.com> <4EFAAEF3.6010709@snapgear.com>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:49910 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753640Ab1L1LRb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 28 Dec 2011 06:17:31 -0500
Received: by iaeh11 with SMTP id h11so21897045iae.19
        for <linux-m68k@vger.kernel.org>; Wed, 28 Dec 2011 03:17:30 -0800 (PST)
In-Reply-To: <4EFAAEF3.6010709@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Dec 27, 2011, at 9:53 PM, Greg Ungerer wrote:

>         if (CPU_IS_COLDFIRE) {
>                 __asm__ volatile ("fsave %0"
>                                   : : "m" (*sc->sc_fpstate) :  
> "memory");
>         } else {
>                 __asm__ volatile (".chip 68k/68881\n\t"
>                                   "fsave %0\n\t"
>                                   ".chip 68k"
>                                   : : "m" (*sc->sc_fpstate) :  
> "memory");
>         }
>
> I am still concerned about the use of ".chip 68k" in general though.
> Just not sure how we can avoid it. I guess there is no way to jus
> t revert to the original CPU choice?

#define CPU "68040"

_asm__ volatile (".chip 68k/68881\n\t"
                  "fsave %0\n\t"
                  ".chip " CPU
                  : : "m" (*sc->sc_fpstate) : "memory");

Josh
