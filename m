From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 06/36] m68k: modify user space access functions to support
 ColdFire CPUs
Date: Mon, 31 Oct 2011 15:03:12 +1000
Message-ID: <4EAE2C10.5050908@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>	<1319527168-11166-7-git-send-email-gerg@snapgear.com> <CAMuHMdVRvncpVWNa+2EUybv3+v+3PzQ4R_7-sqV71pVqQ67qoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:57177 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752060Ab1JaFCI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Oct 2011 01:02:08 -0400
In-Reply-To: <CAMuHMdVRvncpVWNa+2EUybv3+v+3PzQ4R_7-sqV71pVqQ67qoQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 30/10/11 23:02, Geert Uytterhoeven wrote:
> On Tue, Oct 25, 2011 at 09:18,<gerg@snapgear.com>  wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> Modify the user space access functions to support the ColdFire V4e cores
>> running with MMU enabled.
>>
>> The ColdFire processors do not support the "moves" instruction used by
>> the traditional 680x0 processors for moving data into and out of another
>> address space. They only support the notion of a single address space,
>> and you use the usual "move" instruction to access that.
>>
>> I am interrested in what others think if this approach. It is a little
>> ugly, but it does mean that the same code is used, not a complete
>> duplicate that is almost the same except for the "moves" instructions.
>> It does also mean in this form that it is an either/or compile. It
>> can't support both ColdFire and 680x0 in the same binary as it is.
>>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>
>> +#ifdef CONFIG_COLDFIRE
>> +/*
>> + * The ColdFire processors do not support the moves instruction used by
>> + * the traditional 680x0 processors for moving data into and out of
>> + * another address space. They only support the notion of a single address
>> + * space, and you use the usual move instruction to access that.
>> + *
>> + * All the user space access functions are otherwise the same on ColdFire
>> + * as the other 680x0 processors. So lets keep the code simple and just
>> + * define in what we need to use.
>> + */
>> +#define	MOVES	"move"
>> +#else
>> +#define	MOVES	"moves"
>> +#endif /* CONFIG_COLDFIRE */
>
> I did the same thing originally when trying to get uClinux running on
> MMU-less Amigas, so it's fine for me.
>
> If I'm not mistaken, this will also make it easier to merge uaccess.h again in
> the long run, as the version with "move" should work on all MMU-less
> platforms, right?

Yes, very good point. I hadn't even considered then when I was trying
to make this work. Another good reason to go with it :-)

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
