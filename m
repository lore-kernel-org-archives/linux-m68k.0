From: Lanttor <lanttor.guo@freescale.com>
Subject: Re: One issue during kernel porting on coldfire m5441x: dl_main:
 Assertion `_rtld_local._dl_rtld_map.l_libname' failed!
Date: Mon, 22 Feb 2010 15:44:58 +0800
Message-ID: <4B8235FA.4050601@freescale.com>
References: <4B80F690.9000907@freescale.com> <4B8149BC.5020801@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from az33egw02.freescale.net ([192.88.158.103]:45809 "EHLO
	az33egw02.freescale.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752077Ab0BVHmk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 22 Feb 2010 02:42:40 -0500
Received: from de01smr02.am.mot.com (de01smr02.freescale.net [10.208.0.151])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id o1M7gcWj009082
	for <linux-m68k@vger.kernel.org>; Mon, 22 Feb 2010 00:42:38 -0700 (MST)
Received: from zmy16exf40.fsl.freescale.net (zmy16exf40.ap.freescale.net [10.211.3.4])
	by de01smr02.am.mot.com (8.13.1/8.13.0) with ESMTP id o1M7oKKJ013860
	for <linux-m68k@vger.kernel.org>; Mon, 22 Feb 2010 01:50:21 -0600 (CST)
In-Reply-To: <4B8149BC.5020801@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: Greg Ungerer <gerg@snapgear.com>, linux-m68k@vger.kernel.org

Hi, Max

Thanks for your information.


> It is quite strange that the run-time linker is invoked for a
> statically linked busybox -- maybe this is the problem?
This is not the problem, because I setup udevd daemon before busybox
when boot up. when I disable udevd and use static dev files, there will
no error information.
That means staitic binary is OK to run, but if I run dynamic binary,
it's failed and prints log: Inconsistency detected by ld.so: rtld.c:
1215: dl_main: Assertion `_rtld_local._dl_rtld_map.l_libname' failed!

> I suggest you take a look at <glibc_src>/elf/rtld.c and trace how the
> control gets there.
I use glibc-2.5 and check elf/rtld.c 1215 line, the code is as follows:

1206   if (! GL(dl_rtld_map).l_libname && GL(dl_rtld_map).l_name)
1207     {
1208       /* We were invoked directly, so the program might not have a
1209          PT_INTERP.  */
1210       _dl_rtld_libname.name = GL(dl_rtld_map).l_name;
1211       /* _dl_rtld_libname.next = NULL;  Already zero.  */
1212       GL(dl_rtld_map).l_libname =  &_dl_rtld_libname;
1213     }
1214   else
1215     assert (GL(dl_rtld_map).l_libname); /* How else did we get
here?  */


So I guess GL(dl_rtld_map).l_libname is not NUL and throws an
exception.  The reason is still tracing...

Best Regards,
Lanttor




------------------------------------------------------------------------
*From:* Maxim Kuvyrkov <maxim@codesourcery.com>
*Sent:* 02/21/2010 10:57:00 PM +0800
*To:* Lanttor <lanttor.guo@freescale.com>
*CC:* Greg Ungerer <gerg@snapgear.com>, linux-m68k@vger.kernel.org
*Subject:* One issue during kernel porting on coldfire m5441x: dl_main:
Assertion `_rtld_local._dl_rtld_map.l_libname' failed!

> On 2/21/10 12:02 PM, Lanttor wrote:
>> Hi,
>>
>> I met one interesting issue during I porting 2.6.29 kernel on ColdFire
>> paltform (v4 core, mcf5441x).
>>
>> I could boot up the kernel with initramfs, but the kernel message below
>> displays some error information,
>> which line I colored red. initramfs image only includes busybox static
>> binary.
> ...
>> Inconsistency detected by ld.so: rtld.c: 1215: dl_main: Assertion
>> `_rtld_local._dl_rtld_map.l_libname' failed!
>> Inconsistency detected by ld.so: rtld.c: 1215: dl_main: Assertion
>> `_rtld_local._dl_rtld_map.l_libname' failed!
>
> The error is an assertion failure in GLIBC's runtime linker, it is not
> a kernel issue.  It is quite strange that the run-time linker is
> invoked for a statically linked busybox -- maybe this is the problem? 
> I suggest you take a look at <glibc_src>/elf/rtld.c and trace how the
> control gets there.
>
> Regards,
>
