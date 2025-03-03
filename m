Received: from server43.webgo24.de (server43.webgo24.de [185.30.32.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0972163B2
	for <linux-m68k@vger.kernel.org>; Mon,  3 Mar 2025 16:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.30.32.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018944; cv=none; b=ufw1wFAUWfJ1/4mfA3bjjHwg6ljSdxJJj42Y529U23cJm3iZb1MxbE97iUmdcdrtL7TKtmDRF67trEnuifJQHFk1tEopQzAjqAHB6sAjIM3oUlLA6sDmqQxfsjd423Um+/nJR6Yf/xCSVbSaKWI/hF86fBOTebN9WitCIIOzJx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018944; c=relaxed/simple;
	bh=fXMUkA7CuFDs016zI9gy2/gyFONJYn6NGgxUSYpvgZE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H3KSFI+bJl5gmpBtfe8ybmqmUGJX0aHdLCtdWgeErjjUQSJ3EtXV3a0Qkrbu6JQ9C5SN+Zx/Z4JTZ/CwgpYpzHDTR//PxmKqAs8Opa7+55727YywXB30BVad+rV9lfCeLWGlVNqIeXyzHSZvyM/UDTLqGlWL2PV1yiJ0VEHlq/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tho-otto.de; spf=pass smtp.mailfrom=tho-otto.de; dkim=pass (2048-bit key) header.d=tho-otto.de header.i=@tho-otto.de header.b=YP6V7wSs; arc=none smtp.client-ip=185.30.32.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tho-otto.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tho-otto.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tho-otto.de header.i=@tho-otto.de header.b="YP6V7wSs"
Received: from earendil.localnet (dynamic-080-171-152-172.80.171.pool.telefonica.de [80.171.152.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by server43.webgo24.de (Postfix) with ESMTPSA id AA4DF411128A
	for <linux-m68k@vger.kernel.org>; Mon,  3 Mar 2025 17:22:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tho-otto.de; s=dkim;
	t=1741018939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5aNCjGrWifRkbBA60PO6L5C+Q35ya5XX+7+3squQ6wI=;
	b=YP6V7wSsOIrTcFKp9etwSlyf6Jk/jsfHngo64VRq+S/A8PxKcWQD9Ce6BmMpIzMLK9wEHg
	xXoQOiu1A7U/fRrrrn4F4Hq+nVguVnzAF2KGagtK7WC0c+lOxaOqDF7/xjv/8Y0f0scabX
	zeOkpZEeVaqN7szrpV8jzBx/S0XyJkbi4qsrSApn9s2Oub3N7IbeGKNHLra+KtmZB+SgIT
	tYmrISL4Onrah+SPHNCZwL4mK2qwJDe9wak2BgLFLQzj65acrHX6H2xmaV/9zUpq4ghopP
	BETw8RsGrfyO5t+ZxGLlzPYo7x704qP3AKgszcWVJXSWHvRO53Ki3Z/UjGE+qQ==
From: Thorsten Otto <admin@tho-otto.de>
To: linux-m68k@vger.kernel.org
Subject: Software FPU emulation in linux kernel
Date: Mon, 03 Mar 2025 17:22:09 +0100
Message-ID: <3374772.VqM8IeB0Os@earendil>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,


i'm currently trying to port the software FPU emulation of linux-m68k to 
FreeMiNT, and got some questions about it.


As seen in https://github.com/torvalds/linux/blob/
7eb172143d5508b4da468ed59ee857c6e5e01da6/arch/m68k/kernel/vectors.c#L96 and 
https://github.com/torvalds/linux/blob/
7eb172143d5508b4da468ed59ee857c6e5e01da6/arch/m68k/kernel/vectors.c#L119

the FPSP for 040/060 are not installed when the software emulation is used. 
However, almost all trigonometric functions are not implemented: https://
github.com/torvalds/linux/blob/7eb172143d5508b4da468ed59ee857c6e5e01da6/arch/
m68k/math-emu/fp_trig.c#L21-L28
What sense does it then make to use an emulation, when only basic instructions 
like fadd/fmul etc. are implemented? Programs are not even aborted when using 
one of those functions, uprint just prints an error message, and the functions 
just return with their input arguments as result instead of calculating the 
expected value.


Then i also noticed, that there seem to be some quirks. Eg. the IS_ZERO macro 
is defined as
#define IS_ZERO(a) ((a)->mant.m64 == 0)
But that condition is also true for infinities, and there are several places 
where IS_ZERO is used before checking for infinities. Eg. in the emulation of 
fmul https://github.com/torvalds/linux/blob/
7eb172143d5508b4da468ed59ee857c6e5e01da6/arch/m68k/math-emu/fp_arith.c#L157 
+inf * +inf will return a NAN instead of +inf.


Next problem is the interaction between assembler/C. On entry, a2 is loaded 
with a pointer to the emulated FPU register set in the thread struct. However, 
all the arithmetic functions call out to C functions, which in turn callback 
some assembler functions like fp_long_ext2ext. At that time, a2 may contain 
any value. Won't that just crash, or did i miss something?


Another problem: the fsqrt function seems to be broken when using arguments < 
1.0. Eg. fsqrt(0.75) yields 1.7320508075. Looks like the returned exponent is 
off by one there.


So essentially: is that emulation actually used anywhere?




