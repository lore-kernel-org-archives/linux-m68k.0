Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794852645;
	b=zbFEiMT/4lyMivQoTr9bcEOFXdCzGjdYi1eyybRzRlng9Pdx/4VSMeBBFCGQNWApqxV1
	 YyRZ64xxx6ZEMed/P+yMFcouCFEjS/uF3qK5A6BH2G3wJXHYtD91vcrpvugqoh46fv88v
	 tQ57j7tmijt8PQDs+XDNFz+4iT65VnPBEyM07dYNTjQYMInA9eouBGkG5ddefhWlS3w8Q
	 0GTPX+6x0/bwxQIZN81X+fkab39T7NR0w3bmEtLVF732HpqyB5cfF2kqD6eYTlmaNWu9i
	 oxRZjnhKqg3u0qw5WtBoQry+e8i3MbDkXmnEMNg4nQVWcU18H+M53558sD6lCuGr7Cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t10LdZZQL9q+bSGABLhe386ponBIV6xlTkNunDiJC5Y=;
	b=xecSu4h4ch3721KKdI5He1L371ajV4w0pBWwEDqW8g4cyCqg6oGqNmzj+iEvTtvoaG1I
	 O7j+qmLB2W9N31pvZ1zLJ2yI6+WKjrjTNcFUC8mgoheqQVZCKUOw63Uoh7Ciw79vU/Bnp
	 JJqS0w0z48ZgZXtXH20Pfu5HV10+VVXF4/+533NzddudmNDL6vOIFqUmP9/RZGwolUkwf
	 FL12/pcqMQJuYChw0Ymg+Ow8hBYQ2dwf67/6/L21gZ2jWrD/eLjgCS/ys9rtsTMNvStq0
	 OFClmiSp/r6dekwK4+VVylw4Tw1Z7GOcoA4rFYKG0+rX5wMiRASW0qEBjcVskoe7HaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N3npYvpw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA30606A32F
	for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Nov 2026 18:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AA30606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N3npYvpw
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8082af2ffso1893117a12.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Nov 2026 10:10:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852643; cv=none;
        d=google.com; s=arc-20260327;
        b=FBDACNwZf0TllMydMqVC3uwqksTeJBMAOGXPw/jR/ogWwlWGOxqq/J/+Nujv3H3O84
         Yq3ydc+Sz2lNm1zmtCHFP8BSGLsMC0cCjMal5iZikNgXl1JobOajioFcvkTQPtFR+91K
         v2S1SsN3eBlIfyYYGF8o/vNTzsUUf/SQg7iWptcKPQC+UHnHX14WCwPyAe22aq9bZv/h
         VV67TVB7lN5pXG4ZZhg5py9BLsK4SbuBsSzs9a4XyRWUzV7pnLPi4rMkHDwphI+pcuxA
         aVTur/oakTo3zzxP1h0/brU1ADnWaDcmDhAVu7XpESS3dWLNb5gCPd82JOAq4ZBZckif
         y6eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t10LdZZQL9q+bSGABLhe386ponBIV6xlTkNunDiJC5Y=;
        fh=C+BkcBkrJ2bWdGfYE1xMG228KvpdH4gqpj1xNJ8VWEo=;
        b=IyqXeCjbyerhHZRDv/kchxe9kQmhZ97RKAyf61lpMV/G40/v+H9PKMIZjTULD7/Vqn
         ok/TTAklDfjT2sOdfMCM6ljkN0I9kEv5buC4RD69GtBbZPva7Jl20Fx9Zcyym6/Dpu7A
         dg9P4TW0v6JRG64KS7WFTmzBEUOWquEltE33aUOJjGQeSj2is0CQD5aoqJHH1/IQ//v1
         PQ2dMq+hNz8eHpUZ6HL6HyGh7twrvpF39bwnHHDbu59ZVdW/GeaBKFunPs7k0awuq0P7
         b3JHbFJpl+PsvIBvkVoL0LcQ9rJasEh4SwRzhFSsGtwM3uW1wwzvvRuln7MNy7E64rBJ
         tRpw==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794852643; x=1795457443; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t10LdZZQL9q+bSGABLhe386ponBIV6xlTkNunDiJC5Y=;
        b=N3npYvpwE9nx/EgE/88PNszpZWsSv0AXBHxdFzAHfXc1IbhJBYcsSUqWH7hvllyxC2
         /orCHB/ix0Jk/1q8W9KYzQYatgUftvI904DqU8L+4BjEKF9WG0Ya5VbSXN961z48UEAn
         zGQkuxmBP1WVBlAQH8L2sAE/Id4Ve/TXe52ddohTcy3JwS/dkhUxnwHawIXRACtCa5Jy
         aVmpv9vNWpZ6JMthmRiV4f7lA0+EeBe7EmuKlxieCZvtXskQWPwI3VayLunObSCN+4Oy
         0bjmwoNiFGhVE1dteFKOoZVTOoTfVfHUM/l3AEMT7Y4UUIPAg8I+7ispH8srasPYZc3v
         84qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852643; x=1795457443;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t10LdZZQL9q+bSGABLhe386ponBIV6xlTkNunDiJC5Y=;
        b=aIu8oSenYkNAvWh6j7LSml1FWoHbuWi2Zs+Y9kfPoEJ1rVpHpunBzyBjkdrHtZew0T
         lXbBgHq+e1bWvuEktrXx+RPYPB1768+HeRs6C6sCcaZaME742ViIatgxREb5PnsYfPjk
         ASt6kz70T4Ifz4iFqrdYmHAZ9oDbsk5cydcv8NYnGu+9VScmXlcfmQIXcUo8sjpFo3Uz
         ixyO/tMg8fJ7A84wRwQKaUt3LTkfruBQOiINx9Zv1pQkU/dzT2LmgCp889yCr4FDoL8o
         ApgmgcH6c+0jhsKV5VJ3IbULIr9HqpmhLLKUwHBfTi06F5yQC4PJ81k4Ei2/TMLXVe0b
         Z2fQ==
X-Forwarded-Encrypted: i=1; AL+hErEMETZjJFfIZNhihxvh4DhQ8BktmmuNZ4qE8W7PkJHds0l8ar20EaFNqFG7xj2242xNTh6eNiyIHQ3Y@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z8k6Pd3LxYgpnq9elR+uhVsywGJ4ZZWDoUPCWoY4oCpF0+Rv4JC
	TortQvYSjPwqAjK9qnF4zJ53KQ3W9o6TPlSMpQ0RppUxSOL40Zw4aPsz3w9+aijYNiTIBAu2YNy
	HR8SmkgtpCTwY7jS4bESE37GVFzBE1iQ=
X-Gm-Gg: AYBFou2TZQzrUAv8FqkK9eNqc5dbkrbn93PHPWHHECcO+dvCUKEkvxOOkoSmWKkBVXH
	lyBTCi68q4mMSuiU2kIoFvC+XPPTOIVHfOaIW/vCzT2VP3ufgOj/P5jMuFuRj774GejJMATkBrD
	UrdgnEGPQ1fCsaeW9pQ7mtSg5R62MTLjy0Oq1n0+OnOrihZ93ZZ3m7gsKNYo59EMKFGE3DYz2W6
	OU4tfcyLaO3vz+Im0/aLxr2rcpMaFRvYob2qr6yAciwIc/l0CeZn7HrIr8wsHm841uxbuC4M8BN
	5Y2MEnmdyCfEx3eokXjnGWPuFSTvUe9DeIDpaP+Vz2PUKvYbYPOPah8pt+q4wIhsvi67SGiK4TT
	0KgCA+M9I8L9aGqHIoM+Z7SGBA509bO4HH+IJA1d+WicOWRiNfGLi8JGNfWHeON7BbeZiggjDxg
	56bP+ucQjWYS1QGu79RC2gcFyWBvVVAlRsKhEv4GsKNBla
X-Received: by 2002:aa7:c4cc:0:b0:6b4:1037:2bb1 with SMTP id
 4fb4d7f45d1cf-6b7c0bc27a9mr6612692a12.22.1794852642773; Mon, 16 Nov 2026
 10:10:42 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114184720.373178-1-renzo@cs.unibo.it> <20261114184720.373178-2-renzo@cs.unibo.it>
In-Reply-To: <20261114184720.373178-2-renzo@cs.unibo.it>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 16 Nov 2026 19:10:30 +0100
X-Gm-Features: AclHuK-3zf0u-_tVqqSwOuwnlXe0JuQIB0eE-s6YSpQo7rK-ZYPGihb4jDlFOAE
Message-ID: <CA+=Fv5QPMYffznpkrEhZ3pMWtpHwNUUa3OaHxLexu8S47a7tRQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] asm/ptrace.h: add instruction_pointer_set
To: Renzo Davoli <renzo@cs.unibo.it>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Oleg Nesterov <oleg@redhat.com>, Shuah Khan <shuah@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Eugene Syromyatnikov <evgsyr@gmail.com>, Davide Berardi <berardi.dav@gmail.com>, 
	"Dmitry V . Levin" <ldv@strace.io>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, strace-devel@lists.strace.io, 
	linux-api@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Brian Cain <bcain@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, Simon Schuster <schuster.simon@siemens-energy.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, linux-alpha@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Renzo,

On Sat, Nov 14, 2026 at 7:47=E2=80=AFPM Renzo Davoli <renzo@cs.unibo.it> wr=
ote:
>
> Add an instruction_pointer_set function for architectures that do
> not currently provide one.
>
> Signed-off-by: Renzo Davoli <renzo@cs.unibo.it>
> ---
>  arch/alpha/include/asm/ptrace.h      | 6 ++++++
>  arch/hexagon/include/asm/ptrace.h    | 6 ++++++
>  arch/m68k/include/asm/ptrace.h       | 6 ++++++
>  arch/microblaze/include/asm/ptrace.h | 6 ++++++
>  arch/nios2/include/asm/ptrace.h      | 6 ++++++
>  arch/um/include/asm/ptrace-generic.h | 6 ++++++
>  arch/xtensa/include/asm/ptrace.h     | 6 ++++++
>  7 files changed, 42 insertions(+)
>
> diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptr=
ace.h
> index 45d1229344b6..1a6f073e892e 100644
> --- a/arch/alpha/include/asm/ptrace.h
> +++ b/arch/alpha/include/asm/ptrace.h
> @@ -33,6 +33,12 @@ static __always_inline bool regs_irqs_disabled(struct =
pt_regs *regs)
>         return arch_irqs_disabled_flags(regs->ps);
>  }
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  /* Syscall emulation defines */
>  #define PTRACE_SYSEMU                  0x1d
>  #define PTRACE_SYSEMU_SINGLESTEP       0x1e
> diff --git a/arch/hexagon/include/asm/ptrace.h b/arch/hexagon/include/asm=
/ptrace.h
> index ed35da1ee685..0a121f6e3bfc 100644
> --- a/arch/hexagon/include/asm/ptrace.h
> +++ b/arch/hexagon/include/asm/ptrace.h
> @@ -18,6 +18,12 @@ extern const char *regs_query_register_name(unsigned i=
nt offset);
>         ((struct pt_regs *) \
>          ((unsigned long)current_thread_info() + THREAD_SIZE) - 1)
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #if CONFIG_HEXAGON_ARCH_VERSION >=3D 4
>  #define arch_has_single_step() (1)
>  #endif
> diff --git a/arch/m68k/include/asm/ptrace.h b/arch/m68k/include/asm/ptrac=
e.h
> index bc86ce012025..6e8a8f0daee8 100644
> --- a/arch/m68k/include/asm/ptrace.h
> +++ b/arch/m68k/include/asm/ptrace.h
> @@ -18,6 +18,12 @@
>         (struct pt_regs *)((char *)current_thread_info() + THREAD_SIZE) -=
 1
>  #define current_user_stack_pointer() rdusp()
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #define arch_has_single_step() (1)
>
>  #ifdef CONFIG_MMU
> diff --git a/arch/microblaze/include/asm/ptrace.h b/arch/microblaze/inclu=
de/asm/ptrace.h
> index 17982292a64f..69e10658d7a9 100644
> --- a/arch/microblaze/include/asm/ptrace.h
> +++ b/arch/microblaze/include/asm/ptrace.h
> @@ -20,5 +20,11 @@ static inline long regs_return_value(struct pt_regs *r=
egs)
>         return regs->r3;
>  }
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #endif /* __ASSEMBLER__ */
>  #endif /* _ASM_MICROBLAZE_PTRACE_H */
> diff --git a/arch/nios2/include/asm/ptrace.h b/arch/nios2/include/asm/ptr=
ace.h
> index 96cbcd40c7ce..d120d8ecb187 100644
> --- a/arch/nios2/include/asm/ptrace.h
> +++ b/arch/nios2/include/asm/ptrace.h
> @@ -70,6 +70,12 @@ struct switch_stack {
>  #define user_stack_pointer(regs)       ((regs)->sp)
>  extern void show_regs(struct pt_regs *);
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #define current_pt_regs() \
>         ((struct pt_regs *)((unsigned long)current_thread_info() + THREAD=
_SIZE)\
>                 - 1)
> diff --git a/arch/um/include/asm/ptrace-generic.h b/arch/um/include/asm/p=
trace-generic.h
> index 62e9916078ec..632d4ce3334d 100644
> --- a/arch/um/include/asm/ptrace-generic.h
> +++ b/arch/um/include/asm/ptrace-generic.h
> @@ -29,6 +29,12 @@ struct pt_regs {
>
>  #define PTRACE_OLDSETOPTIONS 21
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  #ifdef CONFIG_BINFMT_ELF_FDPIC
>  #define PTRACE_GETFDPIC                31
>  #define PTRACE_GETFDPIC_EXEC   0
> diff --git a/arch/xtensa/include/asm/ptrace.h b/arch/xtensa/include/asm/p=
trace.h
> index d0568ff6d349..97b14418955e 100644
> --- a/arch/xtensa/include/asm/ptrace.h
> +++ b/arch/xtensa/include/asm/ptrace.h
> @@ -103,6 +103,12 @@ static inline unsigned long regs_return_value(struct=
 pt_regs *regs)
>         return regs->areg[2];
>  }
>
> +static inline void instruction_pointer_set(struct pt_regs *regs,
> +                                          unsigned long val)
> +{
> +       instruction_pointer(regs) =3D val;
> +}
> +
>  int do_syscall_trace_enter(struct pt_regs *regs);
>  void do_syscall_trace_leave(struct pt_regs *regs);
>
> --
> 2.47.3
>

The Alpha change looks good and applies cleanly on my for-next,
including the generic-entry fixes.

Tested both series together on my AlphaServer ES40. The ptrace
selftests passed on all three CPUs, including syscall skipping
and instruction-pointer modification.

For the Alpha part:

Acked-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

Thanks,
Magnus
