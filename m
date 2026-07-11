Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ECF3C4B89
	for <linux-m68k@lists.linux-m68k.org>; Sat, 11 Jul 2026 12:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783772967; cv=pass; b=ivtiDYnrDy7kRF29P8T+IE4FSd1fsQ68ZGoxqkJSHvn5KGvMAEbyxEfSSif5Jh5ZoOzHSCAAWXWw+qXOSgfbjxUfGvxZUNatqpUrD8IuIaqeF7/T+nj1VL6GD7bOeFhqMlvXkaywvhn4pPGrt5nJMCrtrYHC4gocJR/u5ox9mgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783772967; c=relaxed/simple;
	bh=lgplXt8OmmYK0O5s0vGlPCfavq5E5GB8C7ljQ3QichI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n51OnNR2EJHP6s4FDY8ikpgPAfV7O7yhLpcGNGV5g4QsQyZegb/jJS34phenhluhgkKbDSxBbeVrqJ2i3Qice+kZCgzeszscz9cad28kh/Qqq8/1EgLfKWozEDx5ovyoO8NdKCvifA+7RR5WFkMD0OT5PxOs9yl9qZYpU2G3wu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyAyxwV4; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyAyxwV4"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-698bf053053so2732028a12.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 11 Jul 2026 05:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783772964; cv=none;
        d=google.com; s=arc-20260327;
        b=eRt0EiEZ1CkL8rTKfs0wxpsxk0cxonFau/QY2X3XYW8Kkj1SvpDBX2U1r57dckT8oc
         k0qGSjjBaBjZHaGLnW0yzmfMVlN8BS80CmqyLskvfONcQzn3uwiGoHm0CDI44YaMq89C
         yMKxYzFxVh8uMLkQQJXWADGmLZA3G0MQOMjv5bBlYhiaLckbUOpqOp1m6s+HNHVOoLgu
         AR0LFU1UNQQ1DHhAmAkzvBwvhRLwqeUSDMpqLyNbgVMP0Nckg7XlZoabvekFE7Owbxew
         xuDSxdhKgSyWmYWyH2UPR1deZE3tZPBmO1OOGTQQn3bCgoZpzvXfoRuJFEo5qJTFjqpj
         VQPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=83oOaaTreHaoFIhiDoHcddDWSjKDujW9xu9zE75la/o=;
        fh=ytBE+kgKScJotqP2YIrG9KupIM7MkMe/v2nirRsbF7Y=;
        b=cYI6W6EsKCkYjPIYE0/wU5iKsilmboxRhVQnE7biY3/zO1BCNTnxiQEXJVvhbUGg+j
         LDA9vumQLpFJqeDMbXHCe/GDLWL4CLZho2h/6QZ9rixMDbsTJ7FKwYx7fa+Nwn6JbfQ6
         1MZGBzRN4e1K6xmF8VTAWZn0bg9XYIhduB2EcrZk7+iXIdL9vLdIZs7qrSoP+l4/mn7i
         HpzP8UGDNOVZAjBNc4Fj+GB7rayBE7brMCzLIlxIK54xHGO2XVLfIocbV78NA19ZuTes
         mVd2OKbUDIF5gEgn7akY35OduKzqpYyJ15bfLiSD2P7W51DsNBgMxLUDzg/1KdUWfLEh
         46tQ==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783772964; x=1784377764; darn=lists.linux-m68k.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=83oOaaTreHaoFIhiDoHcddDWSjKDujW9xu9zE75la/o=;
        b=IyAyxwV4Edcq/DWxRGquffcOtHyod29cgcjDhTqkQYRHuJKbdjvOBImh8MTuorg1eq
         vSb9TLN1WWZHTmJQOCdKrulJy0Q/3NaORg/l1xQ/taH2Y8oWzkaOifST2DcBT8IMbf/a
         +vfHCKHCjuzu1RGxOAkeyTpcmpSYKPe7mVpHOq7wWS2HragYwDJRvDRSB74EigzeSwmS
         4ZYIQh59Q30EDonRYUqozeGvaRhb9A2Dt5uLRfYOh0Et4gSK+LpqlvKCbumkyhbkHvnt
         CuOhyoS25cQ90NCYD7m+5LJBjUBkiWVULhTLk1MrtStIPQSSxz8IH7BvH+3/r0ak0Ufu
         120A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783772964; x=1784377764;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=83oOaaTreHaoFIhiDoHcddDWSjKDujW9xu9zE75la/o=;
        b=Ns5mk8fz5lXQOpAQi4xNGVegBOCy83FbR2YbF6dbGGLfPRwfRPXUnLPjEcEdDOoDxN
         zth8LVV8fjH5kHEKvucmo11ocVaIoz+PdF5aFu9Jkm5PLrwjWRXQMIoppkMxauJGuKsF
         VQasBiO1436CYyndzp9CrphEbAU3Qv7UfvwSpaFZ0nPU1xwkDBl61sv/1ZQItEryf4LB
         md04b0vAfFXIP5YRIWrhJ8dG7jp6ESPMIX/MR22powoLHrzuwZfDzKQ6CSthCXMoO5Ab
         xK23htVT1iTwCdGJt2RcdPY/65HzvQwLGuwQLMn7DX7FNuleJ/9BRNKJpd0YvYVxrrMa
         d06g==
X-Forwarded-Encrypted: i=1; AHgh+Rr6C7dEw+v314rwGfvu4Z1L6XQ6vaE607HWNIs+89soWFtT2uSnt9zkfxm0VApWUCwWBzstAWXhJojG@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Ywhqn2W5EjNUIM+YBz3tpUJNLO5ab4e/qEeVKpdQyIbu4y5Nb8Q
	r9Jmt5jN8wHp307OYDJeWMF0Od3vueLANOxCqA8g7RaU9yYRAQT38RrVmf/OPyxpkGxb9pJahNJ
	Rx7vUDprfPE0MIIBAVvEyDFCNn15cmaU=
X-Gm-Gg: AfdE7clMX7OkfEMZuWRwGhsBUU197bV1Y3kQ5CuD0sAWuiVoG0HKdWyCfrdC6TyI9CF
	2phFl0B2qZelpz/DGmDKP2MMZ4owmwTTu0snWqyvOHLBrDddGZAFdUi52qAgYNOaJvLighxOgO7
	18cD6e7lDI/4VlLIy7kBJYTEnMyDcdQLl+0rkoEJeyIRTnd6XLTCUVxdIW2NUIvJt+xkxHgsG6v
	2CKcwitYiCNGynVW1bfXV5t+ANhx7kD8LicUI/3VmJfomic3lUAry/XNImJMimIYQ8i9EiNFA8d
	DN98ABtBuPgzWs1Qx9NVQ6AMtOyWsQ0bcotLacIf5JxtTEByYDKCG1RK78QgBBI=
X-Received: by 2002:a05:6402:3512:b0:699:728e:48b9 with SMTP id
 4fb4d7f45d1cf-69c5edb9cb3mr1210325a12.0.1783772963919; Sat, 11 Jul 2026
 05:29:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org>
In-Reply-To: <20260707181957.433213175@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 11 Jul 2026 14:29:12 +0200
X-Gm-Features: AUfX_mzOlRB8ana7x7qPQc4frMU9J060tNH0Z2GPCNvL1LYqDKQBjM-XzHbrvno
Message-ID: <CA+=Fv5RpgQ-UeGAT+VcLufte2gAp0H=J5GqZEFR_SuQsmnzy=A@mail.gmail.com>
Subject: Re: [patch 00/18] entry: Consolidate and rework syscall entry handling
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> With that all architectures using the generic syscall entry code follow the
> same scheme, apply stack randomization at the correct and earliest possible
> place and skip syscall processing depending on the boolean return value of
> syscall_enter_from_user_mode[_work]().
>
> There should be no functional changes, at least there are none intended.
>
> The resulting text size for the syscall entry code on x8664 is slightly
> smaller than before these changes.
>
> Testing syscall heavy workloads and micro benchmarks shows a small
> performance gain for the general rework, but the last patch, which changes
> the logic to be more understandable has no measurable impact in either
> direction.
>
> The series applies on Linus tree and is also available from git:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git entry-rework-v1
>


Hi Thomas,

Thanks for the series.

I have an Alpha GENERIC_ENTRY series posted and planned for the next
merge window:

https://lore.kernel.org/linux-alpha/20260706170019.2941459-1-linmag7@gmail.com/T/#t

Only its final patch intersects with this work.

That patch removes Alpha's architecture-specific syscall_trace_enter()
and syscall_trace_leave() implementations, so the Alpha changes in
patches 11 and 12 will disappear once the GENERIC_ENTRY conversion is
applied.

It also currently uses syscall_enter_from_user_mode(), so I will need to
rebase it onto the new entry interface introduced by this series. I
expect the integration to be confined to the final GENERIC_ENTRY patch.

The Alpha-specific changes in patches 11 and 12 look correct to me.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
