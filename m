From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: One issue during kernel porting on coldfire m5441x: dl_main: Assertion `_rtld_local._dl_rtld_map.l_libname' failed!
Date: Mon, 22 Feb 2010 20:23:28 +0100
Message-ID: <m2fx4tnkgf.fsf@igel.home>
References: <4B80F690.9000907@freescale.com>
	<4B8149BC.5020801@codesourcery.com> <4B8235FA.4050601@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:60151 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753299Ab0BVTXd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 22 Feb 2010 14:23:33 -0500
In-Reply-To: <4B8235FA.4050601@freescale.com> (Lanttor's message of "Mon, 22
	Feb 2010 15:44:58 +0800")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Lanttor <lanttor.guo@freescale.com>
Cc: Maxim Kuvyrkov <maxim@codesourcery.com>, Greg Ungerer <gerg@snapgear.com>, linux-m68k@vger.kernel.org

Lanttor <lanttor.guo@freescale.com> writes:

> 1206   if (! GL(dl_rtld_map).l_libname && GL(dl_rtld_map).l_name)
> 1207     {
> 1208       /* We were invoked directly, so the program might not have a
> 1209          PT_INTERP.  */
> 1210       _dl_rtld_libname.name = GL(dl_rtld_map).l_name;
> 1211       /* _dl_rtld_libname.next = NULL;  Already zero.  */
> 1212       GL(dl_rtld_map).l_libname =  &_dl_rtld_libname;
> 1213     }
> 1214   else
> 1215     assert (GL(dl_rtld_map).l_libname); /* How else did we get
> here?  */
>
>
> So I guess GL(dl_rtld_map).l_libname is not NUL and throws an
> exception.  The reason is still tracing...

The assertion fails only if both l_libname and l_name are NULL.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
