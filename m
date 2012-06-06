From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 1/11] Atari: change number of interrupt sources
Date: Wed, 6 Jun 2012 10:16:04 +0200
Message-ID: <CAOmrzkK7MbiTzAHR0s6dQdPK2y9ov3XTdEsOhH7TOwTQOMMHNg@mail.gmail.com>
References: <E1SXMBV-0002XQ-JI@zirkon.biophys.uni-duesseldorf.de>
	<CAMuHMdVXZGJmhLvQ-rfPGXHd7p90dDuSd95SZT0uBnShbYY5Rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:55152 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752672Ab2FFIQF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Jun 2012 04:16:05 -0400
Received: by pbbrp8 with SMTP id rp8so8614832pbb.19
        for <linux-m68k@vger.kernel.org>; Wed, 06 Jun 2012 01:16:04 -0700 (PDT)
In-Reply-To: <CAMuHMdVXZGJmhLvQ-rfPGXHd7p90dDuSd95SZT0uBnShbYY5Rg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>, linux-m68k@vger.kernel.org

Geert,

>> -#define NUM_ATARI_SOURCES =A0 (VME_SOURCE_BASE+VME_MAX_SOURCES-STMF=
P_SOURCE_BASE)
>> +#define NUM_ATARI_SOURCES =A0141
>
> This warrants a comment.

OK, I'll add one.

>
>> diff --git a/arch/m68k/include/asm/irq.h b/arch/m68k/include/asm/irq=
=2Eh
>> index c1155f0..8bd9c7f 100644
>> --- a/arch/m68k/include/asm/irq.h
>> +++ b/arch/m68k/include/asm/irq.h
>> @@ -9,9 +9,11 @@
>> =A0*/
>> =A0#if defined(CONFIG_COLDFIRE)
>> =A0#define NR_IRQS 256
>> -#elif defined(CONFIG_VME) || defined(CONFIG_SUN3) || defined(CONFIG=
_SUN3X)
>> +#elif defined(CONFIG_VME) || defined(CONFIG_SUN3) || defined(CONFIG=
_SUN3X)
>
> Bogus whitespace change (checkpatch should have told you).
>
>> =A0#define NR_IRQS 200
>> -#elif defined(CONFIG_ATARI) || defined(CONFIG_MAC)
>> +#elif defined(CONFIG_ATARI)
>> +#define NR_IRQS 141
>
> This is the (not configurable) EtherNAT interrupt number + 1?

Right - still not sure where the +1 results from though.

Cheers,

  Michael
