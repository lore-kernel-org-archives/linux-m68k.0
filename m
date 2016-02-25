From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH v2] m68k: use conventional function parameters for do_sigreturn
Date: Thu, 25 Feb 2016 11:55:23 +0100
Message-ID: <mvmy4a9t5yc.fsf@hawking.suse.de>
References: <1455518189-12478-1-git-send-email-gerg@uclinux.org>
	<56CD031C.5040101@uclinux.org>
	<CAMuHMdVPsqEYwgoXrS6ecdPBUEvDqhaCBYNZPY7op02o70LonQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:60219 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752104AbcBYKz2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 25 Feb 2016 05:55:28 -0500
In-Reply-To: <CAMuHMdVPsqEYwgoXrS6ecdPBUEvDqhaCBYNZPY7op02o70LonQ@mail.gmail.com>
	(Geert Uytterhoeven's message of "Thu, 25 Feb 2016 11:42:08 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Greg,
>
> On Wed, Feb 24, 2016 at 2:10 AM, Greg Ungerer <gerg@uclinux.org> wrote:
>> Do you have any objections or issues with this change?
>>
>> Andreas and Philippe kindly gave feedback, which I have addressed
>> (I think to everyone's satisfaction?)
>>
>> I would very much like to see this applied to resolve the compilation
>> issue for non-MMU with modern versions of gcc. I don't mind pushing
>> through my tree. I just want to make sure first that nobody objects
>> to this change or has any remaining issues with it.
>
> If Andreas is happy with it, I will apply it.

No objections.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
