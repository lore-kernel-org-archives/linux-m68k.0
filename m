Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A034E153808
	for <linux-m68k@lists.linux-m68k.org>; Thu,  6 Feb 2025 07:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738827274; cv=none; b=IswQqJ+iqNP/Lzgg2Uai1H+vzPRdtQ0WgnRhhN6WRCEfYdSPLHdZp08iYwCwyFBZ6wXcr3lPBaGfjUAQWP6Vi4uuD3x2wTTLededX1nQ5R8g4Ldv5BYtQCQXOVDOVbSwcA6wAaubOa6/NbRKh4ZodgW5o43QBpmmo+2Xk3q1z+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738827274; c=relaxed/simple;
	bh=ZqC215pGfYAb7flXSAc08+IrFcFj62WGS6CVa6R7k4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dRj70tATdZNtogNYh83igyOMIjqstO+CqiMwmYGLfLUkmYvPbWz7PC0/RxAVANmpS/W1V4i74gGUJFbXBVHZxFL1lg7aw6ga4DN/ds6xLtWRg6GUj6w9Iv3ZtwEjQIkYALtZ9ome381aH4UT1IIRPuhz2LGezTQIBw6wtH1v7Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4ba7d7aa995so8113137.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 05 Feb 2025 23:34:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738827270; x=1739432070;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYqxjen2ckyh6AMFJqNUH79gwyV2vSuAN69CefkfgXQ=;
        b=OXRUbhhQ5XAoXheAeUUsbrSzZ3OA1e0kjt2MWo4gzEN216MRDUNVQpzwoQnVGz5Z9O
         fOkwUD9zE8Q8i+V4J8P1RPHWctuuVj9VkZ30abpR1hCT7Z//yekeLkNSqs7FVa+VGJxs
         Cu/lkALHQaD6yJEKZsaaPP/qf8LX1vCPdkHEb/+SCKaiMktydlUvtDZfPZhcCJbxmWoi
         A/jXg3R2XhuYH3nu3uU4RA0Gmdml1E3vvLl3Js7vU+dkcY19FX7+hGsxbK9d/YtAG0Xe
         4d3JiQr2douF1UzmaQxvHBjQMN2oGfNMR28QH15YT1oHTuOHmXSlSBxqqF3/yFOK+EGd
         0WFA==
X-Forwarded-Encrypted: i=1; AJvYcCX++Zwv4ZL1J8Bob/H2ngs9IB5E3oJc43Rl+sA3zdskoPOQNA5nrecSFzyhu1NdzGBpYHn9vWKvHvW7@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy191KQBvsRmoqQt9GxDsFaC2cZkEZIm9KaEWT/KjByGlcZZ8PT
	MifTIJ9rxawxQInfiKqNEfwkgM0df0qVG+I4DrgEY4TToMLPRcg6A01DjueR
X-Gm-Gg: ASbGncuzVBTM3HJEah1zTqK233A7JOC+yYRTT807ipylQdiJWrtUoey2sZ78EUNXhhh
	Gl03RHYKQDN7NgQkPmaXHj3E+mcz+kD/aVxoVN0g15z+jeXpkiSEbKgTwl6H+z2OCVjvdszrwri
	ePfk3EudLOy7ZJj53MBqu6h+vgYvJKKDkpUHKuAIm2c30TAT4UCL8eGQ3sTz4t2t+4zQbi8V8Cr
	MCsVMZAfgPEjbGIY+yEAW9u9ukPUd5HRqYPQ0pWIr8uUDScjq2JbJ/haFB1j7wBzj3C+/LnjnWR
	lGDYR0qDbVuBKhIBT/dzPqetRlqyeNNVRhx+qsvRO38LbnZMUnp9pw==
X-Google-Smtp-Source: AGHT+IH/Z1OGLnSZzn+Tpruvd4PnuAvi9f/YTdFoWTIT93KznMy1APhtYbJHUJPtupvV3VNV7vt5QA==
X-Received: by 2002:a05:6102:2ac2:b0:4af:ea3b:7b31 with SMTP id ada2fe7eead31-4ba478e7ae1mr2785131137.14.1738827269701;
        Wed, 05 Feb 2025 23:34:29 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f97d8c6asm108616241.21.2025.02.05.23.34.29
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 23:34:29 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-866f61c01e5so160101241.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 05 Feb 2025 23:34:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXH/zkljAli0cLwOoeGEnQsEW0p9ynV12zH5B9W5w5G01JHa4EK9KMnOEJAfa9Uoqc3z9X78ts3a1ZT@lists.linux-m68k.org
X-Received: by 2002:a05:6102:cd3:b0:4b2:5c4b:b0aa with SMTP id
 ada2fe7eead31-4ba47a69fd7mr3852490137.17.1738827268953; Wed, 05 Feb 2025
 23:34:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218154613.58754-1-shikemeng@huaweicloud.com>
 <20241218154613.58754-3-shikemeng@huaweicloud.com> <CAMuHMdU_bfadUO=0OZ=AoQ9EAmQPA4wsLCBqohXR+QCeCKRn4A@mail.gmail.com>
 <82014768-2ea7-2a28-cade-99d5d8ebe59e@huaweicloud.com>
In-Reply-To: <82014768-2ea7-2a28-cade-99d5d8ebe59e@huaweicloud.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Feb 2025 08:34:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWT05uMjEassapuFr7podb_eH=T14SOyS4yW4Wh7DUcTQ@mail.gmail.com>
X-Gm-Features: AWEUYZlF1WKVp8XKeZEs4N8gBdQGzZtMTGkdvJadBBpYovB0_UlZtliJmtMLsz0
Message-ID: <CAMuHMdWT05uMjEassapuFr7podb_eH=T14SOyS4yW4Wh7DUcTQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] Xarray: move forward index correctly in xas_pause()
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-nfs@vger.kernel.org, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Kemeng,

On Thu, 6 Feb 2025 at 07:13, Kemeng Shi <shikemeng@huaweicloud.com> wrote:
> on 1/28/2025 12:21 AM, Geert Uytterhoeven wrote:
> > On Wed, 18 Dec 2024 at 07:58, Kemeng Shi <shikemeng@huaweicloud.com> wrote:
> >> After xas_load(), xas->index could point to mid of found multi-index entry
> >> and xas->index's bits under node->shift maybe non-zero. The afterward
> >> xas_pause() will move forward xas->index with xa->node->shift with bits
> >> under node->shift un-masked and thus skip some index unexpectedly.
> >>
> >> Consider following case:
> >> Assume XA_CHUNK_SHIFT is 4.
> >> xa_store_range(xa, 16, 31, ...)
> >> xa_store(xa, 32, ...)
> >> XA_STATE(xas, xa, 17);
> >> xas_for_each(&xas,...)
> >> xas_load(&xas)
> >> /* xas->index = 17, xas->xa_offset = 1, xas->xa_node->xa_shift = 4 */
> >> xas_pause()
> >> /* xas->index = 33, xas->xa_offset = 2, xas->xa_node->xa_shift = 4 */
> >> As we can see, index of 32 is skipped unexpectedly.
> >>
> >> Fix this by mask bit under node->xa_shift when move forward index in
> >> xas_pause().
> >>
> >> For now, this will not cause serious problems. Only minor problem
> >> like cachestat return less number of page status could happen.
> >>
> >> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> >
> > Thanks for your patch, which is now commit c9ba5249ef8b080c ("Xarray:
> > move forward index correctly in xas_pause()") upstream.
> >
> >> --- a/lib/test_xarray.c
> >> +++ b/lib/test_xarray.c
> >> @@ -1448,6 +1448,41 @@ static noinline void check_pause(struct xarray *xa)
> >>         XA_BUG_ON(xa, count != order_limit);
> >>
> >>         xa_destroy(xa);
> >> +
> >> +       index = 0;
> >> +       for (order = XA_CHUNK_SHIFT; order > 0; order--) {
> >> +               XA_BUG_ON(xa, xa_store_order(xa, index, order,
> >> +                                       xa_mk_index(index), GFP_KERNEL));
> >> +               index += 1UL << order;
> >> +       }
> >> +
> >> +       index = 0;
> >> +       count = 0;
> >> +       xas_set(&xas, 0);
> >> +       rcu_read_lock();
> >> +       xas_for_each(&xas, entry, ULONG_MAX) {
> >> +               XA_BUG_ON(xa, entry != xa_mk_index(index));
> >> +               index += 1UL << (XA_CHUNK_SHIFT - count);
> >> +               count++;
> >> +       }
> >> +       rcu_read_unlock();
> >> +       XA_BUG_ON(xa, count != XA_CHUNK_SHIFT);
> >> +
> >> +       index = 0;
> >> +       count = 0;
> >> +       xas_set(&xas, XA_CHUNK_SIZE / 2 + 1);
> >> +       rcu_read_lock();
> >> +       xas_for_each(&xas, entry, ULONG_MAX) {
> >> +               XA_BUG_ON(xa, entry != xa_mk_index(index));
> >> +               index += 1UL << (XA_CHUNK_SHIFT - count);
> >> +               count++;
> >> +               xas_pause(&xas);
> >> +       }
> >> +       rcu_read_unlock();
> >> +       XA_BUG_ON(xa, count != XA_CHUNK_SHIFT);
> >> +
> >> +       xa_destroy(xa);
> >> +
> >>  }
> >
> > On m68k, the last four XA_BUG_ON() checks above are triggered when
> > running the test.  With extra debug prints added:
> >
> >     entry = 00000002 xa_mk_index(index) = 000000c1
> >     entry = 00000002 xa_mk_index(index) = 000000e1
> >     entry = 00000002 xa_mk_index(index) = 000000f1
> >     ...
> >     entry = 000000e2 xa_mk_index(index) = fffff0ff
> >     entry = 000000f9 xa_mk_index(index) = fffff8ff
> >     entry = 000000f2 xa_mk_index(index) = fffffcff
> >     count = 63 XA_CHUNK_SHIFT = 6
> >     entry = 00000081 xa_mk_index(index) = 00000001
> >     entry = 00000002 xa_mk_index(index) = 00000081
> >     entry = 00000002 xa_mk_index(index) = 000000c1
> >     ...
> >     entry = 000000e2 xa_mk_index(index) = ffffe0ff
> >     entry = 000000f9 xa_mk_index(index) = fffff0ff
> >     entry = 000000f2 xa_mk_index(index) = fffff8ff
> >      count = 62 XA_CHUNK_SHIFT = 6
> >
> > On arm32, the test succeeds, so it's probably not a 32-vs-64-bit issue.
> > Perhaps a big-endian or alignment issue (alignof(int/long) = 2)?
> Hi Geert,
> Sorry for late reply. After check the debug info and the code, I think
> the test is failed because CONFIG_XARRAY_MULTI is off. I guess
> CONFIG_XARRAY_MULTI is on arm32 and is off on m68k so the test result
> diffs. Luckly it's only a problem of of test code.
> I will send patch to correct the test code soon. Thanks!

You are right: CONFIG_XARRAY_MULTI is enabled in my arm32 build,
but not in my m68k build.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
