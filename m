From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [uClinux-dev] [PATCH] m68k: reorganize Kconfig options to improve
 mmu/non-mmu selections
Date: Mon, 15 Aug 2011 10:53:35 +1000
Message-ID: <4E486E0F.3080601@snapgear.com>
References: <1313039421-26075-1-git-send-email-gerg@snapgear.com> <20110811061522.GC21757@merkur.ravnborg.org> <4E437A0B.3030201@snapgear.com> <20110812043022.GB4940@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:10969 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751066Ab1HOAuL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 14 Aug 2011 20:50:11 -0400
In-Reply-To: <20110812043022.GB4940@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Brad,

On 12/08/11 14:30, Brad Boyer wrote:
> On Thu, Aug 11, 2011 at 04:43:23PM +1000, Greg Ungerer wrote:
>>> Do you really need EISA, MCA and PCMIA? They have no promt thus cannot be selected by the user.
>>
>> Yes, your right, they don't look like than can be selected at all.
>> None of the default configs seem to reference them either.
>> Geert: do you know why these options might still be around?
>>
>
> It still hasn't been cleaned up enough to go in, but somebody posted
> a trex driver which would need PCMCIA. It was a driver for the card
> slots in the Macintosh PowerBook 190.
>
> In theory some other m68k systems have PCMCIA slots that could be
> supported as well. I'm sure they're almost as broken and non-standards
> compliant as what Apple did.

Even if we remove these options now they can always be re-introduced
if and when a driver that needs them is ready for mainline.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
