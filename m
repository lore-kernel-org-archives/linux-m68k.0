From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [uClinux-dev] [PATCH v2 1/6] m68k: merge mmu and non-mmu	versions
 of muldi3
Date: Wed, 20 Apr 2011 20:18:09 +1000
Message-ID: <4DAEB2E1.6050404@snapgear.com>
References: <1303278880-16153-1-git-send-email-gerg@snapgear.com> <1303278880-16153-2-git-send-email-gerg@snapgear.com> <1303278880-16153-3-git-send-email-gerg@snapgear.com> <20110420080609.GA24244@merkur.ravnborg.org> <BANLkTi=9ZNg+eh6S1NeyJaCs4e0tRjJELQ@mail.gmail.com> <20110420091216.GB3296@frolo.macqel> <4DAEA7F5.6080603@snapgear.com> <20110420095529.GC3296@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:29090 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753717Ab1DTKUz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2011 06:20:55 -0400
In-Reply-To: <20110420095529.GC3296@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

Hi Philippe,

On 20/04/11 19:55, Philippe De Muyter wrote:
> On Wed, Apr 20, 2011 at 07:31:33PM +1000, Greg Ungerer wrote:
>> On 20/04/11 19:12, Philippe De Muyter wrote:
>>> On Wed, Apr 20, 2011 at 10:55:15AM +0200, Geert Uytterhoeven wrote:
>>>> On Wed, Apr 20, 2011 at 10:06, Sam Ravnborg<sam@ravnborg.org>   wr=
ote:
>>>>> Hi Greg.
>>>>>
>>>>>> +
>>>>>> +#if defined(__mc68020__) || defined(__mc68030__) || \
>>>>>> + =E2=94=9C=C3=AD =E2=94=9C=C3=ADdefined(__mc68040__) || defined=
(__mc68060__)
> (*)
>>>>>
>>>>> Why use these to decide if this is MMU or not?
>>>>> This code is not exposed to user-space so we can rely on CONFIG_*
>>>>> symbols.
>>>>> IMO the CONIFG_* symbols is easier to read/maintain.
>>>>
>>>> Because technically it doesn't depend on having a MMU or not, but =
on
>>>> having
>>>> the full 32-bit multiplication instruction or not.
>>>>
>>>> Does Coldfire-with-MMU (for which we haven't integrated the suppor=
t
>>>> yet) have that
>>>> instruction?
>>>
>>> Actually, MCF547x&   MCF548x (CFv4e family) are integrated but with=
out
> (*)
>>> their
>>> limited MMU functionality.
>>>
>>> freescale had even written an mmu port for 2.6.25 but has not pushe=
d it
>>> upstream.  This port can be found on their site or in the openwrt
>>> repository.
>>
>> Part of my plan with the merge of m68k and m68knommu is to make
>> it easy to support the v4e parts with MMU enabled. And certainly as
>> I work through cleaning the individual files up I am doing it
>> with this in mind. Of course most of the code to support the v4e
>> is the same no matter if you have the MMU enabled or not.
>>
>> I have Freescales 2.6.25 kernel, but it is really only a reference
>> point for this work.
>>
>>> MCF547x&   MCF548x do not have that instruction.
> (*)
>>
>> Thats right. I believe the processors listed in the patch are
>> the only ones that currently support the 64bit mul.
>
> The 68340 has it also. (And I have an old linux port for this process=
or)

That is just a SoC that contains a 68020 though, so __mc68020__ would
be defined for that.


> I surmise the 68360 has it also.

I believe that is a SoC with a 68040 cpu core, so I would expect that
__mc68040__ would be correct for that.


> Philippe
>
> (*) Greg, there must be something with your mail installation : it ga=
rbles
> the messages. (or is it mine, but I noticed that only with replies fr=
om you ?)

Unfortunately mail getting to me goes through an MS exchange server
that tends to garble some parts of emails. Not too much I can do
about that (at least using the existing gerg@snapgear.com email
address).

Regards
Greg


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
