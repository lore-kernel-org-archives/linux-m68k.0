From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 8/11] Atari: add ISP16x host controller support
Date: Wed, 6 Jun 2012 14:07:47 +0200
Message-ID: <CAMuHMdWDrBYEPXT8-VGw=DDCrgk-oZHtign71mHcxafAnNpiLA@mail.gmail.com>
References: <E1SXMHc-0002Xx-7A@zirkon.biophys.uni-duesseldorf.de>
	<CAMuHMdUWygr2yVjgFxFTu+-GC-xXLv1+zsKstGZgYuZ_9=3SUA@mail.gmail.com>
	<CAOmrzkJNn1EkNcqr_UzbmhRn2D1LwJn8923+O+EtPTyqL3GawQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:59242 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752200Ab2FFMHs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Jun 2012 08:07:48 -0400
Received: by gglu4 with SMTP id u4so4848366ggl.19
        for <linux-m68k@vger.kernel.org>; Wed, 06 Jun 2012 05:07:48 -0700 (PDT)
In-Reply-To: <CAOmrzkJNn1EkNcqr_UzbmhRn2D1LwJn8923+O+EtPTyqL3GawQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>, linux-m68k@vger.kernel.org

On Wed, Jun 6, 2012 at 10:13 AM, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
>>> +config ATARI_USB
>>> + =C2=A0 =C2=A0 =C2=A0 bool "Atari USB host controller support"
>>> + =C2=A0 =C2=A0 =C2=A0 depends on ATARI
>>> + =C2=A0 =C2=A0 =C2=A0 select USB_SUPPORT
>>> + =C2=A0 =C2=A0 =C2=A0 select USB_ARCH_HAS_HCD
>>
>> Nothing actually uses CONFIG_ATARI_USB, it's just used to select USB=
_SUPPORT
>> and USB_ARCH_HAS_HCD?
>> Perhaps you can make the platform device creation depend on this?
>
> I could select USB_ARCH_HAS_HCD conditional on USB_SUPPORT on Atari
> without the need for an additional option, is that what you mean? I'm

Yes, or make USB_ARCH_HAS_HCD depend on ATARI, too, cfr. most other
architectures do.

> not certain which way the selection works - do I get to select
> USB_SUPPORT unconditionally?

Selecting USB_SUPPORT is not needed, as that question is asked during
configuration anyway.

But if you keep ATARI_USB, please keep on selecting USB_SUPPORT, else
the user has to enable both (you never want only one of ATARI_USB and
USB_SUPPORT anway).

Keeping ATARI_USB allows to put the creation of the platform devices
inside #ifdef CONFIG_ATARI_USB, which is IMHO a good idea as this
hardware is not "standard" but glued as an extension to the Atari CPU
bus.

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
