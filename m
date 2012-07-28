From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] m68k: make sys_atomic_cmpxchg_32 work on classic m68k
Date: Sat, 28 Jul 2012 13:35:48 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1207281333300.20433@herc.mirbsd.org>
References: <m2r4rwongt.fsf@igel.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:6129 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752602Ab2G1Nns convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 28 Jul 2012 09:43:48 -0400
In-Reply-To: <m2r4rwongt.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Ben Hutchings <ben@decadent.org.uk>, stable@kernel.org
Cc: linux-m68k@vger.kernel.org

Andreas Schwab dixit:

>User space access must always go through uaccess accessors, since on
>classic m68k user space and kernel space are completely separate.
>
>Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>

This fixes my testcases, both the reduced two and the real-life
one (running apt-get update no longer freezes the system, yay!).

Ben, can we please get that in the next src:linux upload to sid?

Tested-by: Thorsten Glaser <tg@debian.org>

>---
> arch/m68k/kernel/sys_m68k.c | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
>index 8623f8d..9a5932e 100644
>--- a/arch/m68k/kernel/sys_m68k.c
>+++ b/arch/m68k/kernel/sys_m68k.c
>@@ -479,9 +479,13 @@ sys_atomic_cmpxchg_32(unsigned long newval, int o=
ldval, int d3, int d4, int d5,
> 			goto bad_access;
> 		}
>=20
>-		mem_value =3D *mem;
>+		/*
>+		 * No need to check for EFAULT; we know that the page is
>+		 * present and writable.
>+		 */
>+		__get_user(mem_value, mem);
> 		if (mem_value =3D=3D oldval)
>-			*mem =3D newval;
>+			__put_user(newval, mem);
>=20
> 		pte_unmap_unlock(pte, ptl);
> 		up_read(&mm->mmap_sem);
>--=20
>1.7.11.3
>
>
>--=20
>Andreas Schwab, schwab@linux-m68k.org
>GPG Key fingerprint =3D 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 =
4ED5
>"And now for something completely different."
>

//mirabilos
--=20
13:37=E2=8E=9C=C2=ABNatureshadow=C2=BB Deep inside, I hate mirabilos. I=
 mean, he's a good
guy. But he's always right! In every fsckin' situation, he's right. Eve=
n
with his deeply perverted taste in software and borked ambition towards
broken OSes - in the end, he's damn right about it :(! [=E2=80=A6] work=
s in mksh
