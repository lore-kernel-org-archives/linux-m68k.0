From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: remove ptrace_signal_deliver
Date: Mon, 19 Jun 2017 19:45:53 +0200
Message-ID: <CAMuHMdWNP19HP90A86i1+xV8JR-dRX6Yddet2XZs=nUnbftz4Q@mail.gmail.com>
References: <877f0oojfj.fsf@linux-m68k.org> <CAMuHMdXSG_js64tdosFa6ofHrk=Z5u3oUDwHn-TQ6VnjXK1U8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:33366 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751024AbdFSRpz (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 19 Jun 2017 13:45:55 -0400
In-Reply-To: <CAMuHMdXSG_js64tdosFa6ofHrk=Z5u3oUDwHn-TQ6VnjXK1U8w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>, Roland McGrath <roland@hack.frob.com>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jun 12, 2017 at 9:40 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> If you don't mind, I plan to queue this up in the m68k tree for v4.13.
> There are no conflicts with current linux-next.
>
> If you prefer to take this through a signal tree with my
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> please let me know.
>
> Thanks!
>
> On Wed, Jun 7, 2017 at 12:11 AM, Andreas Schwab <schwab@linux-m68k.org> wrote:
>> This fixes debugger syscall restart interactions.  A debugger that
>> modifies the tracee's program counter is expected to set the orig_d0
>> pseudo register to -1, to disable a possible syscall restart.
>>
>> This removes the last user of the ptrace_signal_deliver hook in the ptrace
>> signal handling, so remove that as well.
>>
>> Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>

Applied and queued for v4.13.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
