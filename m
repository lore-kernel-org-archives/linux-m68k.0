From: Nick Krause <xerofoify@gmail.com>
Subject: Re: [PATCH] m68k: Remove FIXME comment in file sun3_pgalloc.h
Date: Fri, 4 Jul 2014 02:03:09 -0400
Message-ID: <CAPDOMVhvuvWesMev-5dOFA78Sf67o0kUCXR2VkdhE-xeiYQ=6w__42274.8851975941$1404453811$gmane$org@mail.gmail.com>
References: <1404351693-5588-1-git-send-email-xerofoify@gmail.com>
	<alpine.LNX.2.00.1407041125060.15901@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1407041125060.15901@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: sammy@sammy.net, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

-/* FIXME - when we get this compiling */
>  /* erm, now that it's compiling, what do we do with it? */
What are these two lines for them another compile issue?
Cheers Nick

On Thu, Jul 3, 2014 at 9:28 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
>
> On Wed, 2 Jul 2014, Nicholas Krause wrote:
>
>> Removes a FIXME comment in this file due to it not compiling as it now
>> compiles.
>
> What got fixed?
>
> It doesn't say "FIXME - this doesn't compile".
>
>>
>> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
>> ---
>>  arch/m68k/include/asm/sun3_pgalloc.h | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/m68k/include/asm/sun3_pgalloc.h b/arch/m68k/include/asm/sun3_pgalloc.h
>> index f868506..1798f25 100644
>> --- a/arch/m68k/include/asm/sun3_pgalloc.h
>> +++ b/arch/m68k/include/asm/sun3_pgalloc.h
>> @@ -12,7 +12,6 @@
>>
>>  #include <asm/tlb.h>
>>
>> -/* FIXME - when we get this compiling */
>>  /* erm, now that it's compiling, what do we do with it? */
>>  #define _KERNPG_TABLE 0
>>
>>
>
> --
