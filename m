From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [uClinux-dev] [PATCH v2 1/6] m68k: merge mmu and non-mmu	versions
 of muldi3
Date: Wed, 20 Apr 2011 19:08:28 +1000
Message-ID: <4DAEA28C.7020909@snapgear.com>
References: <1303278880-16153-1-git-send-email-gerg@snapgear.com> <1303278880-16153-2-git-send-email-gerg@snapgear.com> <1303278880-16153-3-git-send-email-gerg@snapgear.com> <20110420080609.GA24244@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:13129 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752257Ab1DTJJH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2011 05:09:07 -0400
In-Reply-To: <20110420080609.GA24244@merkur.ravnborg.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>


Hi Sam,

On 20/04/11 18:06, Sam Ravnborg wrote:
> Hi Greg.
>
>> +
>> +#if defined(__mc68020__) || defined(__mc68030__) || \
>> +    defined(__mc68040__) || defined(__mc68060__)
>
> Why use these to decide if this is MMU or not?

The asm code that is enclosed by this is not about having an MMU
or not. It is about the processor supporting the 64bit mul
instruction.


> This code is not exposed to user-space so we can rely on CONFIG_* symbols.
> IMO the CONIFG_* symbols is easier to read/maintain.

In general yes I agree. But in this specific case it really
is about a code generation option (what type of processor
instructions we can emit).

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
