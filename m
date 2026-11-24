Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795491928;
	b=k5P/PHHjtMeDBD2bJURoQq2i9lFyyXhIo5rzDVNJctzYOge1C3+KHLiMjBuoXBceUGsU
	 MlhCKcBnDN10IAulBKA70qF70s6xyqYJ1LZyIDhrpajeZhs1mfrW6NuGmibFv6D3cqvol
	 BvnvYgga8muTWZr4s/TpsLRvWiMqFfMEQik7fiYlUzK9xSZg06be24zgVz8EhRWJWZgxE
	 2DAJolfb5fUmA3pv2KcGHtA/Mq7yox9ITJwxydQ7xPmKCv4jEYFVqxE4FL9PoUGA6+DlJ
	 fqoQRXb7UCEwF8yFHe5Rm2m3dndKhu1+e3IaM99Pwktnm8jBnfk4T80HUx4X9P4oUvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=qUctoQrzdfE5LseLd3ifkcwY8pow6PXXGWGTUDShPZ0=;
	b=ddIfsn74erk9KdBLm1VzPJ/lQH8vomeSpOYFrbt1drctS+f0buAhH1Nr8fX6akIP49OB
	 5Vicd/fwsepmjuYKDTcV+kTK/FI2Zzu8raRGusSJxLkMA3WscTs1BJXUoebwIjjDoCiJx
	 iRX7Pf45I9K8TleTf/w9Y5r1E6zTnGcXucVxcSHjnCbhROPia81H9AmYVjKAeNr1ZQYYL
	 mwnD1JBysWAqUwoDakRVZeMVrlfb8j5wR7oFCMGEPiXOMm+itI2+BiCN1B1hoD/Osma3E
	 l/jLhQRVsUMtlC9vSou33aD7hUMa/cruCtWm7IQljw5LqlhhQ2vPnp3fwLHOeMRbQCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=EVf62ZTP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B9E606A31E
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Nov 2026 03:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B9E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=EVf62ZTP
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b546061d58so9091989c88.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Nov 2026 19:45:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795491927; cv=none;
        d=google.com; s=arc-20260327;
        b=bzIjBLuxshGdGRaxDrHm+KCmLL5yR/Aluh+dLDTI/8q9zF3Wal9ZpmwI+QLOzSMijJ
         u14NjRdEkqXpFHAcnzZ09NNnZ+w6L/mKGtBnayB+ubmNdrA8fsfPBKqi7OXVbpstGtoK
         Anp0SJzSlVPwX6dejac3UxIdi+JneYr0eql9i5SBJck0v+3XDEfIb8JpUvTQOyywh8Xq
         aSMrviMnEBOojw4Dk9zyeJEK8m6c34fQR3NwMDB2YlLscvRDE/JeorOpyhlJGLSapYms
         jwXVZ40OMGKNA+iHH6ly3Tz10THFBmzLX3dqKgFyddYH5czGPUe/WfOwbAsdzxqx/wBB
         +aRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qUctoQrzdfE5LseLd3ifkcwY8pow6PXXGWGTUDShPZ0=;
        fh=bt8yOkQQOu4xgim7enEELT5vfsJ+2S9zzuxcUOcInN0=;
        b=szcDp94GdGCIepvFejnvh66Cok7ESsrF1P/FppJ8yUaUAPdw07PZ3mVhEiuv5LV2DC
         71w6jhrGtk7tBD+NPDwSQaVyt8ITT9gthe2WVYdwINMYKajKJOEof6CYQtjK4lrviNXX
         k6pdOhHXc3G+wDxb4KHv3lUF4nimxX3e+Ht1G8JiNFKwVyuCwgKCuYngl+KBwc1naXw6
         FiOzTQnqpjJsfd9bgyvTYPcjeQuaQPBKFCCdAgs3o1EGlRPuWYhr04Y+wL63mHICaTeo
         Xfhl2IBOwXbdOSfipXb8MleRounnR7KdSWl6W784wP3s6BeX0bVTC1kX6TomN3TbDnjz
         vrIw==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795491927; x=1796096727; darn=lists.linux-m68k.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qUctoQrzdfE5LseLd3ifkcwY8pow6PXXGWGTUDShPZ0=;
        b=EVf62ZTP9xXOd6Cfg3t/uMKwisUTJn1j9xzEEys4xj4MzKyeR3Ez2MVlbxbVBUoxD/
         GNs5974rKX27QeduW2G/IuLo9bnLdKSJ3aBKsH+hkItrc6nqmxVvEzYsrxTO3b15I6Vc
         rLf7B8Nq59n/FISIpSvIrms8ZITcjizTM0h5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491927; x=1796096727;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qUctoQrzdfE5LseLd3ifkcwY8pow6PXXGWGTUDShPZ0=;
        b=TnxqckwIHaKCQU9Kg7funBSSzVnz+ywEA8XBHpQtMLaKLnk0yRMTISbDKsirQ7Uujp
         TvgVeItMVTQFiEUEi+lP7xzdoAJXcgH9EefR2PfodHnCASDhZms2d0aFsl47mLW66tag
         BlzorJaEQlR/2ir+rItC5vC5nK5qPm+ZISGfH7P/EzMXd6hor0wuESucX/5a92vM+Cv1
         A6eVyp/1SjioA4c/2nhlxy74PmnqFMeEb7l1zNskCKXaGVXK1oMRh4j2jV2Y6auRNG4P
         0DIIJCDVa5NJYjRoxxAecWJpO+oqpYnxMSNQ6Hc98o/B2silzSyPgY93XxzsJXCFNMvm
         NWYw==
X-Forwarded-Encrypted: i=1; AL+hErHSCDoLcFxAM+Cb82secUkHx2w4Bxx9WU5uI3tbl8tKXm8uCtdFI39QxORzt9iPTWMeCEH4RvLov0CJ@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z8g8JiEeArjGxzUzb39+rlN7thgmN9yVvfhdTyJ3NTBDt1lyIeH
	JPRBtdJ676DAD0kwq5p9JYXnA8GzzHnqJUSFkjeD6eUJeActA9RgEgCToPGUDq3ogqAMbkasAeu
	WxFpkw/KfPeB2WCsUVAvLgP6xMxNrHcfYOqG6LOIatw==
X-Gm-Gg: AZFdTZd1EAKb0L/o4D+ar5Dq3o07fp7/sI3xOLQeqvssXdW5QbO3vTZYXFF3AlM2ziI
	H4sma/YDlE0jY16GJ5VcN1BB31gukhCbJf9orjA0p5ahuvVwokftFFGJ1iyo+YbEYMPp6AzZvoR
	UYm4uTgFpWG2Zq3xECw8Nf3P3kOEdggO5uu9wTZ7dpSDQOBCkpcgRTa9Zel4rU0LtvtwIg7ASrq
	zF2NJmftdtoOpbOQ9/Q3YGPDrl6DhU7yJMuepJv1bvXdv96DQB2ymUtJj6J4P28dTmvUY3RZKVj
	qBPvytP/hVe0XhTwHEuTuSBgG2le35Vve7fug8DcYHuVYhurunclxdHKcAQACk2ttJhtNbFNcU9
	X05nIzoAq8PL4B+o3a9qRysoDmf8qtxyQU4yMlXzGfvL0TVxE4VFkz0Ql5E0x
X-Received: by 2002:a05:701b:21cd:b0:1b5:e9d:c641 with SMTP id
 a92af1059eb24-1b5568bc08amr13417093c88.18.1795491926992; Mon, 23 Nov 2026
 19:45:26 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124025555.2348580-1-daniel@0x0f.com>
In-Reply-To: <20261124025555.2348580-1-daniel@0x0f.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 24 Nov 2026 12:45:15 +0900
X-Gm-Features: Aa3M54rZ51tZkUYoAXWOn99Dz7MpcsEFJ1pC9mQcihsDmDqKlxmxIqXJBljv_DU
Message-ID: <CAFr9PXnVV=HtAEeCO69-iw0=byRweauT+KqRYmMsq1Y6S6mfuw@mail.gmail.com>
Subject: Re: [PATCH] m68k: Define the m68k-specific syscalls with SYSCALL_DEFINE
To: geert@linux-m68k.org, gerg@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"

Replying to myself..

On Tue, 24 Nov 2026 at 11:56, Daniel Palmer <daniel@0x0f.com> wrote:
>sys_atomic_cmpxchg_32()

Sashiko reports that this got broken because it can't use its trick
for getting pt_regs now that it's wrapped.
I'll send a v2 with this fix at some point:

--- a/arch/m68k/kernel/sys_m68k.c
+++ b/arch/m68k/kernel/sys_m68k.c
@@ -514,12 +514,8 @@ SYSCALL_DEFINE6(atomic_cmpxchg_32, unsigned long,
newval, int, oldval,
                   Make the kernel do the necessary page stuff, then re-iterate.
                   Simulate a write access fault to do that.  */
                {
-                       /* The first argument of the function corresponds to
-                          D1, which is the first field of struct pt_regs.  */
-                       struct pt_regs *fp = (struct pt_regs *)&newval;
-
                        /* '3' is an RMW flag.  */
-                       if (do_page_fault(fp, (unsigned long)mem, 3))
+                       if (do_page_fault(current_pt_regs(), (unsigned
long)mem, 3))
                                /* If the do_page_fault() failed, we don't
                                   have anything meaningful to return.
                                   There should be a SIGSEGV pending for
