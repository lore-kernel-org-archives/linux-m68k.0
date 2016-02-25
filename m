From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] m68k: use conventional function parameters for do_sigreturn
Date: Thu, 25 Feb 2016 11:42:08 +0100
Message-ID: <CAMuHMdVPsqEYwgoXrS6ecdPBUEvDqhaCBYNZPY7op02o70LonQ@mail.gmail.com>
References: <1455518189-12478-1-git-send-email-gerg@uclinux.org>
	<56CD031C.5040101@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ig0-f196.google.com ([209.85.213.196]:33147 "EHLO
	mail-ig0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759412AbcBYKmJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 25 Feb 2016 05:42:09 -0500
Received: by mail-ig0-f196.google.com with SMTP id hb3so676884igb.0
        for <linux-m68k@vger.kernel.org>; Thu, 25 Feb 2016 02:42:09 -0800 (PST)
In-Reply-To: <56CD031C.5040101@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>, Andreas Schwab <schwab@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Greg,

On Wed, Feb 24, 2016 at 2:10 AM, Greg Ungerer <gerg@uclinux.org> wrote:
> Do you have any objections or issues with this change?
>
> Andreas and Philippe kindly gave feedback, which I have addressed
> (I think to everyone's satisfaction?)
>
> I would very much like to see this applied to resolve the compilation
> issue for non-MMU with modern versions of gcc. I don't mind pushing
> through my tree. I just want to make sure first that nobody objects
> to this change or has any remaining issues with it.

If Andreas is happy with it, I will apply it.
Andreas?

> On 15/02/16 16:36, Greg Ungerer wrote:
>> Create conventional stack parameters for the calls to do_sigreturn and
>> do_rt_sigreturn. The current C code for do_sigreturn and do_rt_sigreturn
>> dig into the stack to create local pointers to the saved switch stack
>> and the pt_regs structs.
>>
>> The motivation for this change is a problem with non-MMU targets that
>> have broken signal return paths on newer versions of gcc. It appears as
>> though gcc has determined that the pointers into the saved stack structs,
>> and the saved structs themselves, are function parameters and updates to
>> them will be lost on function return, so they are optimized away. This
>> results in large parts of restore_sigcontext() and mangle_kernel_stack()
>> functions being removed. Of course this results in non-functional code
>> causing kernel oops. This problem has been observed with gcc version
>> 5.2 and 5.3, and probably exists in earlier versions as well.
>>
>> Using conventional stack parameter pointers passed to these functions has
>> the advantage of the code here not needing to know the exact details of
>> how the underlying entry handler layed these structs out on the stack.
>> So the rather ugly pointer setup casting and arg referencing can be
>> removed.
>>
>> The resulting code after this change is a few bytes larger (due to the
>> overhead of creating the stack args and their tear down). Not being hot
>> paths I don't think this is too much of a problem here.
>>
>> An alternative solution is to put a barrier() in the do_sigreturn() code,
>> but this doesn't feel quite as clean as this solution.
>>
>> This change has been compile tested on all defconfigs, and run tested on
>> Atari (through aranym), ColdFire with MMU (M5407EVB) and ColdFire with
>> no-MMU (QEMU and M5208EVB).
>>
>> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
