Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679072;
	b=XDnrsTnsirK+qIvFx2botYMxnXSgzlM6oejXtniZ1linFn2DxzVNJhK3mN52GxUf+dD0
	 kxKkJLIxCUL/ogxGdm5oMN1RzUxfxfpHr3db8xNnFR1+BbVKqW+usqLlFJ4vxlWEeFxEK
	 6OSU/aL1SEuCTJuM92Mgtxd+hA1gmWtr39/4uboFveUR3TSCXRhAS2rNS0so2GgkAFvTh
	 HkmrxjV/hXnxZVSl5je0eX7V8u7MvRqdhrWZQFHDhfGo1RsOnb0HTEPQSEqU4MVVShg2e
	 zUeDHXoZFY+6bG64XJsj1+3KHS35aDGozotWnJG0Mmm98ZXqyJwId6fDHOhJunm5NIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679072;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ijcqFl4YNaIiVHZ0kMDDzDit0eQZX1zIOl9C/1G18QI=;
	b=fibk268vGU4OmEv9bVm2g693LrPIPcnLzI67u5OryIscIUDJHEnkvfMEKoU9LF3PgCQD
	 7YQysv8z7tWL6QGXaXoIL3Asc7XyH1q12FSTGnuNwIQ+Bvkw34Ts9R35X0ALQyHxVG6e2
	 HzMrTUjkUTrMo67cjJI7ICOFp4HVdJrlvIPlXVlrw1tT7S7f11t6sr0gLpvCwj3UbN3nF
	 qoafJaurNediortZBC1RgKX7FGhUNtqbxMuqHaLLOslGJeKHATc1SfLjP7CObQa6KtMxg
	 2zVSJ3RM5kDC1yJ2I+bQ41zGq+dO9Ns2SWnLoBL0lI52bXL/YUQ/WjDuAhZyYVYah8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tGPqmIoU;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lrzd8ZGd;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F40606A319
	for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Oct 2026 14:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03F40606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tGPqmIoU;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lrzd8ZGd
Date: Thu, 22 Oct 2026 16:24:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792679067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ijcqFl4YNaIiVHZ0kMDDzDit0eQZX1zIOl9C/1G18QI=;
	b=tGPqmIoU7flznKuVvSgOzo2yd+DVKg7D73Wllg9sFRm9CC/iaoJaE55c3a0xpncefiwTWe
	D0DcbKw7j7YI7N9iAD68KUbumDWDB4zuYjNIkgHfr2v+H6DCtaJTi+ZtcPVrTjX8s8nNNi
	XYrPBSHr+CwiWmUAbayRxd1rMqP3P1fTDl5O65hszJdwi1iKQ6myUH0U2igUoTF8eZn+8r
	G1OdblBxDgssdpqEoIOChx+/YLJ7ntbq+IsNh3ReV+JtcimJTFUP2numV2/sYLdIC+zwnD
	aAZ46jrqFXnXLMoMGXtXmyYgRF8JauAVkMkAXxtjJDC2ZDnhWCO79rWsa0e06A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792679067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ijcqFl4YNaIiVHZ0kMDDzDit0eQZX1zIOl9C/1G18QI=;
	b=lrzd8ZGdzEWmJjZ9aZOFY32BVENA3ocTIaS/QQU0/Sv8YYe+ynbKZ/LG3OiCiXRqC6uBBI
	wYJIr0JLNWZ7aTBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Richard Weinberger <richard@nod.at>,
	Chris Zankel <chris@zankel.net>,
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [patch 16/18] x86/entry: Get rid of the sys_ni_syscall()
 indirection
Message-ID: <20261022142425.3Wx-RrU5@linutronix.de>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.493733289@kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260707190254.493733289@kernel.org>

On 2026-07-07 21:07:01 [+0200], Thomas Gleixner wrote:
> Invoking sys_ni_syscall() from a code path, which already knows that the
> syscall number is invalid just to assign -ENOSYS to regs->ax is a pointle=
ss
> exercise. It's even redundant as the low level entry code already has set
> regs->ax to -ENOSYS on entry.
>=20
> Remove the extra conditionals and the function calls.

Since this patch, tools/testing/selftests/x86/syscall_numbering_64
throws in this:
|[RUN]   Running tests under ptrace: modifying the default return
|[RUN]       Checking system calls with msb =3D 0 (0x0)
|[RUN]           Checking some common syscalls as 64 bit
|[OK]                x64 syscall 0:0 returned 0 as expected
|[OK]                x64 syscall 0:1 returned 0 as expected
|[RUN]           Checking some 64-bit only syscalls as 64 bit
|[OK]                x64 syscall 0:19 returned 0 as expected
|[OK]                x64 syscall 0:20 returned 0 as expected
|[RUN]           Checking out of range system calls
|[FAIL]                  x32 syscall 0:-64 returned -9999, but it should ha=
ve returned -ENOSYS
=E2=80=A6
|[FAIL]                  x32 syscall 0:-2 returned -9999, but it should hav=
e returned -ENOSYS
|[FAIL]              x32 syscalls 0:-64..-2 had 63 failure
|[OK]                x32 syscall 0:-1 returned MODIFIED_BY_PTRACE as expect=
ed
|[FAIL]                  x64 syscall 0:1073741760 returned -9999, but it sh=
ould have returned -ENOSYS
=E2=80=A6
|[FAIL]                  x64 syscall 0:1073741823 returned -9999, but it sh=
ould have returned -ENOSYS
|[FAIL]              x64 syscalls 0:1073741760..1073741823 had 64 failure
|[FAIL]                  x64 syscall 0:-64 returned -9999, but it should ha=
ve returned -ENOSYS
=E2=80=A6
|[FAIL]                  x64 syscall 0:547 returned -9999, but it should ha=
ve returned -ENOSYS
|[FAIL]              x64 syscalls 0:512..547 had 36 failure
|[RUN]           Checking some common syscalls as x32
|[OK]                x32 syscall 0:0 returned 0 as expected
=E2=80=A6
|[RUN]           Checking out of range system calls
|[FAIL]                  x32 syscall 1:-64 returned -9999, but it should ha=
ve returned -ENOSYS
|[FAIL]              x32 syscalls 1:-64..-2 had 63 failure
|[OK]                x32 syscall 1:-1 returned MODIFIED_BY_PTRACE as expect=
ed
|[FAIL]                  x64 syscall 1:1073741760 returned -9999, but it sh=
ould have returned -ENOSYS
=E2=80=A6

and so on=E2=80=A6 The test has

| #define MODIFIED_BY_PTRACE      -9999

and the ptracer modifies the return code. However not always. Not sure
if this was indeed a pointless exercise or not.

The test could be updated via the hunk below in case the new behaviour
is what is expected. hpa made the extension to the test in commit
795e2a023b808 ("selftests/x86/syscall: Add tests under ptrace to
syscall_numbering_64").

diff --git a/tools/testing/selftests/x86/syscall_numbering.c b/tools/testin=
g/selftests/x86/syscall_numbering.c
index ca0eca7b9dced..1435394fba022 100644
--- a/tools/testing/selftests/x86/syscall_numbering.c
+++ b/tools/testing/selftests/x86/syscall_numbering.c
@@ -250,6 +250,7 @@ static bool test_x32(void)
 static void test_syscalls_common(int msb)
 {
 	enum ptrace_pass pass =3D sh->ptrace_pass;
+	int expected_ret =3D -ENOSYS;
=20
 	run("Checking some common syscalls as 64 bit\n");
 	check_zero(msb, SYS_READ);
@@ -260,18 +261,22 @@ static void test_syscalls_common(int msb)
 	check_zero(msb, X64_WRITEV);
=20
 	run("Checking out of range system calls\n");
-	check_for(msb, -64, -2, -ENOSYS);
 	if (pass >=3D PTP_FUZZRET)
-		check_for(msb, -1, -1, MODIFIED_BY_PTRACE);
-	else
-		check_for(msb, -1, -1, -ENOSYS);
-	check_for(msb, X32_BIT-64, X32_BIT-1, -ENOSYS);
-	check_for(msb, -64-X32_BIT, -1-X32_BIT, -ENOSYS);
-	check_for(msb, INT_MAX-64, INT_MAX-1, -ENOSYS);
+		expected_ret =3D MODIFIED_BY_PTRACE;
+	check_for(msb, -64, -2, expected_ret);
+	check_for(msb, -1, -1, expected_ret);
+	check_for(msb, X32_BIT-64, X32_BIT-1, expected_ret);
+	check_for(msb, -64-X32_BIT, -1-X32_BIT, expected_ret);
+	check_for(msb, INT_MAX-64, INT_MAX-1, expected_ret);
 }
=20
 static void test_syscalls_with_x32(int msb)
 {
+	enum ptrace_pass pass =3D sh->ptrace_pass;
+	int expected_ret =3D -ENOSYS;
+
+	if (pass >=3D PTP_FUZZRET)
+		expected_ret =3D MODIFIED_BY_PTRACE;
 	/*
 	 * Syscalls 512-547 are "x32" syscalls.  They are
 	 * intended to be called with the x32 (0x40000000) bit
@@ -279,7 +284,7 @@ static void test_syscalls_with_x32(int msb)
 	 * nonsense and should not work.
 	 */
 	run("Checking x32 syscalls as 64 bit\n");
-	check_for(msb, 512, 547, -ENOSYS);
+	check_for(msb, 512, 547, expected_ret);
=20
 	run("Checking some common syscalls as x32\n");
 	check_zero(msb, SYS_READ   | X32_BIT);

Sebastian
