From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 3/11] Atari: obsolete old EtherNAT driver
Date: Fri, 22 Jun 2012 11:53:43 +1200
Message-ID: <CAOmrzk+KgfmG4BfTB_j378UMzjT_+tRrK5nEd-NpFGn6jf8iiw@mail.gmail.com>
References: <E1SXMCw-0002XZ-2q@zirkon.biophys.uni-duesseldorf.de>
	<CAMuHMdXYEBcKrXi-9X2wW9niNt+K2-2i2MKh4RGUCEz0HFL3Ug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:60707 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760640Ab2FUXxo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 21 Jun 2012 19:53:44 -0400
Received: by pbbrp8 with SMTP id rp8so2785628pbb.19
        for <linux-m68k@vger.kernel.org>; Thu, 21 Jun 2012 16:53:44 -0700 (PDT)
In-Reply-To: <CAMuHMdXYEBcKrXi-9X2wW9niNt+K2-2i2MKh4RGUCEz0HFL3Ug@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>, linux-m68k@vger.kernel.org

Hi Geert,


>> @@ -1142,7 +1140,7 @@ static const char * chip_ids[ 16 ] =3D =A0{
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 \
>> =A0 =A0 =A0 =A0} while (0)
>>
>> -#if defined(CONFIG_ATARI_ETHERNAT) || defined(CONFIG_ATARI_ETHERNAT=
_MODULE)
>> +#if defined(CONFIG_ATARI)
>> =A0/*
>> =A0* MSch: EtherNAT is 32 bit, so the misaligned data buffer hack ap=
plies.
>> =A0* This appears to hurt quite a lot ... we actually need to byte s=
wap the
>
> This part we'll have to do differently, as it depends on the old Ethe=
rNAT
> driver having been present first, which is not true for mainline.

I've split this one (and similar cases like in EtherNEC) into two
parts - first remove old EtherNAT driver code, then add the new
version. Is that what you wanted?

Cheers,

  Michael
