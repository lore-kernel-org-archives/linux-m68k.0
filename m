Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9001E1353F9
	for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Feb 2024 08:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709024123; cv=none; b=dL8LubTO8cMd63U8eOQxiXsospegHnkPEx5Z3Ti8gKkpMMA6pGrkYgIRvawp3vYaD8uVyHKnEjq8GHZcFaL3+YLBmmSl9hJK5ZAyAYtWnpesslLfb57Ws/qOekC70H1HWWEXS8Wj9KF6Ln2GbDUzc41b6kLNe2pfqRNmEgDprvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709024123; c=relaxed/simple;
	bh=w0gu9IMca9J/tT97UVi+QQlbmYRnY/qPlnzkCAmcRmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q5tarJDMnTeN4VAwuL6tctRqYsbVmA4+h4JXZ5v6dSkcIBTOW4/Ugrnqnh3fT1aN4NPqFpythZ9pkuhIThwz5N9ZZJUJ7+hjeBuykgsYeXsq82Xu+REIFaVPdwxN7Hcjyk4eYw165qpsDZVKPN3+vZewF5735EuCOOdFt4FqhLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6e480cd18b2so1417455a34.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Feb 2024 00:55:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709024120; x=1709628920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LF4kXg8LPe/h8pV/74EqYHGgPgOEfsUWLG6ibzoE1S0=;
        b=aPE3auhySmtMQI2ah2zc5fZdlgZFlKSEqarE31LjSS3Kts4DY+Rs6AReZ6xmTbMkm/
         4yAezNcV8+dBSs6W5+e2s/oyMJ0DeeIOm8DtNWZvNmPCC6jL94WtNMj/j0Cgjyte0JEc
         VuTT3yuqYI0gAxnnGEfoWF0DfK3B2A7Jr2P9Leu6Tw2q8GmDxAZs3yURdE4stTceAa2g
         7zkaS9YkWNhlfdmT+BOa3gmvQT+76DiE1lp/r/D2u+ELiwhTtXjPvMlSRbfnhjHa8TVD
         RAXdQfVWvTUyYP8dERAVHm7SJXLPJJJkdMLjBetQYbHvuEPuDhXS1RV4qLNv0P31g2NO
         g65w==
X-Forwarded-Encrypted: i=1; AJvYcCXIBLTirRb4FuL47opRlDYBA4Bvuu2NgX/dgmrGqxMcnBhcRpe4zKQX9FoY/GoZhV63z28p/DV8bNlmFvAr64eMStV2HPC+q5rPtaqhaNQ0
X-Gm-Message-State: AOJu0YzQfO3wFTGoj3xDXmtK9YCyaCdM5NdhIuZyimoG+jxnpLTltO7H
	ofgqyivklzr7y1Zbtsu9f01RmTKwLjCSEvyYywH5QS2VVtRAbVGoqjgiHHdyb2Y0gg==
X-Google-Smtp-Source: AGHT+IF1Bot/ZvSGbmNDJXZcahFfHQYlJASry8YC4mL6cl8uMdxqqhS7fhFpYxe0ngc7I5Rh9g3Y8w==
X-Received: by 2002:a9d:7490:0:b0:6e4:7bbb:f3ae with SMTP id t16-20020a9d7490000000b006e47bbbf3aemr10205056otk.4.1709024119677;
        Tue, 27 Feb 2024 00:55:19 -0800 (PST)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com. [209.85.161.43])
        by smtp.gmail.com with ESMTPSA id b23-20020a056830105700b006e49669e1f1sm1097247otp.10.2024.02.27.00.55.19
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 00:55:19 -0800 (PST)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5a0919f2022so641625eaf.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Feb 2024 00:55:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNAHwyQFqUZt+APPFCX/N6oYGZW07I4gwvk1/KQPYo9CFxtv14l3Rjm/+VFUgYZ8TXxnsr5rnFYqyyUSfzsVfyLbWsXiE3D3bmHWPMsb1l
X-Received: by 2002:a25:71c3:0:b0:dcf:2b44:f38d with SMTP id
 m186-20020a2571c3000000b00dcf2b44f38dmr1589302ybc.49.1709024097788; Tue, 27
 Feb 2024 00:54:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226161414.2316610-1-arnd@kernel.org> <20240226161414.2316610-4-arnd@kernel.org>
In-Reply-To: <20240226161414.2316610-4-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 09:54:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWRBQF95fJ+NkPUdvpu5VfRm2WyTnvdqB1Xe7d4vsvY2g@mail.gmail.com>
Message-ID: <CAMuHMdWRBQF95fJ+NkPUdvpu5VfRm2WyTnvdqB1Xe7d4vsvY2g@mail.gmail.com>
Subject: Re: [PATCH 3/4] arch: define CONFIG_PAGE_SIZE_*KB on all architectures
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Kees Cook <keescook@chromium.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>, 
	Andy Lutomirski <luto@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Mon, Feb 26, 2024 at 5:15=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Most architectures only support a single hardcoded page size. In order
> to ensure that each one of these sets the corresponding Kconfig symbols,
> change over the PAGE_SHIFT definition to the common one and allow
> only the hardware page size to be selected.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -84,12 +84,15 @@ config MMU
>
>  config MMU_MOTOROLA
>         bool
> +       select HAVE_PAGE_SIZE_4KB
>
>  config MMU_COLDFIRE
> +       select HAVE_PAGE_SIZE_8KB

I think you can do without this...

>         bool
>
>  config MMU_SUN3
>         bool
> +       select HAVE_PAGE_SIZE_8KB
>         depends on MMU && !MMU_MOTOROLA && !MMU_COLDFIRE
>
>  config ARCH_SUPPORTS_KEXEC
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index 9dcf245c9cbf..c777a129768a 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -30,6 +30,7 @@ config COLDFIRE
>         select GENERIC_CSUM
>         select GPIOLIB
>         select HAVE_LEGACY_CLK
> +       select HAVE_PAGE_SIZE_8KB if !MMU

.... if you would drop the !MMU-dependency here.

>
>  endchoice
>
> @@ -45,6 +46,7 @@ config M68000
>         select GENERIC_CSUM
>         select CPU_NO_EFFICIENT_FFS
>         select HAVE_ARCH_HASH
> +       select HAVE_PAGE_SIZE_4KB

Perhaps replace this by

    config M68KCLASSIC
            bool "Classic M68K CPU family support"
            select HAVE_ARCH_PFN_VALID
  +         select HAVE_PAGE_SIZE_4KB if !MMU

so it covers all 680x0 CPUs without MMU?

>         select LEGACY_TIMER_TICK
>         help
>           The Freescale (was Motorola) 68000 CPU is the first generation =
of

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
