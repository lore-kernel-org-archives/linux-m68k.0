Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B895938F249
	for <linux-m68k@lists.linux-m68k.org>; Sun, 19 Jul 2026 11:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784460348; cv=pass; b=qntINuILeKjPDR3orhNGWtxvKOhklzee26ijnQDOiDEWIRYhTdLj6QWsZLiiLxZ/6Zvogv3nT6SIidw33uyr6q+H14rzvcIOQ3uE1mbQECho5uO3NDnZjLGI2vqSYVV5P8zaLCXyXih9C0DN4t8M6kmQHXosHbZcYb7FdNS/AOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784460348; c=relaxed/simple;
	bh=rgcqbxa6lEmJgPeR85dLIKFK2p9ERX+2iKovNt7jIVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p42pLyVXVmc2VsgK9DaKXMYbx08500bb/HwkWc8RFe6X71+eQ64C10FjC1VzUMLy4SEOcEtGkHR+qCOnav4VGv+yp/tgf7Tdow9wJrhfnFEt5lFUgYmYR1Q7pALgH9Y71nmFKfeeXQqlT2JMf+oKUoxPEFolCu0WR82hYojQkvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFz8ScIr; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFz8ScIr"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69e08ad526cso5780794a12.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 19 Jul 2026 04:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784460345; cv=none;
        d=google.com; s=arc-20260327;
        b=O0fyqz8yN34kUkfo9XhNb6KIYdZa8p8aZr/b7oTnZVw2rhAyT+kElBiSsMAsCF6jZB
         Xpu4FpdOAlCxNt2S0/0XDHtI86ONB89L8kGEzA6H3OMbeA+BQpwfDYigWxIvdt/froMv
         9xw+4sH+BEgUIACN25fFKB/PeSaxIIQk2WQePyd72CGkkozv5bMcQ3PUMTNpKPk7gikg
         5CLDg4r614NpicMaJETSEUe2MgAmO9/62CKI2/t573Z5NvyceN/6BqLQEguOGHutJLwk
         VkdGUiUU59QDvfJ1xC563LoKNLefUB7pAA3EZ7rUZbT82zPL2tjzBilF7+W2nLuP9isS
         keYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HjwBEg56Cr9vHNVIU01sUWrlM5gmQ+vCUXpN04JdIto=;
        fh=yRg9gLouN5wNsrDSt53f7jdD6B1G8un05UrJcKXFFlo=;
        b=An+7DR7RM+9iMHSM2Cs5eJH2Vr6TWnw8CMqBmkl0G1Ubd8FBHcK7t/5CrcHb7EcTwe
         tNOrCjiUxgYOT3JluwjT4sHGpSmvMwr+lz4qExp4BU3nJQhhMN4XX2PFScCugcm9DyUF
         FvUThLlKEibA3cXgLMD2CcpzgctRS09B0Xox77TylvEBevXeJDbaQnWBlLuEuU3KDATK
         yHNPOzIBngpP9KpSJFMnLG7nCfdRrp+yb/lqQJ2wxVrS95IPsgIBBnDuVJlM/DmWmC3R
         5uhA7C1Cc/BjObVCE6l5uQGQ7hIEVOqpduO6Op23w2T2s/H13LWGBGcLwy+wS07XmCMY
         kDzg==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784460345; x=1785065145; darn=lists.linux-m68k.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HjwBEg56Cr9vHNVIU01sUWrlM5gmQ+vCUXpN04JdIto=;
        b=CFz8ScIrx6jHkhvsKDLHoQ1Q4pOhs/YATyCh7oBLh6tZgjuxyoM2KNArTWjcFTep/F
         NKMnvwPm3LhTwbdCWzWel2kf/Zp9JH3k/wMXGL50XtPVxsl0l3bgXCcNtfOmjA91QuUm
         57LpfhJ9reK8BUQazrJs4QpcWvrt9AJE6PPYChTrQnzpBy0khVnDExj+11xSXDKGUJtn
         96WzHfZOKGmf7EPTgBljF02QVYGtjZO/Y3/GetKw45xliWUT9FUvIKYXFIplKCZkonJG
         2WmUIVr1do2ci2OJeoShRgCjXrkAOYqEd0O1GWJEVcSU1RmUiIOEeKCoCqWUg9O+xmtr
         JhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784460345; x=1785065145;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HjwBEg56Cr9vHNVIU01sUWrlM5gmQ+vCUXpN04JdIto=;
        b=JQYay7q6uuYgwh4m+2H/t6Ncg8FDbv0rUi9Phv7B37C0OahVdUg2+CHp1wDu9gtmA7
         hd2ljmlRCW0U88df/nnA3EnNV/QUef6fG8nfezceJl3f9l+XM1Ey1hgchykWWs7Tw3a5
         8/TudsAdrQvbJO00hVCS7qusM+i1oiGyW95dErTcVYHCuSpHmVvMb7Sv9L4FimoZyhyO
         mKbqPj0uCxAFupS2hrMEdO9+/AfNUFk1KVGNEN+1j3Ft+RwOoCHamkjgto0Gx7jdgH0h
         d+IIdxeDojqW+PLHesqFw42keqpRN700frfncoDXqxVxqrn9Qv+9f9vxjhLkDKy93ewM
         PpQA==
X-Forwarded-Encrypted: i=1; AHgh+RoZdY+8tcQEmB/YCkL2vPO6/hzKrSCcwgRSDqWOIosWeH/toHEhvp6xS/nxQYmxSGsQzO89U5yVsbOz@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwJBlEpUO9YBtlujTlAS3TKpesEW5uzw4rjgjTWhEKIQTnhK5/9
	oiZCrvd2qhbFrE3GRWmmasknFW7X9BtxrscI5fCW8gSvEgWEQTAZDTHj5rqUSAwQWEg3eYMHOL7
	LB3eQ2HepphpY+zNKzobnuvWe2Ex2RnA=
X-Gm-Gg: AfdE7cn4trHZINr07Mmj22a2rursgkmfdqkfGD94yEEoNFigTCyqBYS42PONunm//sG
	dQQUcZWXML8P0gd1RzQ9/mv/7ThCypkNxMsrVsOsNU0PNTFDn4y9qcSqc6H536Gj23ZT8QFfW69
	UjeIYejYVux+Chz5nfOk6fEdKZ/lA2T9yM6vSvYt5K1mCwDYZqAP43KqV4wTH2sc8MpINumBuOV
	KRLEKGJRiDqSs2G/TFkxy5GXYmj2LRd9ELR8tGoFKFL0RM7p611Ufd4IbNUbgMOJSW+ObAxHePg
	VVB55KI5sUefXzZzEXepxiXdkEvxuU2MLjNh8oJKzA==
X-Received: by 2002:a05:6402:34d5:b0:698:3b7b:e48a with SMTP id
 4fb4d7f45d1cf-69e652f908dmr3652615a12.32.1784460344585; Sun, 19 Jul 2026
 04:25:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org>
In-Reply-To: <20260707181957.433213175@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 19 Jul 2026 13:25:32 +0200
X-Gm-Features: AUfX_mzTzrHRlu_CZJHA0P1GUw_Z2tfq0CbfsG-DFTqsEJDFIQx7LWbdfB3YWqk
Message-ID: <CA+=Fv5TDNH8+JAojV9_W36kUkEE68uiA00FQ7i0vJunebqs1sA@mail.gmail.com>
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

I did another round of testing of this series on Alpha, this time with my
Alpha GENERIC_ENTRY conversion rebased on top of this series.

For this test I also manually applied the seccomp fixup discussed earlier in
this thread, i.e. fixing the recheck-after-trace logic in
__seccomp_filter() along the lines suggested by Jinjie/Oleg.

With that in place, the kernel boots on Alpha and I do not see any
regressions in the seccomp_bpf kernel selftest or in the strace testsuite.

One note: the seccomp_bpf selftest run on Alpha uses this not-yet-upstream
Alpha selftest enablement patch:

https://lore.kernel.org/linux-alpha/20260203063357.14320-1-linmag7@gmail.com/

One Alpha-specific wrinkle I hit while rebasing the GENERIC_ENTRY patch is
that Alpha cannot unconditionally pre-seed the normal -ENOSYS return state
before calling into the generic entry code: syscall_set_return_value() also
updates r19/a3, which is still syscall argument 4 on the normal entry path.
Doing that too early broke early userspace mmap() during boot.

The Alpha conversion therefore handles this on the no-dispatch path instead:
after the generic entry helper returns, if the syscall is not to be invoked
or the resulting syscall number is invalid, Alpha skips the call, preserves
any ptrace/seccomp/BPF-provided return value, and only synthesizes -ENOSYS if
the return state was otherwise unchanged. That was needed for the
TRACE_syscall.ptrace.syscall_faked and syscall_errno seccomp_bpf cases to
pass.

So from the Alpha side, with the seccomp fixup applied:

Tested-by: Magnus Lindholm linmag7@gmail.com

Are you planning to send a v2 with the seccomp recheck fix and any other
review fixups folded in? Is the intention to route this upstream
during the next merge window?

Thanks,
Magnus
