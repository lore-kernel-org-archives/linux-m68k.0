From: Lanttor <lanttor.guo@freescale.com>
Subject: Re: Interrupt issue on m68k platform and some fix
Date: Thu, 02 Jul 2009 18:06:44 +0800
Message-ID: <4A4C86B4.2000101@freescale.com>
References: <4A4C3267.2040705@freescale.com> <m3hbxvtruk.fsf@hase.home>	<4A4C76CB.4000208@freescale.com> <m38wj7tpxk.fsf@hase.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from az33egw02.freescale.net ([192.88.158.103]:43796 "EHLO
	az33egw02.freescale.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751059AbZGBKGH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 2 Jul 2009 06:06:07 -0400
Received: from de01smr01.freescale.net (de01smr01.freescale.net [10.208.0.31])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id n62A65GG015358
	for <linux-m68k@vger.kernel.org>; Thu, 2 Jul 2009 03:06:08 -0700 (MST)
Received: from zch01exm25.fsl.freescale.net (zch01exm25.ap.freescale.net [10.192.129.217])
	by de01smr01.freescale.net (8.13.1/8.13.0) with ESMTP id n62A63Xj015111
	for <linux-m68k@vger.kernel.org>; Thu, 2 Jul 2009 05:06:04 -0500 (CDT)
In-Reply-To: <m38wj7tpxk.fsf@hase.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uClinux development list <uclinux-dev@uclinux.org>

>
> No.  Byte would be addqb.
I think you're right, I am not familiar coldfire assembly and
instruction. I just touched it no long time.

addqb instruction is not supported on coldfire platform.

Which better way to replace it? I tried to use addql, but it proves that
it's incorrect.

I guess my patch could be better way to replace it now.

Regards,
Lanttor




------------------------------------------------------------------------
*From:* Andreas Schwab <schwab@linux-m68k.org>
*Sent:* 07/02/2009 5:05:59 PM +0800
*To:* Lanttor <lanttor.guo@freescale.com>
*CC:* linux-m68k@vger.kernel.org, uClinux development list
<uclinux-dev@uclinux.org>
*Subject:* Interrupt issue on m68k platform and some fix

> Lanttor <lanttor.guo@freescale.com> writes:
>
>   
>> So this code sets value 1 to the second byte of preempt_count field.
>>     
>
> No.  Byte would be addqb.
>
> Andreas.
>
>   
