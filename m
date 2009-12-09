From: Klaus Kuehnhammer <klaus@bitstem.com>
Subject: Re: Add private syscalls to support NPTL
Date: Wed, 9 Dec 2009 16:44:17 +0100
Message-ID: <F139AB5C-ED7E-4664-AB7E-AD9EFFEF9DDD@bitstem.com>
References: <4A89D037.7090807@codesourcery.com> <4B1CBEE8.7000907@codesourcery.com> <08E1D88E-249F-4C5B-8F00-519659DC912E@parq.net> <4B1F8475.7000300@codesourcery.com> <DBFD40BF-19FC-47DF-8A7C-B71261AFBD85@parq.net> <4B1F9492.6030604@codesourcery.com>
Mime-Version: 1.0 (Apple Message framework v1077)
Content-Type: multipart/mixed; boundary=Apple-Mail-17-745899621
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-ip-62-75-169-239.inaddr.intergenia.de ([62.75.169.239]:56940
	"EHLO vs169239.vserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752580AbZLIPvy (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 9 Dec 2009 10:51:54 -0500
In-Reply-To: <4B1F9492.6030604@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: linux-m68k@vger.kernel.org


--Apple-Mail-17-745899621
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hello again,

It looks like the issue is caused by the page being write-protected. =
Adding !pte_write(*pte) to the checks seems to fix this, it goes into =
page fault and reloads the page entry writable. A patch is attached.

I'm not entirely comfortable w/this solution... I understand why calling =
do_page_fault w/a fixed RMW flag makes the write access work on the next =
iteration, but why would this page lack the write flag in the first =
place? Or, conversely, why does glibc call cmpxchg on a mem location in =
a non-writeable page?

Regarding the freescale kernel issues: Is there another kernel version =
we could try?=20

best regards,
Klaus

PS I'm putting the list back on CC


--Apple-Mail-17-745899621
Content-Disposition: attachment;
	filename=linux-2.6.25-nptl-page-not-writeable-fix.patch
Content-Type: application/octet-stream;
	name="linux-2.6.25-nptl-page-not-writeable-fix.patch"
Content-Transfer-Encoding: 7bit

--- aaa/arch/m68k/kernel/sys_m68k.c	2009-12-09 12:41:46.000000000 +0100
+++ bbb/arch/m68k/kernel/sys_m68k.c	2009-12-09 16:36:58.000000000 +0100
@@ -736,7 +736,7 @@
 		if (!pmd_present(*pmd))
 			goto bad_access;
 		pte = pte_offset_map_lock(mm, pmd, (unsigned long)mem, &ptl);
-		if (!pte_present(*pte) || !pte_dirty(*pte)) {
+		if (!pte_write(*pte) || !pte_present(*pte) || !pte_dirty(*pte)) {
 			pte_unmap_unlock(pte, ptl);
 			goto bad_access;
 		}

--Apple-Mail-17-745899621
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



On 09.12.2009, at 13:14, Maxim Kuvyrkov wrote:

> Klaus Kuehnhammer wrote:
>> Hi!
>> Thanks for the quick reply!
>> It's a 2.6.25 kernel from the mid-2008 freescale BSP, w/the NPTL =
patches for the latest toolchain.
>> Linux version 2.6.25 (klaus@uvirt) (gcc version 4.4.1 (Sourcery G++ =
Lite 4.4-54) )
>=20
> This kernel has several known issues, some of them can be triggered by =
NPTL support.
>=20
>> I haven't run this in the debugger yet so i don't know for certain. =
=46rom the address the oops gives, it's definitely in =
sys_atomic_cmpxchg_32. I added a printk, and the offending address comes =
in via the mem param, so yes, I guess the first *mem is the place.
>=20
> Would you please provide a dump of the code near the place where the =
oops occurs, you should be able to do that with `m68k-linux-gnu-objdump =
-d vmlinux | grep -C 80 00021e50'.  And, of cause, a testcase will be of =
great help for tracking this down.
>=20
> Thanks,
>=20
> --=20
> Maxim Kuvyrkov
> CodeSourcery
> maxim@codesourcery.com
> (650) 331-3385 x724

--
Klaus Kuehnhammer
Bitstem Software
Wasnergasse 11/5
1200 Wien, Austria
+43 664 2133466
klaus@bitstem.com


--Apple-Mail-17-745899621--
