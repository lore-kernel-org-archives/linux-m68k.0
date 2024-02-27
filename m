Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E309B130AD3
	for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Feb 2024 08:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709023537; cv=none; b=UkpLuUpPMFwlzXdmQllEJ5JMWkh1jGRmRFgH5W8gWbqbvnw2Z4FDWos2O82eEQcqxrXd3rKb75ZKQZSjI+wJO7hPtdff+ZfLV/jO9RHLlwvTpX/dcXUtOeUQCtuMIp0ayLEfriweH2qfiqwFUnkDJrbVdvqSfUjduEoutvnjUSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709023537; c=relaxed/simple;
	bh=ZH6cCYrbNG2YOChcX3vTXEnEeEOKhVq2+yJTwt6+8Uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=btrqOsmYNMSyQl/BXdv2kZYGBq6H2Iz46S3flhtUjlGFsC7w0xCdCOmcPhQMGWqTJI6o5vH7UnHbXjW0BSed3rMx3EpOwLE6Tma9RbzPHp3qq5RBeZVTUbJjArHe/IhHXsoH0x4YgYBte5aimdq3RLL9bkO2SYwBqgmR9naMooc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c1a9b567edso493738b6e.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Feb 2024 00:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709023534; x=1709628334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzwNvfzqcMx0O3hVp46LgRJMNTPfRBstut9NEe744kY=;
        b=DCEQqQR58475CaEjROXquaZmDBlQQFOiE5zV3oL18kHwQYpFpXOUIgBmqz8EwHnm+a
         BXkVH0TUlNC+/k8dMHI0LRSlb4a14MF+2RhokoXBbhWmrSaVNrM6Zrpo0RDyLIhtthQr
         gh9GVKY3+fJZXXpEQRI00j96k8GiauvLee4gq9boElCf/oCF8LuI5oWE9FhIycll7ZFI
         RuvrSCjgPOgPumbttqTzcVzidwMyKVi85hbun54fv0jqa+l/eRSUbKJ5vNXOY2zjFX77
         tzWjUaLKRHrC9raf9EL2KYbsOpV3tnEesfzvaA+nA2AqXDL6x7MIpceSeaGPyy7E8r1G
         p6Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXgu5xIW3hdPVDWhFQ7+g7easPnXpl8uj7UwSFoTF3H/GB9fGWE7BVTJ11h9dWgtHPoOjKL25moegrHegnOsNfa3qkohS2vu0MJYOX7Xihr
X-Gm-Message-State: AOJu0YxW8X3hY7ymltOwcnuj2lfnJLUzgLyM9pi3ZVwUXlDkeXvIhRNv
	7X+7PdoaBLP1OKuPFc/m4B9VjHckaj/7JeSn9TzMQQzC7Xc/qc0crhOOxkq25HN5bA==
X-Google-Smtp-Source: AGHT+IHdJa918SEwmhFNZb9Q24PsUx6pNGvVFc1dwc6WaTnzKMVFSWDS0EQ/dI9bpmIEWjSAjCuEdQ==
X-Received: by 2002:a05:6808:4098:b0:3c1:ac81:54bf with SMTP id db24-20020a056808409800b003c1ac8154bfmr1282352oib.32.1709023534117;
        Tue, 27 Feb 2024 00:45:34 -0800 (PST)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id h16-20020a056808015000b003c178f6a504sm1406646oie.14.2024.02.27.00.45.33
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 00:45:33 -0800 (PST)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6e497a1481cso639513a34.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Feb 2024 00:45:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVOyIKY48YSPs1rTd3f3s/E9yl8jC0JG66TkUfQhvsdHFsKZH+q1HoMfKaZGrf5GSQo/JqDiaW5/Y4GoTrpKP+gsOD8By7rfJvpGhy7pq4/
X-Received: by 2002:a25:84c7:0:b0:dc7:496e:42e1 with SMTP id
 x7-20020a2584c7000000b00dc7496e42e1mr1414712ybm.51.1709023513209; Tue, 27 Feb
 2024 00:45:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226161414.2316610-1-arnd@kernel.org> <20240226161414.2316610-2-arnd@kernel.org>
In-Reply-To: <20240226161414.2316610-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 09:45:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVCWF50SO1TK5F5Q8sN08THKJ+F6gt9u5pD05gJUZ+E9w@mail.gmail.com>
Message-ID: <CAMuHMdVCWF50SO1TK5F5Q8sN08THKJ+F6gt9u5pD05gJUZ+E9w@mail.gmail.com>
Subject: Re: [PATCH 1/4] arch: consolidate existing CONFIG_PAGE_SIZE_*KB definitions
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

On Mon, Feb 26, 2024 at 5:14=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
> From: Arnd Bergmann <arnd@arndb.de>
>
> These four architectures define the same Kconfig symbols for configuring
> the page size. Move the logic into a common place where it can be shared
> with all other architectures.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/arch/Kconfig
> +++ b/arch/Kconfig

> +config PAGE_SIZE_4KB
> +       bool "4KB pages"

Now you got rid of the 4000-byte ("4kB") pages and friends, please
do not replace these by Kelvin-bytes, and use the official binary
prefixes =3D> "4 KiB".

> +       depends on HAVE_PAGE_SIZE_4KB

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
