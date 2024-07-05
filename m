Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C642BCF6
	for <linux-m68k@lists.linux-m68k.org>; Fri,  5 Jul 2024 08:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720168933; cv=none; b=fgoZJxncZLvKV52n6ukUeoXBgs+c4b8kmBy3cpKfA7pDCKFQ3sa7ZnioAkddoMB0KMkgV8QV32osFnrujKR9NQ8u8XhDGhpIpa1KK/txYxV02viuZ7kTFxOvRAA7/X6Jq8cf+aG+MQ2nbAZ58qpjHfLnOcTHBV056JXbGfttso8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720168933; c=relaxed/simple;
	bh=MdoD1uQx97BWhsq7cxMfuLw5Tx+Ae9TieFeMHspDm5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jGqq1UpbiTw1PFyfkU/Q/ODaI7ITWN+cDijp+4u9FKY3cN9QSueCVdgUubLkcT1ZgVa8E5Wj7HDYF5bzGTASEsTmymH3hgtAT3jtFdUzaPIdjjQeKcp9kr/4zkaO1L6PhsjeFljj5P1i8pkaTT/QPTYFercMNy0vS9V/LoCHOCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-630640c1e14so13726587b3.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 05 Jul 2024 01:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720168930; x=1720773730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fb3nvPpoeDCMYNDscdzi/DI3phzoUDDiLMAUKJgL9UA=;
        b=W3nmVmJfQRBCXYzEmCWl2pUbtjf2jFOJrWS78+Z0MIxY0mjUlY1qAkmtw2WXy9KGRc
         Q9TJr8Mk6ULd7nBtRxx3PkI1FFoVeAHCBUwB2N6DrbOh1JTultGQAfu1aMHJRhE4DzQm
         nIJOVLgxEznPR8YPzc4+pnx5rpSeedbbij4jn+sqsT+TmT3bO+5Il9v7yoGnG+qNXZun
         fim3t2aSm6KSi/8UWOVMcqGgD078im+ZqPftaf9tNu/0P9GiMywXfv8C5vpFbZU4nJ4i
         TWOiDFuwweVA3u6D87KUU17Z/1INbzRJDb2BIgVVnqHWRBuhxde885dYFod6z/gSi17M
         hK0A==
X-Forwarded-Encrypted: i=1; AJvYcCUKwEpip5q1H0R1L0ryPimh3mVTpc5XTXUPEaDZ4j4yHeZxlbR84KpN+ml/PV4XEToiwQO5loZWydkKE9m383fJEV28O4TC2u2egwOFPVdH
X-Gm-Message-State: AOJu0YxRGOBO2oBReL6K6U/MRnhsqRu8U3k9yYRFan3bwneZ6nIXDor1
	yWhJtrsiT6Gfl7E0J0rbVeiZ6JLQY6IuQ6V7BNMJ6W1Hfb9ufyrWlaqge+E9
X-Google-Smtp-Source: AGHT+IFwxG5gCjlWzs1tnnY99rxeHR2P/o0Ads2GaFzkEP/mbldWS1AhW0DYUz2k38C11/c5nVN00w==
X-Received: by 2002:a05:690c:670b:b0:64b:2017:b74c with SMTP id 00721157ae682-652d823f524mr47615037b3.49.1720168930288;
        Fri, 05 Jul 2024 01:42:10 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9bf32eadsm27985787b3.122.2024.07.05.01.42.10
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 01:42:10 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-651da7c1531so12649867b3.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 05 Jul 2024 01:42:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVSH9vus3RzekyqScyqAvLtAkOWjRMfxyDODUWtq33EcxJy6bsff29LZR8T4pOZqMt7quxtsEDrCvPBeL58s7bDMp7zCEC3MFRRby8w5TBe
X-Received: by 2002:a81:9253:0:b0:647:eaea:f4de with SMTP id
 00721157ae682-652d823ea66mr38523167b3.47.1720168929990; Fri, 05 Jul 2024
 01:42:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240705081508.2110169-1-hch@lst.de> <20240705081508.2110169-2-hch@lst.de>
In-Reply-To: <20240705081508.2110169-2-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jul 2024 10:41:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCHRtRVQ4Vp40OmhwVz=KXgD3pdF6jkX4-UwQrQ_XtQw@mail.gmail.com>
Message-ID: <CAMuHMdUCHRtRVQ4Vp40OmhwVz=KXgD3pdF6jkX4-UwQrQ_XtQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] block: pass a phys_addr_t to get_max_segment_size
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-m68k@lists.linux-m68k.org, 
	linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Fri, Jul 5, 2024 at 10:15=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
> Work on a single address to simplify the logic, and prepare the callers
> from using better helpers.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch!

> --- a/block/blk-merge.c
> +++ b/block/blk-merge.c
> @@ -207,25 +207,22 @@ static inline unsigned get_max_io_size(struct bio *=
bio,
>  }
>
>  /**
> - * get_max_segment_size() - maximum number of bytes to add as a single s=
egment
> + * get_max_segment_size() - maximum number of bytes to add to a single s=
egment
>   * @lim: Request queue limits.
> - * @start_page: See below.
> - * @offset: Offset from @start_page where to add a segment.
> + * @paddr: address of the range to add
>   *
> - * Returns the maximum number of bytes that can be added as a single seg=
ment.
> + * Returns the maximum number of bytes of the range starting at @addr th=
at can

@paddr

> + * be added to a single request.
>   */

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
