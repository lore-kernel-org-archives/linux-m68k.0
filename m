Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D247158524
	for <linux-m68k@lists.linux-m68k.org>; Sun, 29 Dec 2024 14:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735482216; cv=none; b=Y9YqLdV9dPhDzwD/qitQ5E7/QHJ3ahjsmmx23nkQBkewO4lMMrWL3lMQAqFJL4cA0nX5lHvmXQjicAVaMhkYfcmomq20LaL03up14wLS5fNZwew0cyDi5z/UJM28goyjQxrZ/tkO6COdGTNYdm53QixaLV4AQMD0Jz/k5MtUku4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735482216; c=relaxed/simple;
	bh=HpKtBxUC1C/IPpF8E897GeSso7+foGT5V+tFHTA6ABI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MV/aPcjVQO/ZcjslesRcipYMqLeSFrI+PAdSiXJVmByxqVxPpGQs5iHwQcnIWJDz0EeBmxXtL2cYv19dGHu6MEy6jycdV57NUz2pKgWvlZbUQk0CdPbeqwHST/6JwFSeR5Ce0K/Ti1Y7iFhlEY7oRyxWRGnmZjC2GNpkRfJexWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5187aa2c97dso2864279e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 29 Dec 2024 06:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735482212; x=1736087012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJkgEJT8WcoDk1SIxMtxhW8aZb2FiOHku/9KGruRMlA=;
        b=sa3DUvaHLu3AoKsKQr1hoxq2pcKbH0Ne0+YdkQnT+JA6PN9opB+EQ+VJrL6kaB+m16
         PVLHPEtWH66Ja4Aw4jQ1psHrdXjo+vlv0+lf2k2DYa1ekxCkIBtqSAaIToGRxr+LOpij
         cCmm0cUGD4S4QJlPvGATCOXjxjPyy4L75S85X1wYkDVRvQ/C4ukxDPWsaS/X6GBt2d0r
         zu3jU2CEM3LxD3+ueDfk/DMZfEcXT74kSElbtLC7+41ibLZ6jD0xcq/TA7ycLNL0aEH1
         yNaGEZMJduRs50PWCvxmxmbymuAXgdajSUGKPwSuGeX58AVOiwpTZlGEa/kZpiRb7lga
         J03g==
X-Gm-Message-State: AOJu0YyIuxJbVosTOejMTTkKbiIP7gYvmLVo4kkVLUnMxpS9EZx3S3aY
	Q+USSftxV8hluLanZm2raSNZPARRjGNbFi1piJKq9KDk1kBk0ggnS73RMMWJ
X-Gm-Gg: ASbGncvbMSKKQlu3dadI/QVFzPcH1rdUNZkhbQR97qtRMcz32WWdJam8uKCg2AU9Nx4
	gB/mbm369RGBgpphwiVp9INllcMrBAm9rod0vqawoinClOnw+SEfzsPfBA3enYv6uYAh/KDkGJs
	WK0WlamuVcy2jAZMGqECAwqCtYpBUIZc6i/v9LAJrDD3I2cvlAUemOVsdFn6WudAy/gOpQkFQfk
	4MbNgahjGvhkUvt+p82jY8SEfVbXZEUUFJduAPPb/kDHQ+JYm9clZTRZbMt4hs+emAAH0SGWdlj
	OqvyJqBrh614ALcRTNSdz6A=
X-Google-Smtp-Source: AGHT+IHVcKGSgGGyCvzwBLZUzKKHWxTK8sRNQ2QFjfBYf4j30hnE5ttx2W1G/sfZOj2KLziBIRH5pQ==
X-Received: by 2002:a05:6122:1b0b:b0:50d:5e21:ef39 with SMTP id 71dfb90a1353d-51b75c46950mr24442083e0c.1.1735482212042;
        Sun, 29 Dec 2024 06:23:32 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68bb4751sm2210754e0c.18.2024.12.29.06.23.31
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2024 06:23:31 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-518957b0533so2697487e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 29 Dec 2024 06:23:31 -0800 (PST)
X-Received: by 2002:a05:6102:c12:b0:4b2:485b:e151 with SMTP id
 ada2fe7eead31-4b2cc360159mr27416916137.10.1735482211372; Sun, 29 Dec 2024
 06:23:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241229134848.0a1d9719@windsurf>
In-Reply-To: <20241229134848.0a1d9719@windsurf>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 29 Dec 2024 15:23:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU-DB1kOymg3-E4nRN_8R8N_R3wVZq7MNYUGsQWLa3hrg@mail.gmail.com>
Message-ID: <CAMuHMdU-DB1kOymg3-E4nRN_8R8N_R3wVZq7MNYUGsQWLa3hrg@mail.gmail.com>
Subject: Re: Build issue "Error: operands mismatch -- statement `movec
 %d2,%caar' ignored" on m68k
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Sun, Dec 29, 2024 at 1:48=E2=80=AFPM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> While trying to build the multi_defconfig, from Linux 6.12.5, for a
> 68040 system, the build fails with:
>
> {standard input}: Assembler messages:
> {standard input}:104: Error: operands mismatch -- statement `movec %d2,%c=
aar' ignored
> make[5]: *** [scripts/Makefile.build:229: arch/m68k/kernel/sys_m68k.o] Er=
ror 1

That's not the only error:

{standard input}: Assembler messages:
{standard input}:17: Error: invalid instruction for this architecture;
needs M68K mmu (68020 [68k, 68ec020], 68030 [68ec030], 68040
[68ec040], 68060 [68ec060]) -- statement `pflusha' ignored
make[5]: *** [scripts/Makefile.build:229: arch/m68k/mm/kmap.o] Error 1

There are more like the above, but at least these tell you what's the
underlying problem: the cross-compiler does not seem to support real
m68k CPUs. Interestingly, it was built with --with-cpu=3D68040...

Also:

    cat > /tmp/a.s <<EOF
    movec %d2,%caar
    EOF
    output/host/bin/m68k-buildroot-linux-gnu-as /tmp/a.s

does build.

    output/host/bin/m68k-buildroot-linux-gnu-gcc -c /tmp/a.s

does not.

With plain m68k-linux-gnu-{as,gcc} (Ubuntu 13.3.0-6ubuntu2~24.04,
which is also 13.3.0, just like the buildroot toolchain), both work.

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
