From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH 06/22] m68k/coldfire: Modernize printing of kernel
 messages
Date: Fri, 9 Dec 2016 22:09:25 +1000
Message-ID: <b3e66b97-e8f3-f203-6479-6b8509844301@linux-m68k.org>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
 <1481123360-10978-7-git-send-email-geert@linux-m68k.org>
 <alpine.LNX.2.00.1612080949540.9219@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1612080949540.9219@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Finn, Geert,

On 08/12/16 08:53, Finn Thain wrote:
>
> On Wed, 7 Dec 2016, Geert Uytterhoeven wrote:
>
>>   - Introduce helpers for printing debug messages, incl. dummies for
>>     validating format strings when debugging is disabled,
>>   - Convert from printk() to pr_*(),
>>   - Correct printf()-style format specifiers,
>>   - Drop superfluous casts,
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> ---
>>  arch/m68k/coldfire/m528x.c          |  4 +-
>>  arch/m68k/coldfire/sltimers.c       |  4 +-
>>  arch/m68k/coldfire/timers.c         |  4 +-
>>  arch/m68k/coldfire/vectors.c        |  2 +-
>>  arch/m68k/include/asm/dma.h         | 98 +++++++++++++------------------------
>>  arch/m68k/include/asm/mcf_pgtable.h |  9 ++--
>>  6 files changed, 44 insertions(+), 77 deletions(-)
>>
[snip]
>> diff --git a/arch/m68k/coldfire/vectors.c b/arch/m68k/coldfire/vectors.c
>> index 08923fe600e013d9..a185df5963d4ae50 100644
>> --- a/arch/m68k/coldfire/vectors.c
>> +++ b/arch/m68k/coldfire/vectors.c
>> @@ -24,7 +24,7 @@
>>  asmlinkage void dbginterrupt_c(struct frame *fp)
>>  {
>>  	extern void dump(struct pt_regs *fp);
>> -	printk(KERN_DEBUG "%s(%d): BUS ERROR TRAP\n", __FILE__, __LINE__);
>> +	pr_debug("%s(%d): BUS ERROR TRAP\n", __FILE__, __LINE__);
>>  	dump((struct pt_regs *) fp);
>>  	asm("halt");
>>  }
>
> This file also seems to lack #define DEBUG, so you and Greg might want to
> check this change.

I think we still want this message in, even if DEBUG is
not defined. This code is conditionally compiled in for
hardware debuger processing - and this message should really
come out if this trap case occurs so the user has some idea
that it just tripped. (The text of the message is not perfect,
but that is a separate issue).

Perhaps pr_alert() or pr_crit() would be better?

Regards
Greg
