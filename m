From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 8/11] Atari: add ISP16x host controller support
Date: Wed, 6 Jun 2012 10:13:45 +0200
Message-ID: <CAOmrzkJNn1EkNcqr_UzbmhRn2D1LwJn8923+O+EtPTyqL3GawQ@mail.gmail.com>
References: <E1SXMHc-0002Xx-7A@zirkon.biophys.uni-duesseldorf.de>
	<CAMuHMdUWygr2yVjgFxFTu+-GC-xXLv1+zsKstGZgYuZ_9=3SUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:58813 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753495Ab2FFINq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Jun 2012 04:13:46 -0400
Received: by dady13 with SMTP id y13so8457192dad.19
        for <linux-m68k@vger.kernel.org>; Wed, 06 Jun 2012 01:13:46 -0700 (PDT)
In-Reply-To: <CAMuHMdUWygr2yVjgFxFTu+-GC-xXLv1+zsKstGZgYuZ_9=3SUA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>, linux-m68k@vger.kernel.org

Geert,

>> +config ATARI_USB
>> + =A0 =A0 =A0 bool "Atari USB host controller support"
>> + =A0 =A0 =A0 depends on ATARI
>> + =A0 =A0 =A0 select USB_SUPPORT
>> + =A0 =A0 =A0 select USB_ARCH_HAS_HCD
>
> Nothing actually uses CONFIG_ATARI_USB, it's just used to select USB_=
SUPPORT
> and USB_ARCH_HAS_HCD?
> Perhaps you can make the platform device creation depend on this?

I could select USB_ARCH_HAS_HCD conditional on USB_SUPPORT on Atari
without the need for an additional option, is that what you mean? I'm
not certain which way the selection works - do I get to select
USB_SUPPORT unconditionally?

Otherwise, both can be enabled unconditionally on Atari now -
inclusion of the HCD is controlled via the driver option.

>> +/*
>> + * EtherNEC: ISA NE2000 compatible card (i.e. Realtek 8019) via ROM=
-port adapter
>> + */
>> +
>> =A0#define ATARI_ETHERNEC_PHYS_ADDR =A0 =A0 =A0 0xfffa0000
>> =A0#define ATARI_ETHERNEC_BASE =A0 =A0 =A0 =A0 =A0 =A00x300
>> =A0#define ATARI_ETHERNEC_IRQ =A0 =A0 =A0 =A0 =A0 =A0 IRQ_MFP_TIMD
>
> This doesn't belong in this patch.

Oops - need to be more disciplined.

Cheers,

  Michael
