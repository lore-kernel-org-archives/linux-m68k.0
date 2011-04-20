From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [uClinux-dev] [PATCH v2 1/6] m68k: merge mmu and non-mmu	versions of muldi3
Date: Wed, 20 Apr 2011 12:38:01 +0200
Message-ID: <m2k4epp5rq.fsf@igel.home>
References: <1303278880-16153-1-git-send-email-gerg@snapgear.com>
	<1303278880-16153-2-git-send-email-gerg@snapgear.com>
	<1303278880-16153-3-git-send-email-gerg@snapgear.com>
	<20110420080609.GA24244@merkur.ravnborg.org>
	<BANLkTi=9ZNg+eh6S1NeyJaCs4e0tRjJELQ@mail.gmail.com>
	<20110420091216.GB3296@frolo.macqel> <4DAEA7F5.6080603@snapgear.com>
	<20110420095529.GC3296@frolo.macqel> <4DAEB2E1.6050404@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:47932 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752095Ab1DTKiE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2011 06:38:04 -0400
In-Reply-To: <4DAEB2E1.6050404@snapgear.com> (Greg Ungerer's message of "Wed,
	20 Apr 2011 20:18:09 +1000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Philippe De Muyter <phdm@macqel.be>, uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

Greg Ungerer <gerg@snapgear.com> writes:

> Hi Philippe,
>
> On 20/04/11 19:55, Philippe De Muyter wrote:
>> The 68340 has it also. (And I have an old linux port for this processor)
>
> That is just a SoC that contains a 68020 though, so __mc68020__ would
> be defined for that.

Actually it has a cpu32 core, but it is close enough to be covered by
__mc68020__.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
