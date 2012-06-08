From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68knommu: allow ColdFire CPUs to use unaligned accesses
Date: Fri, 8 Jun 2012 22:19:43 +1000
Message-ID: <4FD1EDDF.1040101@snapgear.com>
References: <1339134180-13630-1-git-send-email-gerg@snapgear.com> <20120608103931.GA26964@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:58112 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760854Ab2FHMV1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Jun 2012 08:21:27 -0400
In-Reply-To: <20120608103931.GA26964@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Philippe,

On 06/08/2012 08:39 PM, Philippe De Muyter wrote:
> On Fri, Jun 08, 2012 at 03:43:00PM +1000, gerg@snapgear.com wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> All current ColdFire CPUs are able to support unaligned memory acces=
ses.
>> So remove the CONFIG_CPU_HAS_NO_UNALIGNED option selection for ColdF=
ire.
>>
>> It seems that the current restriction was inherrited from the early =
non-MMU
>> support for the basic 68000 proecssors - which do not support unalig=
ned
>> accesses.
>
> It seems that the first ColdFires needed the restriction :
>
> I read in the "MCF5200 ColdFire Family Programmer=C3=86s Reference Ma=
nual" :
>
> The ColdFire processor default configuration supports word- and
> longword-sized operand references on 0-modulo-2 and 0-modulo-4
> addresses, respectively. All other references are defined as
> misaligned accesses. Any attempt to access a misaligned operand
> generates an address-error exception, unless the optional hardware
> module for handling misalignment is present. This misalignment
> module converts any misaligned operand references into a series
> of aligned bus cycles to access the data. The existence of the
> misalignment module is implementation-dependent and is documented
> in the appropriate ColdFire user=C3=86s manual.

I wish Freescale really did make that clear within the doco for each
part!

The oldest (and I assume simplest) part we support is the 5206, and it
does explicitly state in the MCF5206UM that it supports unaligned
accesses (Section 6.6). It is not as clear as this in some of the
other CPU/SoC User Manuals that I looked through.

I am pretty confident that all the parts we currently support in Linux
do unaligned accesses.

Regards
Greg


-----------------------------------------------------------------------=
-
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.co=
m
SnapGear Group, McAfee                      PHONE:       +61 7 3435 288=
8
8 Gardner Close,                            FAX:         +61 7 3891 363=
0
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m
