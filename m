From: Lanttor <lanttor.guo@freescale.com>
Subject: Re: One issue during kernel porting on coldfire m5441x: dl_main:
 Assertion `_rtld_local._dl_rtld_map.l_libname' failed!
Date: Tue, 23 Feb 2010 15:51:22 +0800
Message-ID: <4B8388FA.304@freescale.com>
References: <4B80F690.9000907@freescale.com>	<4B8149BC.5020801@codesourcery.com> <4B8235FA.4050601@freescale.com> <m2fx4tnkgf.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from az33egw02.freescale.net ([192.88.158.103]:38498 "EHLO
	az33egw02.freescale.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751566Ab0BWHsx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 23 Feb 2010 02:48:53 -0500
Received: from az33smr02.freescale.net (az33smr02.freescale.net [10.64.34.200])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id o1N7ml0g013854
	for <linux-m68k@vger.kernel.org>; Tue, 23 Feb 2010 00:48:48 -0700 (MST)
Received: from zmy16exf40.fsl.freescale.net (zmy16exf40.ap.freescale.net [10.211.3.4])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id o1N7moJu007970
	for <linux-m68k@vger.kernel.org>; Tue, 23 Feb 2010 01:48:51 -0600 (CST)
In-Reply-To: <m2fx4tnkgf.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Maxim Kuvyrkov <maxim@codesourcery.com>, Greg Ungerer <gerg@snapgear.com>, linux-m68k@vger.kernel.org

>
> The assertion fails only if both l_libname and l_name are NULL.
Thanks Andreas, you're right.

Now I have resolved this issue: I need set the value to %rambar1
register in the head.S file.
This register is the configure register for SRAM. Although I not use
SRAM memory, but it
seems I need configure this register, otherwise I will meet the issue
before.

I'm not sure why this fix will affect run time loader. I guess the
toolchain may do some registers' check.

Best Regards,
Lanttor




------------------------------------------------------------------------
*From:* Andreas Schwab <schwab@linux-m68k.org>
*Sent:* 02/23/2010 3:23:28 AM +0800
*To:* Lanttor <lanttor.guo@freescale.com>
*CC:* Maxim Kuvyrkov <maxim@codesourcery.com>, Greg Ungerer
<gerg@snapgear.com>, linux-m68k@vger.kernel.org
*Subject:* One issue during kernel porting on coldfire m5441x: dl_main:
Assertion `_rtld_local._dl_rtld_map.l_libname' failed!

> Lanttor <lanttor.guo@freescale.com> writes:
>
>   
>> 1206   if (! GL(dl_rtld_map).l_libname && GL(dl_rtld_map).l_name)
>> 1207     {
>> 1208       /* We were invoked directly, so the program might not have a
>> 1209          PT_INTERP.  */
>> 1210       _dl_rtld_libname.name = GL(dl_rtld_map).l_name;
>> 1211       /* _dl_rtld_libname.next = NULL;  Already zero.  */
>> 1212       GL(dl_rtld_map).l_libname =  &_dl_rtld_libname;
>> 1213     }
>> 1214   else
>> 1215     assert (GL(dl_rtld_map).l_libname); /* How else did we get
>> here?  */
>>
>>
>> So I guess GL(dl_rtld_map).l_libname is not NUL and throws an
>> exception.  The reason is still tracing...
>>     
>
> The assertion fails only if both l_libname and l_name are NULL.
>
> Andreas.
>
>   
