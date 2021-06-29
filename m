Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F7CC11F66
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Jun 2021 07:36:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20A5C61DD1
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Jun 2021 07:36:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbhF2Hi2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Jun 2021 03:38:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:45876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232233AbhF2Hi2 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 29 Jun 2021 03:38:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8644D61DB6;
        Tue, 29 Jun 2021 07:36:00 +0000 (UTC)
Subject: Re: [PATCH v6 1/2] m68k/kernel - wire up syscall_trace_enter/leave
 for m68k
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Andreas Schwab <schwab@linux-m68k.org>
References: <1624495560-6351-1-git-send-email-schmitzmic@gmail.com>
 <1624495560-6351-2-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdWoX=6Yf7MZXR92Q3APYixY5MDM6MW_UUf0DO2+oDkHAQ@mail.gmail.com>
 <aeac601a-a6ff-678b-83dc-48dacb430ec3@gmail.com>
 <CAMuHMdXJMuCGv7O8oPLG9YL-VZPzs5ZrrJU769Ks8YRh14c+FA@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <23eb0e8f-a9d1-24b5-2d97-3dbcbd2bfaaa@linux-m68k.org>
Date:   Tue, 29 Jun 2021 17:35:58 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXJMuCGv7O8oPLG9YL-VZPzs5ZrrJU769Ks8YRh14c+FA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael, Geert,

On 29/6/21 5:31 pm, Geert Uytterhoeven wrote:
> Hi Michael,
> 
> On Tue, Jun 29, 2021 at 12:16 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> On 28/06/21 7:25 pm, Geert Uytterhoeven wrote:
>>> On Thu, Jun 24, 2021 at 2:46 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>>>> m68k (other than Coldfire) uses syscall_trace for both trace entry
>>>> and trace exit. Seccomp support requires separate entry points for
>>>> trace entry and exit which are already provided for Coldfire.
>>>>
>>>> Replace syscall_trace by syscall_trace_enter and syscall_trace_leave
>>>> in preparation for seccomp support. Check return code of
>>>> syscall_trace_enter(), and skip syscall if -1. Return code will be
>>>> left at what had been set by ptrace or seccomp (in regs->d0).
>>>>
>>>> No regression seen in testing with strace on ARAnyM.
>>>>
>>>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>>> b
>>> Thanks for your patch!
>>>
>>>>    arch/m68k/kernel/entry.S  |  8 +++++---
>>> We need similar changes to arch/m68k/68000/entry.S and
>>> arch/m68k/coldfire/entry.S
>>
>> Do you have a current defconfig for 68000? I've test compiled my patch
>> with two coldfire defconfigs, but could not find one for m68kclassic ...
> 
> Unfortunately not.
> Greg?

Sorry, no, I don't have one.
Whenever I need to compile for a 68000 target I manually configure one
("make menuconfig" and friends).

Would be nice to have one in mainline ;-)

Regards
Greg

