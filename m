Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B888E1BDE0
	for <linux-m68k@lists.linux-m68k.org>; Wed,  3 Jan 2024 16:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-596175c0be0so122197eaf.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 03 Jan 2024 08:12:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704298355; x=1704903155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SGUYue1hsQCNLrCF4HXCzjQx8nMIh5sStGYQ5m2PA10=;
        b=E1O6px8jCDj66uUxxb2mirCmCv7Fe7T5YdURM5W1KgT8Nj0OE2vNHFXDNShjbEx/2a
         SPgdBYATRq/8FUFIEj+xgckzLRDCag7ePBG9QlVzFLHojlgLbVyq6wpBf0okXmTd8blQ
         xOlq0c3t19NKrb82Cp3iTLoR3ycJVqF7yAV1tIBMYVH6WCKJpzoKRy1CDrlmpeyZU/37
         hw3+0GW6J9EAJVOSxWxb80CrNkZRk3usReheJ21K1WsRlUZwGe9Rdmf+gPZ2EbbPKPN9
         skZjcpWHd+YF+nziiUYELNAjjipVvK23/726cm9P9tTuF9P7d3LSHmFSL+WEy4/wODr2
         F4GQ==
X-Gm-Message-State: AOJu0YxXVYa3VNKVUjnUZY0KCP2nugyZVU4Yavj7/0XjIuKW760YIg/u
	aknV3GE9tVhpEvCd1fJWAQDT2Soe6xb4nNri
X-Google-Smtp-Source: AGHT+IHuRpNEYOMss9p249kOuG+0wIgBuR9ANPbQzwwID7ut3aDWQkH9CCUxRLsT2vj63n84BNk3pg==
X-Received: by 2002:a81:4514:0:b0:5eb:6420:bc71 with SMTP id s20-20020a814514000000b005eb6420bc71mr6075288ywa.15.1704191300170;
        Tue, 02 Jan 2024 02:28:20 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id h185-20020a8153c2000000b005e558d0d090sm12116927ywb.6.2024.01.02.02.28.19
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 02:28:19 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5e7c1012a42so74073037b3.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 02 Jan 2024 02:28:19 -0800 (PST)
X-Received: by 2002:a81:b661:0:b0:5f3:6024:53c with SMTP id
 h33-20020a81b661000000b005f36024053cmr393594ywk.32.1704191299465; Tue, 02 Jan
 2024 02:28:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20221111081316.30373-1-mailhol.vincent@wanadoo.fr>
 <20231217071250.892867-1-mailhol.vincent@wanadoo.fr> <20231217071250.892867-2-mailhol.vincent@wanadoo.fr>
In-Reply-To: <20231217071250.892867-2-mailhol.vincent@wanadoo.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jan 2024 11:28:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUvqY4VLDS0mW2VbSzTmef9xt+F3FCpRj5-Mv+KeOqyXg@mail.gmail.com>
Message-ID: <CAMuHMdUvqY4VLDS0mW2VbSzTmef9xt+F3FCpRj5-Mv+KeOqyXg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] m68k/bitops: force inlining of all bitops functions
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

Hi Vincent,

Thanks for your patch!

On Sun, Dec 17, 2023 at 8:13=E2=80=AFAM Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
> The inline keyword actually does not guarantee that the compiler will
> inline a functions. Whenever the goal is to actually inline a
> function, __always_inline should always be preferred instead.
>
> On an allyesconfig, with GCC 13.2.1, it saves roughly 5 KB.
>
>   $ size --format=3DGNU vmlinux.before vmlinux.after
>         text       data        bss      total filename
>     60449738   70975612    2288988  133714338 vmlinux.before
>     60446534   70972412    2289596  133708542 vmlinux.after

With gcc 9.5.0-1ubuntu1~22.04, the figures are completely different
(i.e. a size increase):

allyesconfig:

      text       data        bss      total filename
  58878600   72415994    2283652  133578246 vmlinux.before
  58882250   72419706    2284004  133585960 vmlinux.after

atari_defconfig:

      text       data        bss      total filename
   4112060    1579862     151680    5843602 vmlinux-v6.7-rc8
   4117008    1579350     151680    5848038
vmlinux-v6.7-rc8-1-m68k-bitops-force-inlining

The next patch offsets that for allyesconfig, but not for atari_defconfig.

> Reference: commit 8dd5032d9c54 ("x86/asm/bitops: Force inlining of
> test_and_set_bit and friends")

Please don't split lines containing tags.

> Link: https://git.kernel.org/torvalds/c/8dd5032d9c54
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
