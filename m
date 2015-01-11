From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arch: m68k: mvme147: config.c: Remove unused function
Date: Sun, 11 Jan 2015 11:42:57 +0100
Message-ID: <CAMuHMdVpEGQ0vkPKHDwF=1LHjLJSvyBi-yo_2rBoqQ2rF_S3+A@mail.gmail.com>
References: <1420130951-29766-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
	<CAMuHMdUSWJW=ozYgPSBysEk9hrVF0eqXScaHU25zPWzEyZYFbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUSWJW=ozYgPSBysEk9hrVF0eqXScaHU25zPWzEyZYFbw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jan 5, 2015 at 12:39 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Jan 1, 2015 at 5:49 PM, Rickard Strandqvist
> <rickard_strandqvist@spectrumdigital.se> wrote:
>> Remove the function mvme147_init_console_port() that is not used anywhere.
>>
>> This was partially found by using a static code analysis program called cppcheck.
>>
>> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
>> ---
>>  arch/m68k/mvme147/config.c |    5 -----
>>  1 file changed, 5 deletions(-)
>>
>> diff --git a/arch/m68k/mvme147/config.c b/arch/m68k/mvme147/config.c
>> index 1bb3ce6..5da5e6e 100644
>> --- a/arch/m68k/mvme147/config.c
>> +++ b/arch/m68k/mvme147/config.c
>> @@ -209,8 +209,3 @@ void m147_scc_write (struct console *co, const char *str, unsigned count)
>>         }
>>         local_irq_restore(flags);
>>  }
>> -
>> -void mvme147_init_console_port (struct console *co, int cflag)
>> -{
>> -       co->write    = m147_scc_write;
>> -}
>
> And after that m147_scc_write() becomes unused, and scc_write(), and
> scc_delay()... I will remove these, too.

Thanks, applied and queued for 3.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
