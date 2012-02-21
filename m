From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: merge the mmu and non-mmu versions of ptrace.c
Date: Tue, 21 Feb 2012 16:31:27 +1000
Message-ID: <4F433A3F.7010804@snapgear.com>
References: <1328585132-31029-1-git-send-email-gerg@snapgear.com> <CAMuHMdXE1fHSUpn5neu7VTGZs30q=O-WdC2F-qrt1QKy9TL9Mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:59289 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751593Ab2BUGcU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 21 Feb 2012 01:32:20 -0500
In-Reply-To: <CAMuHMdXE1fHSUpn5neu7VTGZs30q=O-WdC2F-qrt1QKy9TL9Mg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 19/02/12 20:12, Geert Uytterhoeven wrote:
> On Tue, Feb 7, 2012 at 04:25,<gerg@snapgear.com>  wrote:
>> --- a/arch/m68k/kernel/ptrace_mm.c
>> +++ b/arch/m68k/kernel/ptrace.c
>> @@ -277,7 +287,6 @@ asmlinkage void syscall_trace(void)
>> 	}
>> }
>>
>> -#ifdef CONFIG_COLDFIRE
>> asmlinkage int syscall_trace_enter(void)
>> {
>> 	int ret = 0;
>> @@ -292,4 +301,3 @@ asmlinkage void syscall_trace_leave(void)
>> 	if (test_thread_flag(TIF_SYSCALL_TRACE))
>> 		tracehook_report_syscall_exit(task_pt_regs(current), 0);
>> }
>> -#endif /* CONFIG_COLDFIRE */
>
> Why have you dropped the #ifdef?

Purely to have less "#ifdef"s in the code.
Does bloat the code a little, would you prefer I leave the #ifdef there?

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
