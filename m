From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] m68k: use conventional function parameters for
 do_sigreturn
Date: Tue, 9 Feb 2016 23:05:57 +1000
Message-ID: <56B9E435.2000203@uclinux.org>
References: <1453183018-11722-1-git-send-email-gerg@uclinux.org>
 <8737tcxoka.fsf@linux-m68k.org> <56AFF16E.2020506@uclinux.org>
 <871t8u7w43.fsf@linux-m68k.org> <56B17EA9.8020504@uclinux.org>
 <871t8mkcd1.fsf@linux-m68k.org> <56B93106.4050806@uclinux.org>
 <mvmegcmw6y1.fsf@hawking.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out6.external.iinet.net.au ([203.59.1.106]:54756
	"EHLO icp-osb-irony-out6.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751653AbcBINGC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 9 Feb 2016 08:06:02 -0500
In-Reply-To: <mvmegcmw6y1.fsf@hawking.suse.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org


On 09/02/16 19:48, Andreas Schwab wrote:
> Greg Ungerer <gerg@uclinux.org> writes:
>
>> Should I submit a gcc bug report?
>
> No, it's not a bug.  Function parameters are dead after return, so any
> writes to them can be elided.

Given the original code is:

   asmlinkage int do_sigreturn(unsigned long __unused)
   {
         struct switch_stack *sw = (struct switch_stack *) &__unused;
         struct pt_regs *regs = (struct pt_regs *) (sw + 1);

So gcc is determining that what sw and regs points to are
part of do_sigreturn() parameters here?

Given the ugliness of this grunging around in the stack I
still think my original patch to use correct pointer args is
much cleaner all round.

Regards
Greg
