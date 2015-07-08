From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [RFC 1/8] m68k: coldfire: unlink FPU presence from MMU activation
Date: Thu, 09 Jul 2015 00:12:34 +1000
Message-ID: <559D2FD2.5030206@westnet.com.au>
References: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>	<1436349092-2214-2-git-send-email-yannick.gicquel@gmail.com> <CAMuHMdXUh0JdQGzrzedskVhAHiBGvXMwJ7=44kDN5Qagj92icA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:23950
	"EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933875AbbGHOMh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Jul 2015 10:12:37 -0400
In-Reply-To: <CAMuHMdXUh0JdQGzrzedskVhAHiBGvXMwJ7=44kDN5Qagj92icA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On 09/07/15 00:03, Geert Uytterhoeven wrote:
> On Wed, Jul 8, 2015 at 11:51 AM, Yannick GICQUEL
> <yannick.gicquel@open.eurogiciel.org> wrote:
>> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
>> index 2dd8f63..d704c16 100644
>> --- a/arch/m68k/Kconfig
>> +++ b/arch/m68k/Kconfig
>> @@ -14,7 +14,7 @@ config M68K
>>          select GENERIC_IOMAP
>>          select GENERIC_STRNCPY_FROM_USER if MMU
>>          select GENERIC_STRNLEN_USER if MMU
>> -       select FPU if MMU
>> +       select FPU if MMU && !COLDFIRE
>
> I'm not too fond of having complex dependencies here...
>
>>          select ARCH_WANT_IPC_PARSE_VERSION
>>          select ARCH_USES_GETTIMEOFFSET if MMU && !COLDFIRE
>
> (but we already have examples like the above)
>
>>          select HAVE_FUTEX_CMPXCHG if MMU && FUTEX
>> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
>> index 33013df..3661eb4 100644
>> --- a/arch/m68k/Kconfig.cpu
>> +++ b/arch/m68k/Kconfig.cpu
>> @@ -257,6 +257,7 @@ config M54xx
>>   config M547x
>>          bool "MCF547x"
>>          select M54xx
>> +       select FPU
>
> ... perhaps the "select FPU" should be added to M68KCLASSIC, too,
> so we can get rid of the top one?

We use M68KCLASSIC for the non-MMU 68k families as well, and none
of those have FPU either. Maybe should we select FPU for each of
M68020, M68030, M68040 and M68060 in their configs?

Regards
Greg


> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
