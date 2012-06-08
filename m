From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [PATCH] m68knommu: allow ColdFire CPUs to use unaligned
	accesses
Date: Fri, 8 Jun 2012 15:35:03 +0200
Message-ID: <20120608133503.GA12617@frolo.macqel>
References: <1339134180-13630-1-git-send-email-gerg@snapgear.com> <20120608103931.GA26964@frolo.macqel> <4FD1EDDF.1040101@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailrelay004.isp.belgacom.be ([195.238.6.170]:21003 "EHLO
	mailrelay004.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751590Ab2FHNfH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Jun 2012 09:35:07 -0400
Content-Disposition: inline
In-Reply-To: <4FD1EDDF.1040101@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Greg,

On Fri, Jun 08, 2012 at 10:19:43PM +1000, Greg Ungerer wrote:
> Hi Philippe,
>
> On 06/08/2012 08:39 PM, Philippe De Muyter wrote:
>> On Fri, Jun 08, 2012 at 03:43:00PM +1000, gerg@snapgear.com wrote:
>>> From: Greg Ungerer<gerg@uclinux.org>
>>>
>>> All current ColdFire CPUs are able to support unaligned memory acce=
sses.
>>> So remove the CONFIG_CPU_HAS_NO_UNALIGNED option selection for Cold=
=46ire.
>>>
>>> It seems that the current restriction was inherrited from the early=
=20
>>> non-MMU
>>> support for the basic 68000 proecssors - which do not support unali=
gned
>>> accesses.
>>
>> It seems that the first ColdFires needed the restriction :
>>
>> I read in the "MCF5200 ColdFire Family Programmer=C3=83=E2=80=A0s Re=
ference Manual"=20
>> :
>>
>> The ColdFire processor default configuration supports word- and
>> longword-sized operand references on 0-modulo-2 and 0-modulo-4
>> addresses, respectively. All other references are defined as
>> misaligned accesses. Any attempt to access a misaligned operand
>> generates an address-error exception, unless the optional hardware
>> module for handling misalignment is present. This misalignment
>> module converts any misaligned operand references into a series
>> of aligned bus cycles to access the data. The existence of the
>> misalignment module is implementation-dependent and is documented
>> in the appropriate ColdFire user=C3=83=E2=80=A0s manual.

I mentionned that only to make you able to soften the commit comment :)

>
> I wish Freescale really did make that clear within the doco for each
> part!
>
> The oldest (and I assume simplest) part we support is the 5206, and i=
t
> does explicitly state in the MCF5206UM that it supports unaligned
> accesses (Section 6.6). It is not as clear as this in some of the
> other CPU/SoC User Manuals that I looked through.
>
> I am pretty confident that all the parts we currently support in Linu=
x
> do unaligned accesses.

I agree.  And if some parts did not implement it, we'd see it quickly.

Regards

Philippe
