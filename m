From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k/for-2.6.34
Date: Sat, 6 Feb 2010 10:44:42 +0100
Message-ID: <10f740e81002060144l7850f81ftd516600c27a33c7c@mail.gmail.com>
References: <10f740e81002011212t91a087bkeb77dac23f5676e0@mail.gmail.com>
	 <4B6B33EC.9000102@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f46.google.com ([74.125.82.46]:51346 "EHLO
	mail-ww0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754542Ab0BFJon (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 6 Feb 2010 04:44:43 -0500
Received: by wwi18 with SMTP id 18so879456wwi.19
        for <linux-m68k@vger.kernel.org>; Sat, 06 Feb 2010 01:44:42 -0800 (PST)
In-Reply-To: <4B6B33EC.9000102@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>, Greg Ungerer <gerg@uclinux.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>

On Thu, Feb 4, 2010 at 21:54, Maxim Kuvyrkov <maxim@codesourcery.com> wrote:
> On 2/1/10 11:12 PM, Geert Uytterhoeven wrote:
> ...
>>
>> Should I add the NPTL support for m68k and m68knommu, or shall I wait
>> for 2.6.35?
>
> Notwithstanding the bias, I think you should merge the NPTL support. The
> NPTL changes don't touch any of the existing functionality, they only add
> the new syscalls, so the risk of breaking something is negligible.

OK for me. Greg, OK for m68knommu, too?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
