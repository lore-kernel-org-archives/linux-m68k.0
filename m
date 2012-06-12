From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68knommu: allow ColdFire CPUs to use unaligned accesses
Date: Tue, 12 Jun 2012 12:25:44 +1000
Message-ID: <4FD6A8A8.1070809@snapgear.com>
References: <1339134180-13630-1-git-send-email-gerg@snapgear.com> <20120608103931.GA26964@frolo.macqel> <4FD1EDDF.1040101@snapgear.com> <20120608133503.GA12617@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:41072 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752447Ab2FLC1Z convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 11 Jun 2012 22:27:25 -0400
In-Reply-To: <20120608133503.GA12617@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Philippe,

On 08/06/12 23:35, Philippe De Muyter wrote:
> On Fri, Jun 08, 2012 at 10:19:43PM +1000, Greg Ungerer wrote:
>> Hi Philippe,
>>
>> On 06/08/2012 08:39 PM, Philippe De Muyter wrote:
>>> On Fri, Jun 08, 2012 at 03:43:00PM +1000, gerg@snapgear.com wrote:
>>>> From: Greg Ungerer<gerg@uclinux.org>
>>>>
>>>> All current ColdFire CPUs are able to support unaligned memory acc=
esses.
>>>> So remove the CONFIG_CPU_HAS_NO_UNALIGNED option selection for Col=
dFire.
>>>>
>>>> It seems that the current restriction was inherrited from the earl=
y
>>>> non-MMU
>>>> support for the basic 68000 proecssors - which do not support unal=
igned
>>>> accesses.
>>>
>>> It seems that the first ColdFires needed the restriction :
>>>
>>> I read in the "MCF5200 ColdFire Family Programmer=E2=94=9C=C3=A5s R=
eference Manual"
>>> :
>>>
>>> The ColdFire processor default configuration supports word- and
>>> longword-sized operand references on 0-modulo-2 and 0-modulo-4
>>> addresses, respectively. All other references are defined as
>>> misaligned accesses. Any attempt to access a misaligned operand
>>> generates an address-error exception, unless the optional hardware
>>> module for handling misalignment is present. This misalignment
>>> module converts any misaligned operand references into a series
>>> of aligned bus cycles to access the data. The existence of the
>>> misalignment module is implementation-dependent and is documented
>>> in the appropriate ColdFire user=E2=94=9C=C3=A5s manual.
>
> I mentionned that only to make you able to soften the commit comment =
:)

Ok, makes sense. I should probably have mentioned that this means
the ColdFire processors currently support by Linux :-)

Something like:

   All of the current Linux supported ColdFire CPUs handle unaligned
   memory accesses. So remove the CONFIG_CPU_HAS_NO_UNALIGNED option
   selection for ColdFire. If we ever support a specific ColdFire CPU
   that does not support unaligned accesses then we can insert the
   CONFIG_CPU_HAS_NO_UNALIGNED for that specific CPU type.


>> I wish Freescale really did make that clear within the doco for each
>> part!
>>
>> The oldest (and I assume simplest) part we support is the 5206, and =
it
>> does explicitly state in the MCF5206UM that it supports unaligned
>> accesses (Section 6.6). It is not as clear as this in some of the
>> other CPU/SoC User Manuals that I looked through.
>>
>> I am pretty confident that all the parts we currently support in Lin=
ux
>> do unaligned accesses.
>
> I agree.  And if some parts did not implement it, we'd see it quickly=
=2E

Yep.

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
