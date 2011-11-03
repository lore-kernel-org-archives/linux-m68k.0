From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: add ColdFire FPU support for the V4e ColdFire CPU's
Date: Thu, 3 Nov 2011 17:01:39 +1000
Message-ID: <4EB23C53.8040709@snapgear.com>
References: <1320299645-9105-1-git-send-email-gerg@snapgear.com> <1320299645-9105-2-git-send-email-gerg@snapgear.com> <alpine.LNX.2.00.1111031735050.2899@nippy.intranet> <alpine.LNX.2.00.1111031752060.2899@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:38363 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753400Ab1KCHEJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 3 Nov 2011 03:04:09 -0400
In-Reply-To: <alpine.LNX.2.00.1111031752060.2899@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

Hi Finn,

On 03/11/11 16:53, Finn Thain wrote:
> On Thu, 3 Nov 2011, I wrote:
>
>> Is it actually possible to run the same kernel binary on CF and 680x0? If
>> not, shouldn't these run-time tests be compile-time #ifdefs?
>
> Oops, I forgot about the compiler's optimiser...

Yeah, thats right. Most of the code here is optimized out currently.

It may be possible to have a single image boot on both m68k and
ColdFire. And where ever possible I am leaving the option open
in the code. But we have quite a few hurdles to jump over before
the code will actually be able to do it.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
