From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [git pull] m68k updates for 2.6.34
Date: Sun, 7 Mar 2010 10:43:56 +0100
Message-ID: <10f740e81003070143i4db7b915ua83f9bd994d922a1@mail.gmail.com>
References: <alpine.DEB.2.00.1002272207450.9843@ayla.of.borg>
	 <4B8E6D6A.6050108@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:64576 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753094Ab0CGJn6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 7 Mar 2010 04:43:58 -0500
Received: by wya21 with SMTP id 21so2785073wya.19
        for <linux-m68k@vger.kernel.org>; Sun, 07 Mar 2010 01:43:57 -0800 (PST)
In-Reply-To: <4B8E6D6A.6050108@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Mar 3, 2010 at 15:08, Maxim Kuvyrkov <maxim@codesourcery.com> w=
rote:
> On 2/28/10 12:13 AM, Geert Uytterhoeven wrote:
>> Please pull to receive the m68k updates for 2.6.34.

>> =C2=A0 =C2=A0 =C2=A0 m68k: Define sigcontext ABI of ColdFire
>
> I only now have noticed that an old version of this patch was merged =
in.

Oops, sorry about that.

> =C2=A0The latest version was posted here
> (http://marc.info/?l=3Dlinux-m68k&m=3D126571455916199&w=3D2) and incl=
uded a fix
> for the libSegFault to not overflow sc_fpstate field [I got the math =
wrong
> the first time round].
>
> The attached patch fixes this problem.

Thanks, applied. Queued for a later pull in the 2.6.34-rc timeline.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
