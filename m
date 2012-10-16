From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 1/4] Add linux/io.h to make it compile
Date: Tue, 16 Oct 2012 14:58:03 +1000
Message-ID: <507CE95B.5080602@snapgear.com>
References: <1350305680-5441-1-git-send-email-stany.marcel@novasys-ingenierie.com> <20121015135829.GA3961@frolo.macqel> <1512C13C0C5EA947AE50B9B9AC314F470343F024@ATLAS.pactenovation.fr> <20121015143954.GA16696@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:23785 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755699Ab2JPE4M convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 16 Oct 2012 00:56:12 -0400
In-Reply-To: <20121015143954.GA16696@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>
Cc: Stany MARCEL <smarcel@pactenovation.fr>, linux-m68k@vger.kernel.org, gerg@uclinux.org

Hi Philippe,

On 16/10/12 00:39, Philippe De Muyter wrote:
> On Mon, Oct 15, 2012 at 04:06:47PM +0200, Stany MARCEL wrote:
>> Hello Philippe,
>>
>> It does not compile with my config (MMU on), io.h header is missing =
for __raw_* operations.
>
> Actually, the problem seems to be more in the .h files, that should
> provide the same set of macros/functions regardless of CONFIG_MMU
> or not.
>
> I have a similar problem with out_be32 available from asm/io.h in
> CONFIG_MMU mode, but not without CONFIG_MMU.
>
> Greg, Geert ?

Yeah, the m68k io.h family of headers is all a bit messy.
It is on my list of things to merge and clean up. It is intended
that they should supply the same set of definitions.

But in this case any driver that uses any of the read/write family
of functions should include linux/io.h. The m54xx_wdt.c code
doesn't, it is just getting definitions by accident. (As it turns
out it is getting it because asm/pgtable.h includes asm/pgtable_no.h
which includes asm/io.h -- asm/pgtable_mm.h doesn't).

Regards
Greg



>>
>> But it might compile with MMU disabled.
>>
>> Regards
>>
>> -----Message d'origine-----
>> De=C3=A1: Philippe De Muyter [mailto:phdm@macqel.be]
>> Envoy=C3=9A=C3=A1: lundi 15 octobre 2012 15:58
>> =E2=94=94=C3=A1: Stany MARCEL
>> Cc=C3=A1: linux-m68k@vger.kernel.org; gerg@uclinux.org
>> Objet=C3=A1: Re: [PATCH 1/4] Add linux/io.h to make it compile
>>
>> Hello Stany,
>>
>> On Mon, Oct 15, 2012 at 02:54:37PM +0200, Stany MARCEL wrote:
>>
>>> [PATCH 1/4] Add linux/io.h to make it compile
>>
>> You could probably be more precise in your patch title :)
>>
>> What error message did you get without your patch ?
>>
>> I compile m54xx_wdt.c without CONFIG_MMU without error.
>>
>> Best regards
>>
>> Philippe
>


--=20
-----------------------------------------------------------------------=
-
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.co=
m
SnapGear Group, McAfee                      PHONE:       +61 7 3435 288=
8
8 Gardner Close                             FAX:         +61 7 3217 532=
3
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m
