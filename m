From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: "m68k: Cleanup linker scripts using new linker script macros." and
	old binutils (was: Re: [PATCH] m68k: Atari EtherNAT - Nicolas Pitre has a new
	email address)
Date: Sun, 10 Jan 2010 10:28:26 +0100
Message-ID: <10f740e81001100128q644cae1eg61c12b64f22e8398@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f214.google.com ([209.85.219.214]:52101 "EHLO
	mail-ew0-f214.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752040Ab0AJJ21 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Jan 2010 04:28:27 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Tim Abbott <tabbott@ksplice.com>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jan 10, 2010 at 05:56, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>> > > I'll verify that on the new tree, and start bisecting. Sigh.
>> >
>> > Good luck!
>>
>> 7c5fd5619dc89fb52d2c2cf144fc6e4365427b86 is first bad commit
>> commit 7c5fd5619dc89fb52d2c2cf144fc6e4365427b86
>> Author: Tim Abbott <tabbott@ksplice.com>
>> Date: =C2=A0 Sun Sep 27 13:57:55 2009 -0400
>>
>> =C2=A0 =C2=A0 m68k: Cleanup linker scripts using new linker script m=
acros.
>>
>> =C2=A0 =C2=A0 Signed-off-by: Tim Abbott <tabbott@ksplice.com>
>> =C2=A0 =C2=A0 Tested-by: Andreas Schwab <schwab@linux-m68k.org>
>> =C2=A0 =C2=A0 Cc: Roman Zippel <zippel@linux-m68k.org>
>> =C2=A0 =C2=A0 Cc: Sam Ravnborg <sam@ravnborg.org>
>> =C2=A0 =C2=A0 Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.or=
g>
>>
>> :040000 040000 5bdbf7ce5dd4ea2f23669c6a6ec11192865b5bfa
>> d3b7397533b0af6261747ccef3cff9cd40f6baf9 M =C2=A0 =C2=A0arch
>
> Backing out that commit on the top of the tree results in a bootable
> 2.6.33-rc2 for me
>
> The order of symbols in the system map is different (as you would exp=
ect)
> but I don't see what implicit assumption would be violated.

Tim, any clues? Michael is using gcc 3.3.6 and binutils 2.16.
It works fine with my 4.1.2/2.18 vombo.

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
