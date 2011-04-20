From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [uClinux-dev] [PATCH v2 1/6] m68k: merge mmu and non-mmu
	versions of muldi3
Date: Wed, 20 Apr 2011 11:55:29 +0200
Message-ID: <20110420095529.GC3296@frolo.macqel>
References: <1303278880-16153-1-git-send-email-gerg@snapgear.com> <1303278880-16153-2-git-send-email-gerg@snapgear.com> <1303278880-16153-3-git-send-email-gerg@snapgear.com> <20110420080609.GA24244@merkur.ravnborg.org> <BANLkTi=9ZNg+eh6S1NeyJaCs4e0tRjJELQ@mail.gmail.com> <20110420091216.GB3296@frolo.macqel> <4DAEA7F5.6080603@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailrelay001.isp.belgacom.be ([195.238.6.51]:47916 "EHLO
	mailrelay001.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753593Ab1DTJze (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 20 Apr 2011 05:55:34 -0400
Content-Disposition: inline
In-Reply-To: <4DAEA7F5.6080603@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

On Wed, Apr 20, 2011 at 07:31:33PM +1000, Greg Ungerer wrote:
> On 20/04/11 19:12, Philippe De Muyter wrote:
>> On Wed, Apr 20, 2011 at 10:55:15AM +0200, Geert Uytterhoeven wrote:
>>> On Wed, Apr 20, 2011 at 10:06, Sam Ravnborg<sam@ravnborg.org>  wrot=
e:
>>>> Hi Greg.
>>>>
>>>>> +
>>>>> +#if defined(__mc68020__) || defined(__mc68030__) || \
>>>>> + =C3=A1 =C3=A1defined(__mc68040__) || defined(__mc68060__)
(*)
>>>>
>>>> Why use these to decide if this is MMU or not?
>>>> This code is not exposed to user-space so we can rely on CONFIG_*=20
>>>> symbols.
>>>> IMO the CONIFG_* symbols is easier to read/maintain.
>>>
>>> Because technically it doesn't depend on having a MMU or not, but o=
n=20
>>> having
>>> the full 32-bit multiplication instruction or not.
>>>
>>> Does Coldfire-with-MMU (for which we haven't integrated the support
>>> yet) have that
>>> instruction?
>>
>> Actually, MCF547x&  MCF548x (CFv4e family) are integrated but withou=
t=20
(*)
>> their
>> limited MMU functionality.
>>
>> freescale had even written an mmu port for 2.6.25 but has not pushed=
 it
>> upstream.  This port can be found on their site or in the openwrt=20
>> repository.
>
> Part of my plan with the merge of m68k and m68knommu is to make
> it easy to support the v4e parts with MMU enabled. And certainly as
> I work through cleaning the individual files up I am doing it
> with this in mind. Of course most of the code to support the v4e
> is the same no matter if you have the MMU enabled or not.
>
> I have Freescales 2.6.25 kernel, but it is really only a reference
> point for this work.
>
>> MCF547x&  MCF548x do not have that instruction.
(*)
>
> Thats right. I believe the processors listed in the patch are
> the only ones that currently support the 64bit mul.

The 68340 has it also. (And I have an old linux port for this processor=
)

I surmise the 68360 has it also.

Philippe

(*) Greg, there must be something with your mail installation : it garb=
les
the messages. (or is it mine, but I noticed that only with replies from=
 you ?)
