From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [uClinux-dev] [PATCH v2 1/6] m68k: merge mmu and non-mmu versions
 of muldi3
Date: Wed, 20 Apr 2011 10:55:15 +0200
Message-ID: <BANLkTi=9ZNg+eh6S1NeyJaCs4e0tRjJELQ@mail.gmail.com>
References: <1303278880-16153-1-git-send-email-gerg@snapgear.com>
	<1303278880-16153-2-git-send-email-gerg@snapgear.com>
	<1303278880-16153-3-git-send-email-gerg@snapgear.com>
	<20110420080609.GA24244@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:33770 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751867Ab1DTIzR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2011 04:55:17 -0400
Received: by bwz15 with SMTP id 15so444409bwz.19
        for <linux-m68k@vger.kernel.org>; Wed, 20 Apr 2011 01:55:16 -0700 (PDT)
In-Reply-To: <20110420080609.GA24244@merkur.ravnborg.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uClinux development list <uclinux-dev@uclinux.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

On Wed, Apr 20, 2011 at 10:06, Sam Ravnborg <sam@ravnborg.org> wrote:
> Hi Greg.
>
>> +
>> +#if defined(__mc68020__) || defined(__mc68030__) || \
>> + =C2=A0 =C2=A0defined(__mc68040__) || defined(__mc68060__)
>
> Why use these to decide if this is MMU or not?
> This code is not exposed to user-space so we can rely on CONFIG_* sym=
bols.
> IMO the CONIFG_* symbols is easier to read/maintain.

Because technically it doesn't depend on having a MMU or not, but on ha=
ving
the full 32-bit multiplication instruction or not.

Does Coldfire-with-MMU (for which we haven't integrated the support
yet) have that
instruction?

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
