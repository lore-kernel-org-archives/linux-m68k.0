From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [uClinux-dev] [PATCH v2 1/6] m68k: merge mmu and non-mmu	versions
 of muldi3
Date: Wed, 20 Apr 2011 21:01:39 +1000
Message-ID: <4DAEBD13.7070605@snapgear.com>
References: <1303278880-16153-1-git-send-email-gerg@snapgear.com> <1303278880-16153-2-git-send-email-gerg@snapgear.com> <1303278880-16153-3-git-send-email-gerg@snapgear.com> <20110420080609.GA24244@merkur.ravnborg.org> <BANLkTi=9ZNg+eh6S1NeyJaCs4e0tRjJELQ@mail.gmail.com> <20110420091216.GB3296@frolo.macqel> <4DAEA7F5.6080603@snapgear.com> <20110420095529.GC3296@frolo.macqel> <4DAEB2E1.6050404@snapgear.com> <20110420103802.GA26891@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:51575 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752707Ab1DTLCS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2011 07:02:18 -0400
In-Reply-To: <20110420103802.GA26891@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

Hi Philippe,

On 20/04/11 20:38, Philippe De Muyter wrote:
> Hi Greg,
>
> On Wed, Apr 20, 2011 at 08:18:09PM +1000, Greg Ungerer wrote:
>>>
>>> The 68340 has it also. (And I have an old linux port for this processor)
>>
>> That is just a SoC that contains a 68020 though, so __mc68020__ would
>> be defined for that.
>
> No, this is a cpu32 core, which is a subset of a 68020, so gcc does not
> define __mc68020__, or at least should not (there are old bug reports
> about that).

Modern gcc still does, from a gcc-4.5.1:

# m68k-linux-gcc -mcpu32 -dM -E - < /dev/null | grep mc68020
#define __mc68020__ 1
#define __mc68020 1
#define mc68020 1


>>> I surmise the 68360 has it also.
>>
>> I believe that is a SoC with a 68040 cpu core, so I would expect that
>> __mc68040__ would be correct for that.
>
> This is a cpu32+ core.
>
> Same here.
>
> Not that it is that important now :)

Does cpu32 always support the 64bit mul?
If so we can just add __mcpu32__ to the conditional check list.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
