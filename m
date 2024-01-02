Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5591CA90
	for <linux-m68k@lists.linux-m68k.org>; Wed,  3 Jan 2024 19:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-781048954d9so869756385a.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 03 Jan 2024 11:08:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704308935; x=1704913735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0kwXnD1UP7IPHyIP7CHVuBK/DoK+f+8Bv02dDQmekQ=;
        b=WDghRlgV5KsW9IsJqfWcyyfzg6P7VJbDsu2ApmioMO+br4uM7qGa/5Vjyy6a//b2J9
         fHGFNC13uVSa2kJTcXBXgQR0RzEIv5rdCFP9rKl1x/mSe8ZUaDK4IvYBxqvtHn4AwK9+
         OAuzkZi7+MDPiKRXBBPfdfjhXQH+4fUu4XElgJs7vbVKrXJJIrnqeJrzK34cvcQTyvM1
         k41lhK3CHu69ccMFQCjR3sXdVUbHXJhVAQc3y79TL9jztBsXr2GPhlqGBLKk+/jfwPaf
         dzjdYXFysbTaquKK9yH5P7qUU5UEAHohQ2wf/ckyH2YL//YayHqabBj1Qmh+B80LX9xU
         W/zA==
X-Gm-Message-State: AOJu0YzBuR3/PLelZ3U3OLOa6NL15+aqFdqOOEfieYJEuhqiWJ76Gnc1
	/SK9TWtvk66vVfGeTFij/1jIQrhLaOCu/M0E
X-Google-Smtp-Source: AGHT+IFtE3E9eXBmXsiZzK2IbLxu2bwAOYDXkT2EfJQ2WqRI8arz6crOdrD92Bn0EogAL3/K27MC/g==
X-Received: by 2002:a81:b507:0:b0:5ee:9348:54e2 with SMTP id t7-20020a81b507000000b005ee934854e2mr5609539ywh.34.1704192556633;
        Tue, 02 Jan 2024 02:49:16 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id m10-20020a81ae0a000000b005e93869ebd6sm11748112ywh.25.2024.01.02.02.49.15
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 02:49:15 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5f0c0ca5ef1so19350997b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 02 Jan 2024 02:49:15 -0800 (PST)
X-Received: by 2002:a81:af49:0:b0:5e9:fa4a:fd32 with SMTP id
 x9-20020a81af49000000b005e9fa4afd32mr10248043ywj.44.1704192555251; Tue, 02
 Jan 2024 02:49:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20221111081316.30373-1-mailhol.vincent@wanadoo.fr>
 <20231217071250.892867-1-mailhol.vincent@wanadoo.fr> <20231217071250.892867-3-mailhol.vincent@wanadoo.fr>
In-Reply-To: <20231217071250.892867-3-mailhol.vincent@wanadoo.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jan 2024 11:49:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdULzic+NC+PA7fOZzaXbJnmW+MfCv05j3xJdj1qxPeyQQ@mail.gmail.com>
Message-ID: <CAMuHMdULzic+NC+PA7fOZzaXbJnmW+MfCv05j3xJdj1qxPeyQQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] m68k/bitops: use __builtin_{clz,ctzl,ffs} to
 evaluate constant expressions
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	Yury Norov <yury.norov@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Douglas Anderson <dianders@chromium.org>, Kees Cook <keescook@chromium.org>, 
	Petr Mladek <pmladek@suse.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Marco Elver <elver@google.com>, Brian Cain <bcain@quicinc.com>, 
	Matthew Wilcox <willy@infradead.org>, "Paul E . McKenney" <paulmck@kernel.org>, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 17, 2023 at 8:13=E2=80=AFAM Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
>
> The compiler is not able to do constant folding on "asm volatile" code.
>
> Evaluate whether or not the function argument is a constant expression
> and if this is the case, return an equivalent builtin expression.
>
> On an allyesconfig, with GCC 13.2.1, it saves roughly 8 KB.
>
>   $ size --format=3DGNU vmlinux.before vmlinux.after
>         text       data        bss      total filename
>     60446534   70972412    2289596  133708542 vmlinux.before
>     60429746   70978876    2291676  133700298 vmlinux.after

Still a win with gcc 9.5.0-1ubuntu1~22.04:

allyesconfig:

      text       data        bss      total filename
  58882250   72419706    2284004  133585960
vmlinux-v6.7-rc8-1-m68k-bitops-force-inlining
  58863570   72419546    2285860  133568976
vmlinux-v6.7-rc8-2-m68k-bitops-use-__builtin_clz,ctzl,ffs

So an even bigger win...

atari_defconfig:

      text       data        bss      total filename
   4117008    1579350     151680    5848038
vmlinux-v6.7-rc8-1-m68k-bitops-force-inlining
   4116940    1579534     151712    5848186
vmlinux-v6.7-rc8-2-m68k-bitops-use-__builtin_clz,ctzl,ffs

... but a small size increase here.


>
> Reference: commit fdb6649ab7c1 ("x86/asm/bitops: Use __builtin_ctzl()
> to evaluate constant expressions")

Please don't split lines containing tags.

> Link: https://git.kernel.org/torvalds/c/fdb6649ab7c1
>
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
