From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 1/2] m68knommu: create config options for CPU classes
Date: Thu, 23 Jun 2011 11:35:50 +1000
Message-ID: <4E029876.6040507@snapgear.com>
References: <1307083397-9994-1-git-send-email-gerg@snapgear.com>	<1307083397-9994-3-git-send-email-gerg@snapgear.com> <BANLkTikuR5tNe=CQS9qCOJHGkKUWKmO-rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:23669 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758537Ab1FWBgN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Jun 2011 21:36:13 -0400
In-Reply-To: <BANLkTikuR5tNe=CQS9qCOJHGkKUWKmO-rw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 03/06/11 21:15, Geert Uytterhoeven wrote:
> On Fri, Jun 3, 2011 at 08:43,<gerg@snapgear.com>  wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> There are 3 families of CPU core types that we support in the m68knommu
>> architecture branch. They are
>>
>> . traditional 68000
>> . CPU32 (which is a 68020 core derivitive without MMU)
>
> derivative ... and without bitfield instructions.
>
>> . ColdFire
>
>> It will be useful going forward to have a CONFIG_ option defined for
>> each type. We already have one for ColdFire (CONFIG_COLDFIRE), so add
>> for the other 2 families, CONFIG_M68000 and CONFIG_MCPU32.
>
> I'm wondering whether it would help to have Kconfig symbols for the
> instruction capabilities as well.
> Then you have to document these capabilities in the kconfig definition only,
> and can use single (e.g.) #ifdef CONFIG_CPU_HAS_BITFIELDS tests everywhere
> else, instead of duplicating the logic at every #ifdef.

I have just posted a modified version of the bitops.h merge that
creates and uses a CONFIG_CPU_HAS_BITFIELDS option. The patch is
otherwise the same in terms of changes, just uses this define
for the ifdefs.

If you/others prefer this we can run with this one.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
