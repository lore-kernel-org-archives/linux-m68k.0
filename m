From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: add ColdFire FPU support for the V4e ColdFire CPU's
Date: Fri, 4 Nov 2011 11:16:07 +1000
Message-ID: <4EB33CD7.2070509@snapgear.com>
References: <1320299645-9105-1-git-send-email-gerg@snapgear.com>	<1320299645-9105-2-git-send-email-gerg@snapgear.com> <CAMuHMdUCzjkGL_Z3ki9nNrreL_+hxa2dwLZZ+LLB250w4UfYNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:50094 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750777Ab1KDBOs (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 3 Nov 2011 21:14:48 -0400
In-Reply-To: <CAMuHMdUCzjkGL_Z3ki9nNrreL_+hxa2dwLZZ+LLB250w4UfYNA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 03/11/11 18:28, Geert Uytterhoeven wrote:
> On Thu, Nov 3, 2011 at 06:54,<gerg@snapgear.com>  wrote:
>> The ColdFire FPU is of course different to all previous 68k FP units. It is
>> close in operation to the 68060, but not completely compatible. The biggest
>> issue to deal with is that the ColdFire FPU multi-move instructions are
>> different. It does not support multi-moving the FP control registers, and
>> the multi-move of the FP data registers uses a different instruction
>> neumonic.
>
> mnemonic

Thanks!

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
