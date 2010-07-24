From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: FPU emulation incorrect for 68LC040?
Date: Sat, 24 Jul 2010 12:31:19 +1200
Message-ID: <AANLkTikmRwtNdGKu-8ye4Yho1G7Cg7Sch2kMGQCQ2uaa@mail.gmail.com>
References: <08EC3395-75C3-4E81-B468-C9978DDCF85D@bredband.net>
	<AANLkTilKXTCUJIOEvQ-H5GjGfPwYV5_QufuD46twmNvS@mail.gmail.com>
	<41EF646C-8866-4070-B772-94E39EF4620B@bredband.net>
	<alpine.OSX.2.00.1007221056390.354@localhost>
	<1CC1901B-7E56-4FAF-96A4-8F2F2F5C38A9@bredband.net>
	<alpine.OSX.2.00.1007231358580.393@localhost>
	<EF635C61-D531-4130-A94C-C3C6A0B1592B@bredband.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:45607 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751708Ab0GXAbU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 23 Jul 2010 20:31:20 -0400
Received: by qyk8 with SMTP id 8so551337qyk.19
        for <linux-m68k@vger.kernel.org>; Fri, 23 Jul 2010 17:31:19 -0700 (PDT)
In-Reply-To: <EF635C61-D531-4130-A94C-C3C6A0B1592B@bredband.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?ISO-8859-1?Q?Mattias_Engdeg=E5rd?= <mattiase@bredband.net>
Cc: Finn Thain <fthain@telegraphics.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, zippel@linux-m68k.org

Hi,

the way I understood post-increment to work was for this to happen
only after instruction execution. If the effective address had been
modified already, it would be more difficult for an emulator to
determine the correct address after the trap. Also, it seems more
efficient to first decode the instruction (and trap if needed) before
fully decoding the address.

  Michael (posting from gmail since my old mail account has gone down
in flames with a RAID5 crash at my old lab ...)

On Fri, Jul 23, 2010 at 8:39 PM, Mattias Engdeg=E5rd
<mattiase@bredband.net> wrote:
> 23 jul 2010 kl. 06.12 skrev Finn Thain:
>
>> I ran this on a PowerBook 190cs:
>>
>> postinc: result -3.500000 (expected -3.500000), address 0xef8ddcf8
>> (expected 0xef8ddcf8)
>> predec: result 1.750000 (expected 1.750000), address 0xef8ddcf0 (exp=
ected
>> 0xef8ddcf0)
>
> Thank you! It indicates that the address generation does not alter an=
y
> registers (because the FPU emulation will do so, and we didn't see a
> duplicated change). This is a bit surprising to me, but your evidence=
 cannot
> be refuted. Anyway, it's good to have cast light on the matter.
>
> (And Geert can say "told you so".)
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
