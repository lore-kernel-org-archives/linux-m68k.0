From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: merge of m68knommu and m68k arch branches?
Date: Sat, 19 Feb 2011 09:39:30 +0100
Message-ID: <AANLkTimmfUJASL47Cs80FJ2mkx3PPvAX57x43nF09tns@mail.gmail.com>
References: <4D5DB83D.80205@snapgear.com>
	<AANLkTin0X-ST=rZqwfCA0i5VGCh5ygYXyZFdndiDgR_2@mail.gmail.com>
	<AANLkTim=kQOMyKqOEkw5iQjpGhDf0YGMe1ZTnJZkKfr7@mail.gmail.com>
	<4D5EEEBB.7050708@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:63490 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751149Ab1BSIjb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 19 Feb 2011 03:39:31 -0500
In-Reply-To: <4D5EEEBB.7050708@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Steven King <sfking00@yahoo.com>, uClinux development list <uclinux-dev@uclinux.org>, Greg Ungerer <gerg@uclinux.org>, Greg Ungerer <gregungerer@westnet.com.au>

On Fri, Feb 18, 2011 at 23:12, Greg Ungerer <gerg@snapgear.com> wrote:
> On 19/02/11 01:24, Geert Uytterhoeven wrote:
>> On Fri, Feb 18, 2011 at 12:27, Geert Uytterhoeven<geert@linux-m68k.o=
rg>
>> =C2=A0wrote:
>>>
>>> On Fri, Feb 18, 2011 at 01:07, Greg Ungerer<gerg@snapgear.com> =C2=A0=
wrote:
>>>>
>>>> I would like to put up for discussion a merge of the m68knommu and
>>>> m68k arch branches.
>>>>
>>>> Attached is a script and patch that does a kind of brute force
>>>> simplistic merge of the directories and files. (Thanks to Stephen =
King
>>>> <sfking@fdwdc.com> =C2=A0for the initial version of this script, a=
nd to
>>>> Sam Ravnborg for the m68k includes merge script this was based on)=
=2E
>>>> Nothing outside of the arch/m68k and arch/m68knommu directories is
>>>> touched, and in the end there is no more arch/m68knommu. To apply =
you
>>>> simply run the script from the top of a current kernel git tree (I=
 used
>>>> 2.6.38-rc5 for testing) and then apply the patch.
>>>
>>> Building...
>>
>> Builds fine (all test configs), runs on ARAnyM.
>>
>> Let's go ahead?
>
> What sort of timing do you think makes sense?
> Is for 2.6.39 too soon?

Personally, I don't mind. 2.6.39 is OK for me. I guess the safest way
is to let Linus
execute the script? Before or after the merge window?

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
