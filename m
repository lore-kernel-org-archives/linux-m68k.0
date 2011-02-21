From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: merge of m68knommu and m68k arch branches?
Date: Mon, 21 Feb 2011 08:41:24 +0100
Message-ID: <AANLkTimtr0JbmM2PNtGRyAKE7kNr_FXd==ZC3bM82xsG@mail.gmail.com>
References: <4D5DB83D.80205@snapgear.com>
	<AANLkTin0X-ST=rZqwfCA0i5VGCh5ygYXyZFdndiDgR_2@mail.gmail.com>
	<AANLkTim=kQOMyKqOEkw5iQjpGhDf0YGMe1ZTnJZkKfr7@mail.gmail.com>
	<4D5EEEBB.7050708@snapgear.com>
	<AANLkTimmfUJASL47Cs80FJ2mkx3PPvAX57x43nF09tns@mail.gmail.com>
	<4D61A986.3060308@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:41095 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751751Ab1BUHl0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 21 Feb 2011 02:41:26 -0500
In-Reply-To: <4D61A986.3060308@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Steven King <sfking00@yahoo.com>, uClinux development list <uclinux-dev@uclinux.org>, Greg Ungerer <gerg@uclinux.org>, Greg Ungerer <gregungerer@westnet.com.au>

On Mon, Feb 21, 2011 at 00:53, Greg Ungerer <gerg@snapgear.com> wrote:
> On 19/02/11 18:39, Geert Uytterhoeven wrote:
>>
>> On Fri, Feb 18, 2011 at 23:12, Greg Ungerer<gerg@snapgear.com> =C2=A0=
wrote:
>>>
>>> On 19/02/11 01:24, Geert Uytterhoeven wrote:
>>>>
>>>> On Fri, Feb 18, 2011 at 12:27, Geert Uytterhoeven<geert@linux-m68k=
=2Eorg>
>>>> =C2=A0wrote:
>>>>>
>>>>> On Fri, Feb 18, 2011 at 01:07, Greg Ungerer<gerg@snapgear.com>
>>>>> =C2=A0wrote:
>>>>>>
>>>>>> I would like to put up for discussion a merge of the m68knommu a=
nd
>>>>>> m68k arch branches.
>>>>>>
>>>>>> Attached is a script and patch that does a kind of brute force
>>>>>> simplistic merge of the directories and files. (Thanks to Stephe=
n King
>>>>>> <sfking@fdwdc.com> =C2=A0 =C2=A0for the initial version of this =
script, and to
>>>>>> Sam Ravnborg for the m68k includes merge script this was based o=
n).
>>>>>> Nothing outside of the arch/m68k and arch/m68knommu directories =
is
>>>>>> touched, and in the end there is no more arch/m68knommu. To appl=
y you
>>>>>> simply run the script from the top of a current kernel git tree =
(I
>>>>>> used
>>>>>> 2.6.38-rc5 for testing) and then apply the patch.
>>>>>
>>>>> Building...
>>>>
>>>> Builds fine (all test configs), runs on ARAnyM.
>>>>
>>>> Let's go ahead?
>>>
>>> What sort of timing do you think makes sense?
>>> Is for 2.6.39 too soon?
>>
>> Personally, I don't mind. 2.6.39 is OK for me. I guess the safest wa=
y
>> is to let Linus
>> execute the script? Before or after the merge window?
>
> Well I was going to construct the merge as a single git commit
> (which is equivalent to running this script and applying the patch).
> Linus would then just pull this.
>
> The best timing for me is near the end of the merge window.
> That way we can both get in any other changes first.

Sounds like a plan, OK!

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
