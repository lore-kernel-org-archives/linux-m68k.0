From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 1/2] net: add support for NS8390 based eth controllers
 on some ColdFire boards
Date: Tue, 26 Jun 2012 20:14:21 +1000
Message-ID: <4FE98B7D.4040506@snapgear.com>
References: <1340587792-8596-1-git-send-email-gerg@snapgear.com> <1340587792-8596-2-git-send-email-gerg@snapgear.com> <CAMuHMdXWCmDfGw65Ckr082xx8x4yJyG62wiNj0i4khxU2k3AhA@mail.gmail.com> <4FE945CA.6060509@snapgear.com> <CAMuHMdUmKkiHmEvSo7wgVMdE4=KcGoA=f9eJ_KFkc1OGrqm=3w@mail.gmail.com> <4FE98777.4090600@snapgear.com> <CAMuHMdXSTZ_vxhXr+0GuB+tXdjO3dNC2OVPC1OLci0POaShW2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:33456 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753449Ab2FZKQs (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 26 Jun 2012 06:16:48 -0400
In-Reply-To: <CAMuHMdXSTZ_vxhXr+0GuB+tXdjO3dNC2OVPC1OLci0POaShW2Q@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org

On 06/26/2012 08:03 PM, Geert Uytterhoeven wrote:
> On Tue, Jun 26, 2012 at 11:57 AM, Greg Ungerer<gerg@snapgear.com>  wrote:
>> On 06/26/2012 05:47 PM, Geert Uytterhoeven wrote:
>>> On Tue, Jun 26, 2012 at 7:16 AM, Greg Ungerer<gerg@snapgear.com>    wrote:
>>>> On 06/25/2012 05:59 PM, Geert Uytterhoeven wrote:
>>>>> On Mon, Jun 25, 2012 at 3:29 AM,<gerg@snapgear.com>      wrote:
>>>>>>
>>>>>>   arch/m68k/include/asm/mcfne.h       |  129 +---------
>>>>>
>>>>> mcf8390.h?
>>>>> mcfne.h is queued for removal.
>>>>
>>>> I was trying to save it :-)
>>>> Do you think I should just silently move the modified mcfne.h
>>>> to a mcf8390.h?
>>>
>>> Sure. Why not?
>>
>> We lose any git history linking the original and new file.
>
> Your commit renaming-and-modifying it will provide the link?

I would normally do that with a "git mv". But isn't that going to
clash with your "git rm"?  Or am I mis-understanding what you mean?

Regards
Greg


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
