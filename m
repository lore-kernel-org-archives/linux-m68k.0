Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AEA14F9FD
	for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Jan 2025 16:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737994905; cv=none; b=Mdjh9uU8UaFyfNowHK7Gx+6wzjAqLgACQL5/WvcE3iG5V2ohoHgkVqPd2TUiX3c+2eRgYRq6mi0qUfWA8EQ/XeLYutnkoXNAsG9W0NJfoGw9jZ+L6OFBf595gOEtvw2mRoofRcxNvBDOR+rwQLktyl0EPV1Jg3r0Ukuoucke7zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737994905; c=relaxed/simple;
	bh=9zboAYYsia2n4IduI3z/U3t1jmKc8HJmonBTt/8Myc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SuawFIvMf44HSjNVX4cWHpPiI4rFTk6By7s5pwupxyzfIeBPy5CGYUzdhiLIYYX/MEbWAukEd29GjnWMaD0HVzhwILIiHeLX/4dd7r4ytKnDAwUKqNTs+W33ZEYeUUqQ+HCiEHmIMj2LxYAEAD5QjEbFe7ewmjSVCNM519qr3GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4affbb7ef2dso3829646137.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Jan 2025 08:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737994901; x=1738599701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45OoBPJoV8zGfJClLFYbCrAaSSdq0Hy4HHZ9q0U58K4=;
        b=ISqdy19HVCc0ONS2TziZwzY+3L2Kgu2Z3C6OQy9ftOczoSOh4nRWYM6c/GdfaIP5rq
         lWAjknvAkO+MRPfX2aqXLOQhUW0D8h7lrIl/9aqTExpcYUKOAxzkihDJ3HGsMgsQEsZQ
         T/wpFd+0v0yna7okZL4rjBHttXX2yBwHasxdXh3avM1YmR69CkkzlEtZbojos45kN0Ho
         H9At9bYC/nWauudWe48xzc6nL0huNRAHRxTbRH27Yse1M001YdAe67tnRbBpcxLjY0sR
         7vcezGDybHxZ/xLcb422iBH55+Dx4BZDS89x4wB+T2fDjVwC8nMRvB7YbaWXDP1F3ezS
         oF6A==
X-Forwarded-Encrypted: i=1; AJvYcCUeKUo6eIXRfMalvrebOaB0FeSMM1BSvZybfe9s+HrttPOUs2RxHXOluit5ZBc6WCt0IZ48n8MoMG3D@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyYwNdnCqpDdEid1iWS2DyKAdZO7wBJR7QNBEu7NTf4ceNzrl5F
	7tfSK23sHUPxKOfZ2lwsdKfZ89GmuvDvG71fOLyKjBY+8Vkepu8zWWZZZ78C/+8=
X-Gm-Gg: ASbGncvWfQ6iN0rr2xp8w1sdFdm2taVc5i2vA3rhofp/bWhyGWRKJRxhwsZciPsZp5b
	lpOFB/8FgadWTdIJ2RjkBXnIKPQqMFGW+x87pOluYZjF21QlWqr/U6p5F368Nfr8czLXk4lDDhI
	XOhjnAf4FKdjTrbneaEyltNkNj1zHRsL3YhIwiet+OXEWmt1mlO7oRdjZXk6xMsh0PWdLGr1E1B
	2pv4wCejbSvnY5lTqLzu801vhn5CN2b72p0iDXLosoDRXYg1igqs7S3s40ATuKH5k4H3VUSN6o7
	NhR/RL/pytyHlTS8ymT3zRXfMPPORRd7uJrsFxZ2/Bo=
X-Google-Smtp-Source: AGHT+IEpt/FIN9Pyp1eBt8I3pXLbRHoaxkhDRWEyHm9XHD/QLae8p+MUEyTvriugajTF0Cg2poGBIg==
X-Received: by 2002:a05:6102:1627:b0:4b4:e7e7:56cc with SMTP id ada2fe7eead31-4b69099c6c7mr34321938137.0.1737994900393;
        Mon, 27 Jan 2025 08:21:40 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b70996be33sm1798004137.22.2025.01.27.08.21.40
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 08:21:40 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4afdf300d07so2657133137.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Jan 2025 08:21:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDasMhWbwcmUPWycfzZcuGr4lBK8nmREK6VpkxTCEGS0pqb+cB3iDrF8C40eQvdJ8uQUaox9uaiwCx@lists.linux-m68k.org
X-Received: by 2002:a05:6102:370e:b0:4b1:1a24:e19c with SMTP id
 ada2fe7eead31-4b690bb53cbmr34951549137.7.1737994899878; Mon, 27 Jan 2025
 08:21:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218154613.58754-1-shikemeng@huaweicloud.com> <20241218154613.58754-3-shikemeng@huaweicloud.com>
In-Reply-To: <20241218154613.58754-3-shikemeng@huaweicloud.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jan 2025 17:21:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU_bfadUO=0OZ=AoQ9EAmQPA4wsLCBqohXR+QCeCKRn4A@mail.gmail.com>
X-Gm-Features: AWEUYZm3QsghWJGgtE4-bBJDpa8L-HpWyQPtWRVnePo0_2YvMLY_Y47k7OF49o4
Message-ID: <CAMuHMdU_bfadUO=0OZ=AoQ9EAmQPA4wsLCBqohXR+QCeCKRn4A@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] Xarray: move forward index correctly in xas_pause()
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-nfs@vger.kernel.org, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Kemeng,

On Wed, 18 Dec 2024 at 07:58, Kemeng Shi <shikemeng@huaweicloud.com> wrote:
> After xas_load(), xas->index could point to mid of found multi-index entry
> and xas->index's bits under node->shift maybe non-zero. The afterward
> xas_pause() will move forward xas->index with xa->node->shift with bits
> under node->shift un-masked and thus skip some index unexpectedly.
>
> Consider following case:
> Assume XA_CHUNK_SHIFT is 4.
> xa_store_range(xa, 16, 31, ...)
> xa_store(xa, 32, ...)
> XA_STATE(xas, xa, 17);
> xas_for_each(&xas,...)
> xas_load(&xas)
> /* xas->index = 17, xas->xa_offset = 1, xas->xa_node->xa_shift = 4 */
> xas_pause()
> /* xas->index = 33, xas->xa_offset = 2, xas->xa_node->xa_shift = 4 */
> As we can see, index of 32 is skipped unexpectedly.
>
> Fix this by mask bit under node->xa_shift when move forward index in
> xas_pause().
>
> For now, this will not cause serious problems. Only minor problem
> like cachestat return less number of page status could happen.
>
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>

Thanks for your patch, which is now commit c9ba5249ef8b080c ("Xarray:
move forward index correctly in xas_pause()") upstream.

> --- a/lib/test_xarray.c
> +++ b/lib/test_xarray.c
> @@ -1448,6 +1448,41 @@ static noinline void check_pause(struct xarray *xa)
>         XA_BUG_ON(xa, count != order_limit);
>
>         xa_destroy(xa);
> +
> +       index = 0;
> +       for (order = XA_CHUNK_SHIFT; order > 0; order--) {
> +               XA_BUG_ON(xa, xa_store_order(xa, index, order,
> +                                       xa_mk_index(index), GFP_KERNEL));
> +               index += 1UL << order;
> +       }
> +
> +       index = 0;
> +       count = 0;
> +       xas_set(&xas, 0);
> +       rcu_read_lock();
> +       xas_for_each(&xas, entry, ULONG_MAX) {
> +               XA_BUG_ON(xa, entry != xa_mk_index(index));
> +               index += 1UL << (XA_CHUNK_SHIFT - count);
> +               count++;
> +       }
> +       rcu_read_unlock();
> +       XA_BUG_ON(xa, count != XA_CHUNK_SHIFT);
> +
> +       index = 0;
> +       count = 0;
> +       xas_set(&xas, XA_CHUNK_SIZE / 2 + 1);
> +       rcu_read_lock();
> +       xas_for_each(&xas, entry, ULONG_MAX) {
> +               XA_BUG_ON(xa, entry != xa_mk_index(index));
> +               index += 1UL << (XA_CHUNK_SHIFT - count);
> +               count++;
> +               xas_pause(&xas);
> +       }
> +       rcu_read_unlock();
> +       XA_BUG_ON(xa, count != XA_CHUNK_SHIFT);
> +
> +       xa_destroy(xa);
> +
>  }

On m68k, the last four XA_BUG_ON() checks above are triggered when
running the test.  With extra debug prints added:

    entry = 00000002 xa_mk_index(index) = 000000c1
    entry = 00000002 xa_mk_index(index) = 000000e1
    entry = 00000002 xa_mk_index(index) = 000000f1
    ...
    entry = 000000e2 xa_mk_index(index) = fffff0ff
    entry = 000000f9 xa_mk_index(index) = fffff8ff
    entry = 000000f2 xa_mk_index(index) = fffffcff
    count = 63 XA_CHUNK_SHIFT = 6
    entry = 00000081 xa_mk_index(index) = 00000001
    entry = 00000002 xa_mk_index(index) = 00000081
    entry = 00000002 xa_mk_index(index) = 000000c1
    ...
    entry = 000000e2 xa_mk_index(index) = ffffe0ff
    entry = 000000f9 xa_mk_index(index) = fffff0ff
    entry = 000000f2 xa_mk_index(index) = fffff8ff
     count = 62 XA_CHUNK_SHIFT = 6

On arm32, the test succeeds, so it's probably not a 32-vs-64-bit issue.
Perhaps a big-endian or alignment issue (alignof(int/long) = 2)?

> --- a/lib/xarray.c
> +++ b/lib/xarray.c
> @@ -1147,6 +1147,7 @@ void xas_pause(struct xa_state *xas)
>                         if (!xa_is_sibling(xa_entry(xas->xa, node, offset)))
>                                 break;
>                 }
> +               xas->xa_index &= ~0UL << node->shift;
>                 xas->xa_index += (offset - xas->xa_offset) << node->shift;
>                 if (xas->xa_index == 0)
>                         xas->xa_node = XAS_BOUNDS;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
